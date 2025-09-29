//
//  CgFloatExtension.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

extension CGFloat {
    private static let screenSize = UIScreen.main.bounds.size

    /// Dynamic Height by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device height
    static func dynamicHeight(height: Double) -> Double {
        return screenSize.height * height
    }

    /// Dynamic Width by device
    /// - Parameter Width: Percent value
    /// - Returns: Calculated value for device Width
    static func dynamicWidth(width: Double) -> Double {
        return screenSize.width * width
    }

    /// Default padding values 16
    static var normal: CGFloat = AppFontSize.normal.rawValue
    /// value = 2
    static var veryLow2: CGFloat = AppFontSize.veryLow2.rawValue
    /// value = 4
    static var veryLow: CGFloat = AppFontSize.veryLow.rawValue
    /// value = 6
    static var low3: CGFloat = AppFontSize.low3.rawValue
    /// value = 8
    static var low2: CGFloat = AppFontSize.low2.rawValue
    /// value = 12
    static var low: CGFloat = AppFontSize.low.rawValue
    /// value = 20
    static var medium3: CGFloat = AppFontSize.medium3.rawValue
    /// value = 24
    static var medium2: CGFloat = AppFontSize.medium2.rawValue
    /// value = 28
    static var medium: CGFloat = AppFontSize.medium.rawValue
    /// value = 32
    static var high3: CGFloat = AppFontSize.high3.rawValue
    /// value = 40
    static var high2: CGFloat = AppFontSize.high2.rawValue
    /// value = 50
    static var high: CGFloat = AppFontSize.high.rawValue
}
