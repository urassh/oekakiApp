//
//  DrawPoints.swift
//  Oekaki_app
//
//  Created by 浦山秀斗 on 2023/12/24.
//

import Foundation
import SwiftUI

struct DrawPoints: Identifiable {
    var id: UUID = .init()
    var color: Color
    var points: [CGPoint]
}
