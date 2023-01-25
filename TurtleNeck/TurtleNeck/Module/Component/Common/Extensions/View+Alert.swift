//
//  View+Extension.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/20.
//

import SwiftUI

extension View {
    func alert(isPresented: Binding<Bool>, alert: PhotoGuideView) -> some View {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        let vc = UIHostingController(rootView: alert)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        vc.view.backgroundColor = .clear
        vc.definesPresentationContext = true
        
        return self.onChange(of: isPresented.wrappedValue, perform: {
            if var topController = window?.rootViewController {
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

