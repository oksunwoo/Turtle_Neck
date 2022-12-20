//
//  View+Extension.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/20.
//

import SwiftUI

extension View {
    func alert(isPresented: Binding<Bool>, alert: PoseAlert) -> some View {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        let vc = UIHostingController(rootView: alert)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        vc.view.backgroundColor = .clear
        vc.definesPresentationContext = true
        
        return self.onChange(of: isPresented.wrappedValue, perform: {
            if var topController = keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                
                if $0 {
                    topController.present(vc, animated: false)
                } else {
                    topController.dismiss(animated: false)
                }
            }
        })
    }
}

