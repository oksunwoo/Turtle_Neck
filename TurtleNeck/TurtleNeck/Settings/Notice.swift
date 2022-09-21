//
//  Notice.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/20.
//

import Foundation

struct Notice: Identifiable {
    let id = UUID()
    let title: String
    let noticeItems: [Notice]?
}
