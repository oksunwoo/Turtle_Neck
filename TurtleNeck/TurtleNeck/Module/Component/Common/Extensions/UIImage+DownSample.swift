//
//  UIImage+Extension.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/13.
//

import Foundation
import UIKit

extension UIImage {
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
    
    func addDot(with pose: Pose) -> UIImage {
        guard let pose = pose.predictions.first else {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, true, 0)
        self.draw(at: CGPointMake(0, 0))
        
        let nose = "0"
        let neck = "1"
        let rightShoulder = "2"
        let rightElbow = "3"
        let rightWrist = "4"
        let leftShoulder = "5"
        let leftElbow = "6"
        let leftWrist = "7"
        let rightHip = "8"
        let rightKnee = "9"
        let rightAnkle = "10"
        let leftHip = "11"
        let leftKnee = "12"
        let leftAnkle = "13"
        let rightEye = "14"
        let leftEye = "15"
        let rightEar = "16"
        let leftEar = "17"

        let leftSide = pose.keys.contains(leftEar)
        
        let width = 7.0
        let height = 7.0
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(10.0)
        context.setStrokeColor(UIColor.systemYellow.cgColor)
        
        if leftSide {
            context.addEllipse(in: CGRect(x: pose[nose]!.x, y: pose[nose]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[nose]!.x + 3, y: pose[nose]!.y))
            
            context.addLine(to: CGPoint(x: pose[leftEye]!.x + 2, y: pose[leftEye]!.y))
            context.addEllipse(in: CGRect(x: pose[leftEye]!.x, y: pose[leftEye]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftEye]!.x, y: pose[leftEye]!.y + 4))
            
            context.addLine(to: CGPoint(x: pose[leftEar]!.x, y: pose[leftEar]!.y + 4))
            context.addEllipse(in: CGRect(x: pose[leftEar]!.x, y: pose[leftEar]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftEar]!.x + 2, y: pose[leftEar]!.y))
            
            context.addLine(to: CGPoint(x: pose[leftShoulder]!.x + 2, y: pose[leftShoulder]!.y))
            context.addEllipse(in: CGRect(x: pose[leftShoulder]!.x, y: pose[leftShoulder]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftShoulder]!.x + 4, y: pose[leftShoulder]!.y))
            
            context.addLine(to: CGPoint(x: pose[leftElbow]!.x + 4, y: pose[leftElbow]!.y))
            context.addEllipse(in: CGRect(x: pose[leftShoulder]!.x, y: pose[leftShoulder]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftShoulder]!.x + 4, y: pose[leftShoulder]!.y))
            
            context.addLine(to: CGPoint(x: pose[leftHip]!.x + 4, y: pose[leftHip]!.y))
            context.addEllipse(in: CGRect(x: pose[leftElbow]!.x, y: pose[leftElbow]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftElbow]!.x + 4, y: pose[leftElbow]!.y + 4))
            
            context.addLine(to: CGPoint(x: pose[leftWrist]!.x + 4, y: pose[leftWrist]!.y + 4))
            context.addEllipse(in: CGRect(x: pose[leftWrist]!.x, y: pose[leftWrist]!.y, width: width, height: height))
            
            context.addEllipse(in: CGRect(x: pose[leftHip]!.x, y: pose[leftHip]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftHip]!.x + 4, y: pose[leftHip]!.y))
            
            context.addLine(to: CGPoint(x: pose[leftKnee]!.x + 4, y: pose[leftKnee]!.y))
            context.addEllipse(in: CGRect(x: pose[leftKnee]!.x, y: pose[leftKnee]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftKnee]!.x + 2, y: pose[leftKnee]!.y))
            
            context.addLine(to: CGPoint(x: pose[leftAnkle]!.x + 2, y: pose[leftAnkle]!.y))
            context.addEllipse(in: CGRect(x: pose[leftAnkle]!.x, y: pose[leftAnkle]!.y, width: width, height: height))
        } else {
            context.addEllipse(in: CGRect(x: pose[nose]!.x, y: pose[nose]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[nose]!.x + 3, y: pose[nose]!.y))
            
            context.addLine(to: CGPoint(x: pose[rightEye]!.x, y: pose[rightEye]!.y))
            context.addEllipse(in: CGRect(x: pose[rightEye]!.x, y: pose[rightEye]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightEye]!.x, y: pose[rightEye]!.y + 2))
            
            context.addLine(to: CGPoint(x: pose[rightEar]!.x, y: pose[rightEar]!.y + 2))
            context.addEllipse(in: CGRect(x: pose[rightEar]!.x, y: pose[rightEar]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightEar]!.x + 4, y: pose[rightEar]!.y))
            
            context.addLine(to: CGPoint(x: pose[rightShoulder]!.x + 4, y: pose[rightShoulder]!.y))
            context.addEllipse(in: CGRect(x: pose[rightShoulder]!.x, y: pose[rightShoulder]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightShoulder]!.x + 4, y: pose[rightShoulder]!.y))
            
            context.addLine(to: CGPoint(x: pose[rightElbow]!.x + 4, y: pose[rightElbow]!.y))
            context.addEllipse(in: CGRect(x: pose[rightElbow]!.x, y: pose[rightElbow]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightElbow]!.x + 4, y: pose[rightElbow]!.y + 4))
            
            context.addLine(to: CGPoint(x: pose[rightWrist]!.x + 4, y: pose[rightWrist]!.y + 4))
            context.addEllipse(in: CGRect(x: pose[rightWrist]!.x, y: pose[rightWrist]!.y, width: width, height: height))
            
            context.addEllipse(in: CGRect(x: pose[rightShoulder]!.x, y: pose[rightShoulder]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightShoulder]!.x + 4, y: pose[rightShoulder]!.y))
            
            context.addLine(to: CGPoint(x: pose[rightHip]!.x + 4, y: pose[rightHip]!.y))
            context.addEllipse(in: CGRect(x: pose[rightHip]!.x, y: pose[rightHip]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightHip]!.x + 4, y: pose[rightHip]!.y))
            
            context.addLine(to: CGPoint(x: pose[rightKnee]!.x + 4, y: pose[rightKnee]!.y))
            context.addEllipse(in: CGRect(x: pose[rightKnee]!.x, y: pose[rightKnee]!.y, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightKnee]!.x + 4, y: pose[rightKnee]!.y))
            
            context.addLine(to: CGPoint(x: pose[rightAnkle]!.x + 4, y: pose[rightAnkle]!.y))
            context.addEllipse(in: CGRect(x: pose[rightAnkle]!.x, y: pose[rightAnkle]!.y, width: width, height: height))
        }
        context.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
