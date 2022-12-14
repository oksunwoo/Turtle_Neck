//
//  DotMaker.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/13.
//

import Foundation
import UIKit

    func addDot(on image: UIImage, with pose: [Pose]) -> UIImage {
        guard let pose = pose.first else {
            return image
        }
        
        UIGraphicsBeginImageContextWithOptions(image.size, true, 0)
        image.draw(at: CGPointMake(0, 0))

        let bbox = pose.bbox
        let keypoints = pose.keypoints
        let context = UIGraphicsGetCurrentContext()!
        let rectangle = CGRectMake(bbox[0], bbox[1], bbox[2], bbox[3])
        
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.systemYellow.cgColor)
        context.addRect(rectangle)
        context.addEllipse(in: CGRect(x: keypoints[0], y: keypoints[1], width: 10, height: 10))
        context.strokePath()
        
       let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }


    
    






















    
    
//    func addDot(on pose: Pose) -> UIImage {
//            UIGraphicsBeginImageContextWithOptions(size, false, 0)
//            self.draw(at: CGPointMake(0,0))
//
//            let bbox = pose.bbox
//            let keyPoint = pose.keypoints
//
//            let leftEar = 9
//            let leftShoulder = 15
//            let leftHip = 33
//            let leftAnkle = 45
//
//            let context = UIGraphicsGetCurrentContext()!
//            let rectangle = CGRectMake(bbox[0], bbox[1], bbox[2], bbox[3])
//
//            context.setLineWidth(2.0)
//            context.setStrokeColor(UIColor.red.cgColor)
//
//            context.addRect(rectangle)
//
//            // 귀
//            context.addEllipse(in: CGRect(x: keyPoint[leftEar], y: keyPoint[leftEar + 1], width: 10, height: 10))
//
//            // 어깨
//            context.addLine(to: CGPoint(x: keyPoint[leftShoulder], y: keyPoint[leftShoulder + 1]))
//            context.addEllipse(in: CGRect(x: keyPoint[leftShoulder], y: keyPoint[leftShoulder + 1], width: 10, height: 10))
//
//            // 엉덩이
//            context.addLine(to: CGPoint(x: keyPoint[leftHip], y: keyPoint[leftHip + 1]))
//            context.addEllipse(in: CGRect(x: keyPoint[leftHip], y: keyPoint[leftHip + 1], width: 10, height: 10))
//
//            // 발목
//            context.addLine(to: CGPoint(x: keyPoint[leftAnkle], y: keyPoint[leftAnkle + 1]))
//            context.addEllipse(in: CGRect(x: keyPoint[leftAnkle], y: keyPoint[leftAnkle + 1], width: 10, height: 10))
//            context.strokePath()
//
//            let image = UIGraphicsGetImageFromCurrentImageContext()!
//            UIGraphicsEndImageContext()
//
//            return image
//        }

