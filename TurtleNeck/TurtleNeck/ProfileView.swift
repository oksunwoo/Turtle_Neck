//
//  ProfileHost.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/18.
//

import SwiftUI

struct ProfileView: View {
    @Binding var showingProfile: Bool
    
    var body: some View {
        ScrollView {
            VStack() {
              closeButton()
                Text("Hello zoe")
                    .bold()
                    .font(.title)
                Spacer()
            }
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showingProfile: .constant(true))
    }
}


extension ProfileView {
    func closeButton() -> some View {
        HStack {
            Spacer()
            Button {
                showingProfile.toggle()
            } label: {
                Text("x")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.trailing, 20)
            }
        }
    }
}
