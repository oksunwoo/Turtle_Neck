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
    
    func addDot(with pose: [Pose]) -> UIImage {
        guard let pose = pose.first else {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, true, 0)
        self.draw(at: CGPointMake(0, 0))
        
        let keypoints = pose.keypoints
        let nose = 0
        let leftEye = 3
        let rightEye = 6
        let leftEar = 9
        let rightEar = 12
        let leftShoulder = 15
        let rightShoulder = 18
        let leftElbow = 21
        let rightElbow = 24
        let leftWrist = 27
        let rightWrist = 30
        let leftHip = 33
        let rightHip = 36
        let leftKnee = 39
        let rightKnee = 42
        let leftAnkle = 45
        let rightAnkle = 48
        
        let leftSide = keypoints[leftEye + 2] > keypoints[rightEye + 2] ? true : false
        let width = 7.0
        let height = 7.0
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.systemYellow.cgColor)
        
        if leftSide {
            context.addEllipse(in: CGRect(x: keypoints[nose], y: keypoints[nose + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[nose] + 3, y: keypoints[nose + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[leftEye] + 2, y: keypoints[leftEye + 1]))
            context.addEllipse(in: CGRect(x: keypoints[leftEye], y: keypoints[leftEye + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[leftEye], y: keypoints[leftEye + 1] + 4))
            
            context.addLine(to: CGPoint(x: keypoints[leftEar], y: keypoints[leftEar + 1] + 4))
            context.addEllipse(in: CGRect(x: keypoints[leftEar], y: keypoints[leftEar + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[leftEar] + 2, y: keypoints[leftEar + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[leftShoulder] + 2, y: keypoints[leftShoulder + 1]))
            context.addEllipse(in: CGRect(x: keypoints[leftShoulder], y: keypoints[leftShoulder + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[leftShoulder] + 4, y: keypoints[leftShoulder + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[leftElbow] + 4, y: keypoints[leftElbow + 1]))
            context.addEllipse(in: CGRect(x: keypoints[leftShoulder], y: keypoints[leftShoulder + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[leftShoulder] + 4, y: keypoints[leftShoulder + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[leftHip] + 4, y: keypoints[leftHip + 1]))
            context.addEllipse(in: CGRect(x: keypoints[leftElbow], y: keypoints[leftElbow + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[leftElbow] + 4, y: keypoints[leftElbow + 1] + 4))
            
            context.addLine(to: CGPoint(x: keypoints[leftWrist] + 4, y: keypoints[leftWrist + 1] + 4))
            context.addEllipse(in: CGRect(x: keypoints[leftWrist], y: keypoints[leftWrist + 1], width: width, height: height))
            
            context.addEllipse(in: CGRect(x: keypoints[leftHip], y: keypoints[leftHip + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[leftHip] + 4, y: keypoints[leftHip + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[leftKnee] + 4, y: keypoints[leftKnee + 1]))
            context.addEllipse(in: CGRect(x: keypoints[leftKnee], y: keypoints[leftKnee + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[leftKnee] + 2, y: keypoints[leftKnee + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[leftAnkle] + 2, y: keypoints[leftAnkle + 1]))
            context.addEllipse(in: CGRect(x: keypoints[leftAnkle], y: keypoints[leftAnkle + 1], width: width, height: height))
        } else {
            context.addEllipse(in: CGRect(x: keypoints[nose], y: keypoints[nose + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[nose] + 3, y: keypoints[nose + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[rightEye], y: keypoints[rightEye + 1]))
            context.addEllipse(in: CGRect(x: keypoints[rightEye], y: keypoints[rightEye + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[rightEye], y: keypoints[rightEye + 1] + 2))
            
            context.addLine(to: CGPoint(x: keypoints[rightEar], y: keypoints[rightEar + 1] + 2))
            context.addEllipse(in: CGRect(x: keypoints[rightEar], y: keypoints[rightEar + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[rightEar] + 4, y: keypoints[rightEar + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[rightShoulder] + 4, y: keypoints[rightShoulder + 1]))
            context.addEllipse(in: CGRect(x: keypoints[rightShoulder], y: keypoints[rightShoulder + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[rightShoulder] + 4, y: keypoints[rightShoulder + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[rightElbow] + 4, y: keypoints[rightElbow + 1]))
            context.addEllipse(in: CGRect(x: keypoints[rightElbow], y: keypoints[rightElbow + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[rightElbow] + 4, y: keypoints[rightElbow + 1] + 4))
            
            context.addLine(to: CGPoint(x: keypoints[rightWrist] + 4, y: keypoints[rightWrist + 1] + 4))
            context.addEllipse(in: CGRect(x: keypoints[rightWrist], y: keypoints[rightWrist + 1], width: width, height: height))
            
            context.addEllipse(in: CGRect(x: keypoints[rightShoulder], y: keypoints[rightShoulder + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[rightShoulder] + 4, y: keypoints[rightShoulder + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[rightHip] + 4, y: keypoints[rightHip + 1]))
            context.addEllipse(in: CGRect(x: keypoints[rightHip], y: keypoints[rightHip + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[rightHip] + 4, y: keypoints[rightHip + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[rightKnee] + 4, y: keypoints[rightKnee + 1]))
            context.addEllipse(in: CGRect(x: keypoints[rightKnee], y: keypoints[rightKnee + 1], width: width, height: height))
            context.move(to: CGPoint(x: keypoints[rightKnee] + 4, y: keypoints[rightKnee + 1]))
            
            context.addLine(to: CGPoint(x: keypoints[rightAnkle] + 4, y: keypoints[rightAnkle + 1]))
            context.addEllipse(in: CGRect(x: keypoints[rightAnkle], y: keypoints[rightAnkle + 1], width: width, height: height))
        }
        context.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
