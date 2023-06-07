# 터틀넥
별거 아니라고 생각한 거북목, 이젠 집과 사무실에서 쉽게 자가진단하고 바로잡자

![](https://i.imgur.com/cusvRfT.gif)

## 목차
- [프로젝트 소개](#프로젝트-소개)
- [주요 화면](#주요-화면)
- [파일 구조](#파일-구조)
- [구현 내용](#구현-내용)
- [Architecture](#architecture)
- [Trouble Shooting](#trouble-shooting)

<br>

## 프로젝트 소개
- 이미지내에서 사람을 찾아 인식한 후, 눈, 코, 귀, 어깨, 팔꿈치, 손목, 골반, 무릎, 발목 총 9개의 키포인트를 추출하여 자세를 분석해주는 어플

- 팀원
    - [토니](https://github.com/oksunwoo), [조이](https://github.com/na-young-kwon)
- 진행기간
    - 개발 : 2022. 9. 18 ~ 2023. 1. 20
    - 출시 : 2023. 2. 7

- 기술스택
    - 개발환경 : swift 5.7, xcode 14.2
    - 라이브러리 : `SwiftUI`
    - Deployment Target : iOS 15.0

<br>


## 주요 화면

온보딩|홈 화면|설정
:---:|:---:|:---:
<img src="https://i.imgur.com/ebZt4VG.png" width="250" height="450" />|<img src="https://i.imgur.com/wg4ztvl.png" width="250" height="450" />|<img src="https://i.imgur.com/K9ptRLr.png" width="250" height="450" />
**업로드 화면**|**결과 화면**|**분석 실패 화면**
<img src="https://i.imgur.com/iKF6KSM.png" width="250" height="450" />|<img src="https://i.imgur.com/sjjjV7e.png" width="250" height="450" />|<img src="https://i.imgur.com/hi86yle.png" width="250" height="450" />


<br>


## 파일 구조
```
─── TurtleNeck
    ├── App
    │   ├── Resource
    │   └── Source
    └── Module
        ├── Component
        │   ├── Common
        │   │   ├── CoreData
        │   │   ├── Extensions
        │   │   └── Errors
        │   ├── Model
        │   ├── Services
        │   │   ├── Network
        │   │   ├── Calculator
        │   │   └── ImagePicker
        │   └── DesignSystem
        │       ├── Colors
        │       ├── Shape
        │       ├── Animations
        │       └── Views
        └── Feature
            └── Screen
                ├── Onboarding
                ├── Home
                ├── Upload
                └── Settings
```

<br>


## 구현 내용




### View
- 앱을 처음 설치했을 때, 간단한 설명과 함께 온보딩화면을 보여주도록 구현
- TabView를 사용하여 홈 / 세팅 화면을 전환할 수 있도록 구현
- Path를 사용하여 화면 하단 탭뷰 구성
- HStack으로 과거 분석 결과를 조회할 수 있도록 구현
- 결과 분석 화면 ProgressBar를 사용한 애니메이션효과 구현



### 네트워크
- 카카오포즈 API 활용
- Async / Await을 통해 비동기 통신을 하여 데이터를 주고 받을 수 있도록 구현
- CodingKeys 프로토콜을 사용하여 API 명세에 맞도록 타입 구현
- API통신 결과를 이용하기 위해 JSONDecoder 사용


### 사진 업로드
- UIImagePickerController를 사용하여 사용자의 사진, 카메라에 접근
- 이미지 업로드시 Menu를 사용하여 사진 촬영 / 앨범 중 선택할 수 있도록 구현
- 이미지 미등록시 측정 버튼을 비활성화하여 클릭할 수 없도록 구현
- 데이터통신시 결과를 받아올때까지 Loading Indicator를 통해 유저경험을 높임


### 점수산출방법
- 두 점과 직각을 이루는 점으로 직각 삼각형을 만들고 아크탄젠트(역탄젠트)를 이용해 radian을 구함
- 각도를 알아야 스코어에 반영할 수 있으므로, radian값에 180을 곱하고 파이로 나누어서 각도를 구함
- 구한 각도를 100점 환산점수로 변경한 후, 총 스코어인 100에서 뺄셈을 진행 

### 이미지 관리
- 큰 사이즈의 이미지를 사용하는 경우, 메모리 부족으로 앱이 종료되는 현상을 방지하기 위해 resizing 함
- Render의 경우, 디코딩 시 CPU를 많이 사용하고, 반복적인 렌더링을 실행할 수도 있음
- DownSampling을 통해, 이미지자체의 픽셀을 줄여서 용량을 감소시켜서 더 적은 메모리를 사용함


### CoreData
- 데이터 관리를 담당하는 DataManager인스턴스 활용
- NSPersistentContainer를 통해 Context에 접근 및 데이터 관리
- 자세 분석 성공시 코어데이터에 결과를 저장하도록 구현
- 홈화면이 나타날 때 코어데이터에 저장된 데이터를 불러오도록 구현

<br>

## Architecture

### TCA (The Composable Architecture)
- 단방향 데이터 흐름을 고민하고 일관된 방식으로 어플리케이션을 만들기 위해 도입했습니다.
- 명확한 역할분리를 통해 기능을 추가하거나 수정할 때 해당 레이어만 수정 가능하도록 확장성을 높혔습니다.
- 상태 공유를 통해 화면에서 일어나는 변화를 다른 화면에서 즉시 관측합니다.
- 리듀서와 이펙트를 실행하도록 사용자 액션을 `store`에 보내고 상태를 관찰하여 UI를 업데이트합니다.

![](https://i.imgur.com/RFxp9Wm.jpg)

```
- state : UI를 그릴 때 필요한 데이터에 대한 설명을 나타내는 타입
- action : 사용자의 행동 등 어플리케이션에서 생길 수 있는 모든 행동을 나타내는 타입
- environment : API클라이언트같이 어플리케이션이 필요로하는 의존성을 가지고있는 타입
- reducer : 어떤 action이 주어졌을 때 현재 상태를 다음 상태로 변화시키는 방법을 가지고있는 함수
- store : 실제로 기능이 작동하는 공간
```

<br>


## 고민한 점

### 1. Dependency 관리
- 컴포저블 아키텍쳐에서는 통제된 방식으로 외부 세계와 상호작용할 수 있도록 리듀서에 의존성을 제공합니다.
- 이러한 의존성은 비동기 및 동시적인 컨텍스트에서 사용할 수 있으므로 반드시 sendable 해야합니다. 
- 인터페이스 타입이 sendable한 데이터만 유지하도록 의존성을 관리했습니다.
```swift
struct PoseClient {
    var fetch: @Sendable (Data) async throws -> [Pose]
}
```

### 2. CoreData 사용
- 유저의 과거 자세 분석 결과를 활용하기위해 데이터를 저장할 수 있는 방법을 고민했습니다.
- 로그인기능 없이 앱 삭제전까지 분석기록을 조회할 수 있도록 CoreData를 사용해 데이터를 관리했습니다.
- `DataManager` 를 활용해 `persistent container` 의 `viewContext` 를 가져와 데이터베이스에 접근했습니다.


### 3. 각도 구하는 법 + 구한 각도를 점수로 환산하는 방법
- 두 점의 좌표만으로 어떻게 점수를 구할 수 있을까 고민해보았습니다.
- 좌표에 연장선을 그어 직각삼각형을 만들어내면 각각이 이루는 각을 만들 수 있겠다고 생각했습니다.
- 그래서  두 점과 직각을 이루는 점으로 직각 삼각형을 만들고 원하는 각을 아크탄젠트(역탄젠트) 공식을 이용해 radian을 구하였습니다.
- 구한 radian값에 180을 곱하고 파이로 나누어서 실제 각도를 구할 수 있었고 이를 통해 점수를 계산하였습니다. 


### 4. 왼쪽 / 오른쪽을 구분하는 방법
- 사진의 좌/우측을 어떻게 구분할지 고민했습니다.
- 이미지에서 검출된 키포인트의 데이터 정확성을 비교했습니다.
- 왼쪽 귀와 오른쪽 귀의 키포인트에 대한 신뢰도를 비교하여 각도를 계산했고 점수를 산출했습니다.
- 예) 왼쪽 귀의 신뢰도가 더 크다면 유저가 우측을 바라보고 있다고 판단 후 이미지에 좌표를 표시했습니다.

<br>

## Trouble Shooting

### 1. 사진 촬영 가이드뷰 구현 - keyWindow를 찾을 수 없는 문제

- 문제 상황

```swift
let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
```
화면 최상단에 사진 촬영 가이드뷰를 띄우기 위해 window를 사용했으나 window가 deprecated 되었다는 워닝이 떴습니다.



- 해결 방법
```swift
let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
let window = windowScene?.windows.first
```
Use UIWindowScene.windows on a relevant window scene instead
라고 나와있는 것 처럼 window scene에 접근하는 방법으로 문제를 해결했습니다.

적용모습  
<img src="https://i.imgur.com/aK0EPnu.png" width="200" height="400" />

<br>

### 2. Image DownSampling 
이미지 자체의 픽셀을 줄여서 용량을 감소시키는 방법인 downSampling 입니다.  
파라미터로 size와 scale(기기의 해상도)을 받아서 이미지 크기를 조절하는 방법입니다.

```swift
func downSample(size: CGSize, scale: CGFloat = UIScreen.main.scale) -> UIImage {
        let imageSouceOption = [kCGImageSourceShouldCache: false] as CFDictionary
        let data = self.jpegData(compressionQuality: 1)! as CFData
        let imageSource = CGImageSourceCreateWithData(data, imageSouceOption)!

        let maxPixel = max(size.width, size.height) * scale
        let downSampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxPixel
        ] as CFDictionary

        let downSampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downSampleOptions)!
        let newImage = UIImage(cgImage: downSampledImage)

        return newImage
    }
```
- `kCGImageSourceCreateThumbnailFromImageAlways` - 이미지 소스파일에 썸네일이 있는 경우 전체 이미지에서 썸네일을 작성해야하는지
- `kCGImageSourceShouldCacheImmediately` - 이미지를 디코딩된 형태로 캐시에 넣을지
- `kCGImageSourceCreateThumbnailWithTransform` - 전체 이미지의 방향에 따라 썸네일을 회전하고 비율에 맞게 조정하는지
- `kCGImageSourceThumbnailMaxPixelSize` - 썸네일의 가로세로 픽셀의 최대값 지정
- `CGImageSourceCreateThumbnailAtIndex` - 주어진 이미지에 옵션을 적용해서 CGImage 생성


<br>

### 3. Reducer Protocol로 이전에 따른 변경 사항 적용

old-style reducer 타입이 soft deprecated 됨에 따라 기존에 작성해두었던 코드를 대거 수정했습니다.

#### ReducerProtocol을 채택한 Core 구현

변화의 핵심 포인트는 여러 리듀서를 한 번에 구성하지 않는 것입니다.  
Reducer Protocol을 준수하는 전용 타입을 만들고(PoseCore) 해당 타입 안에서 state, action을 중첩하였습니다.

변경 전

```swift
struct PoseState {
    var imagePickerPresented = false
    // ...
}

enum PoseAction {
    case showImagePicker
    // ...
}

let poseReducer = Reducer<PoseState, PoseAction, PoseEnvironment> { state, action, _ in
    switch action {
    case .showImagePicker:
        state.imagePickerPresented.toggle()
        return .none
    }
}

```

변경 후

```swift
struct PoseCore: ReducerProtocol {
    struct PoseState: Equatable {
        var imagePickerPresented = false
        // ...
    }

    enum PoseAction {
        case showImagePicker
        // ...
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .showImagePicker:
            state.imagePickerPresented.toggle()
            return .none
        }
    }
}

```  
 


#### Optional and pullback reducer
기존에 optional 리듀서가 뷰모 로직이 실행된 후에 실행되는 경우가 있어 자식 리듀서를 nil로 만들지 못하는 버그가 있었습니다.
- body 프로퍼티 사용
- Reducer 엔트리포인트를 사용해 핵심 부모 로직 구현 
- 옵셔널 리듀서 IfLet 오퍼레이터로 체이닝

이를 통해 코드의 정확성을 개선할 수 있었습니다. 


변경 전
```swift
poseReducer
    .optional()
    .pullback(
        state: \.optionalPose,
        action: /RootAction.optionalPose,
        environment: { _ in PoseEnvironment() }
    )
```

변경 후
```swift
var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      // Parent logic
    }
    .ifLet(\.feature, action: /Action.feature) {
      Feature(date: self.date)
    }
}
```  



#### BindingReducer

기존에 binding 메서드를 BindingReducer 타입을 사용하여 변경했습니다.


변경 전

```swift
let poseReducer = Reducer<PoseState, PoseAction, PoseEnvironment> { state, action, _ in
    switch action {
    case .binding(_):
        return .none
        
    case .showImagePicker:
        state.imagePickerPresented.toggle()
        return .none
    }
}
.binding()

```

변경 후
```swift
var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
         switch action {
         case .showImagePicker:
            state.imagePickerPresented.toggle()
            return .none
        }       
    }
    BindingReducer()
}

```


#### Dependencies
기존 코드에서는 상위에서 하위 기능에 이르기까지 모든 종속성이 스레드화되어 종속성 추가, 제거, 변경이 어려웠습니다.  
`@Dependency` 프로퍼티 래퍼를 사용해 추가작업 없이도 종속성에 접근할 수 있도록 변경했습니다.

변경 전

```swift
struct UploadCore: ReducerProtocol {
  let poseClient: PoseClient
  // ...
}
```

변경 후

```swift
struct UploadCore: ReducerProtocol {
    @Dependency (\.poseClient) var poseClient   
    // ...
}
```



\* 참고 문서
https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/migratingtothereducerprotocol/

<br>


### 4. TabBar 구현

 BezierPath를 이용하여 탭바를 구현했습니다.

```swift
 return Path {
    $0.move(to: CGPoint(x: 0, y: 0))
    $0.addLine(to: CGPoint(x: width * 0.3, y: 0))

    $0.addCurve(to: CGPoint(x: rect.midX, y: height),
                control1: CGPoint(x: rect.midX * 0.85, y: rect.minY),
                control2: CGPoint(x: rect.midX * 0.75, y: height))

    $0.addCurve(to: CGPoint(x: width * 0.7, y: 0),
                control1: CGPoint(x: rect.midX * 1.25, y: height),
                control2: CGPoint(x: rect.midX * 1.15, y: rect.minY))
}
```

Path로 Curve 모양을 만들고(빨간색으로 칠해진 부분)  

<img src="https://i.imgur.com/I0yTSnS.png" width="400" height="100" />

색상을 배경색과 같게 설정해주었습니다.  

<img src="https://i.imgur.com/Uggtuzb.png" width="400" height="100" />

<br>

### 5. 탭바가 불투명해지는 문제
스크롤뷰 컨텐츠가 아래에 닿았을 때 탭바가 불투명해지는 문제가 있었습니다.

<img src="https://i.imgur.com/TWhKFcc.png" width="300" height="600" />

탭뷰가 나타날 때 탭바의 백그라운드 이미지에 빈 이미지를 할당하고 istranslucent를 조정하여 해결했습니다.

```swift
TabView()
    .onAppear {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
    }
```

<br> 

### 6. 유저 이미지에 좌표 표시하기
`UIGraphicsBeginImageContextWithOptions()` 을 사용하여 좌표를 표시했습니다.

```swift
extension UIImage {
     func addDat() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, true, 0)
         self.draw(at: CGPointMake(0, 0))
         
         let context = UIGraphicsGetCurrentContext()!
         context.addLine(to: CGPoint(x: keypoints[leftEye] + 2, y: keypoints[leftEye + 1]))
         context.addEllipse(in: CGRect(x: keypoints[leftEye], y: keypoints[leftEye + 1], width: width, height: height))
         context.move(to: CGPoint(x: keypoints[leftEye], y: keypoints[leftEye + 1] + 4))
         // ...
         
         let image = UIGraphicsGetImageFromCurrentImageContext()!
         UIGraphicsEndImageContext()
         return image
     }   
}
```

#### 구현 순서
- UIGraphicsBeginImageContextWithOptions(_: _: _:) 로 비트맵을 만들어줍니다.
- UIView.draw() 로 전달받은 사이즈만큼 다시 그려줍니다.
- context 생성 후 원하는 x, y좌표에 원과 직선을 그립니다.
- UIGraphicsGetImageFromCurrentImageContext() 메서드를 통해 좌표 표시한 이미지를 가져옵니다.
- UIGraphicsEndImageContext()로 비트맵을 그려주는 환경 치워주고 이미지를 반환합니다.

<br> 

### 7. 사진 라이브러리에 접근하기 위한 권한이 항상 필요한가?
지금까지 사진 라이브러리에 접근하기 위해서는 권한이 무조건 필요한 줄 알았으나,  
단순히 접근해서 읽기만 하는 경우에는 명시적으로 권한을 요청할 필요가 없다는 공식문서를 발견했습니다.  

사진을 편집하여 사용자의 사진 라이브러리에 덮어씌우거나, 저장하는 경우에는 권한이 필요하다는 것을 알게되었습니다.  
이를 바탕으로 사진 보관함에 단순히 접근하는 경우`(본 앱에서 카메라버튼 클릭 후 - 사진 보관함을 선택했을 때)` 에는  
명시적으로 권한을 요청하지 않도록 구성했습니다.   

\* 참고한 공식문서  
[Delivering an Enhanced Privacy Experience in Your Photos App](https://developer.apple.com/documentation/photokit/delivering_an_enhanced_privacy_experience_in_your_photos_app)

