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

        let leftSide = pose.keys.contains(leftEar) && pose.keys.contains(leftShoulder)
        let rightSide = pose.keys.contains(rightEar) && pose.keys.contains(rightShoulder)
        
        let width = 3.0
        let height = 3.0
        let xPortion: Double = 330
        let yPortion: Double = 450
        
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(3.0)
        context.setStrokeColor(UIColor.systemYellow.cgColor)
        
        if leftSide {
            context.addEllipse(in: CGRect(x: pose[nose]!.x * xPortion, y: pose[nose]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[nose]!.x * xPortion + 3, y: pose[nose]!.y * yPortion))

            context.addLine(to: CGPoint(x: pose[leftEye]!.x * xPortion + 2, y: pose[leftEye]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[leftEye]!.x * xPortion, y: pose[leftEye]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftEye]!.x * xPortion, y: pose[leftEye]!.y * yPortion + 0.5))

            context.addLine(to: CGPoint(x: pose[leftEar]!.x * xPortion, y: pose[leftEar]!.y * yPortion + 0.5))
            context.addEllipse(in: CGRect(x: pose[leftEar]!.x * xPortion, y: pose[leftEar]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftEar]!.x * xPortion + 2, y: pose[leftEar]!.y * yPortion))
            
            context.addLine(to: CGPoint(x: pose[leftShoulder]!.x * xPortion + 2, y: pose[leftShoulder]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[leftShoulder]!.x * xPortion, y: pose[leftShoulder]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftShoulder]!.x * xPortion + 4, y: pose[leftShoulder]!.y * yPortion))

            context.addLine(to: CGPoint(x: pose[leftElbow]!.x * xPortion + 0.5, y: pose[leftElbow]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[leftShoulder]!.x * xPortion, y: pose[leftShoulder]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftShoulder]!.x * xPortion + 0.5, y: pose[leftShoulder]!.y * yPortion))

            context.addLine(to: CGPoint(x: pose[leftHip]!.x * xPortion + 0.5, y: pose[leftHip]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[leftElbow]!.x * xPortion, y: pose[leftElbow]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftElbow]!.x * xPortion + 0.5, y: pose[leftElbow]!.y * yPortion + 0.5))

            context.addLine(to: CGPoint(x: pose[leftWrist]!.x * xPortion + 0.5, y: pose[leftWrist]!.y * yPortion + 0.5))
            context.addEllipse(in: CGRect(x: pose[leftWrist]!.x * xPortion, y: pose[leftWrist]!.y * yPortion, width: width, height: height))

            context.addEllipse(in: CGRect(x: pose[leftHip]!.x * xPortion, y: pose[leftHip]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftHip]!.x * xPortion + 0.5, y: pose[leftHip]!.y * yPortion))

            context.addLine(to: CGPoint(x: pose[leftKnee]!.x * xPortion + 0.5, y: pose[leftKnee]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[leftKnee]!.x * xPortion, y: pose[leftKnee]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[leftKnee]!.x * xPortion + 0.5, y: pose[leftKnee]!.y * yPortion))

            context.addLine(to: CGPoint(x: pose[leftAnkle]!.x * xPortion + 0.5, y: pose[leftAnkle]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[leftAnkle]!.x * xPortion, y: pose[leftAnkle]!.y * yPortion, width: width, height: height))
        } else if rightSide {
            context.addEllipse(in: CGRect(x: pose[nose]!.x * xPortion, y: pose[nose]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[nose]!.x * xPortion + 3, y: pose[nose]!.y * yPortion))
            
            context.addLine(to: CGPoint(x: pose[rightEye]!.x * xPortion, y: pose[rightEye]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[rightEye]!.x * xPortion, y: pose[rightEye]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightEye]!.x * xPortion, y: pose[rightEye]!.y * yPortion + 2))
            
            context.addLine(to: CGPoint(x: pose[rightEar]!.x * xPortion, y: pose[rightEar]!.y * yPortion + 2))
            context.addEllipse(in: CGRect(x: pose[rightEar]!.x * xPortion, y: pose[rightEar]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightEar]!.x * xPortion + 4, y: pose[rightEar]!.y * yPortion))
            
            context.addLine(to: CGPoint(x: pose[rightShoulder]!.x * xPortion + 4, y: pose[rightShoulder]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[rightShoulder]!.x * xPortion, y: pose[rightShoulder]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightShoulder]!.x * xPortion + 4, y: pose[rightShoulder]!.y * yPortion))
            
            context.addLine(to: CGPoint(x: pose[rightElbow]!.x * xPortion + 4, y: pose[rightElbow]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[rightElbow]!.x * xPortion, y: pose[rightElbow]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightElbow]!.x * xPortion + 4, y: pose[rightElbow]!.y * yPortion + 4))
            
            context.addLine(to: CGPoint(x: pose[rightWrist]!.x * xPortion + 4, y: pose[rightWrist]!.y * yPortion + 4))
            context.addEllipse(in: CGRect(x: pose[rightWrist]!.x * xPortion, y: pose[rightWrist]!.y * yPortion, width: width, height: height))
            
            context.addEllipse(in: CGRect(x: pose[rightShoulder]!.x * xPortion, y: pose[rightShoulder]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightShoulder]!.x * xPortion + 4, y: pose[rightShoulder]!.y * yPortion))
            
            context.addLine(to: CGPoint(x: pose[rightHip]!.x * xPortion + 4, y: pose[rightHip]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[rightHip]!.x * xPortion, y: pose[rightHip]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightHip]!.x * xPortion + 4, y: pose[rightHip]!.y * yPortion))
            
            context.addLine(to: CGPoint(x: pose[rightKnee]!.x * xPortion + 4, y: pose[rightKnee]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[rightKnee]!.x * xPortion, y: pose[rightKnee]!.y * yPortion, width: width, height: height))
            context.move(to: CGPoint(x: pose[rightKnee]!.x * xPortion + 4, y: pose[rightKnee]!.y * yPortion))
            
            context.addLine(to: CGPoint(x: pose[rightAnkle]!.x * xPortion + 4, y: pose[rightAnkle]!.y * yPortion))
            context.addEllipse(in: CGRect(x: pose[rightAnkle]!.x * xPortion, y: pose[rightAnkle]!.y * yPortion, width: width, height: height))
        }
        context.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
