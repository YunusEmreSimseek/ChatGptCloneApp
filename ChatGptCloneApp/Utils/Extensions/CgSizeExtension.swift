//
//  CgSizeExtension.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 3.09.2025.
//

import SwiftUI

extension CGSize {
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for  height
    func dynamicHeight(_ height: Double) -> Double {
        return self.height * height
    }

    /// - Parameter Width: Percent value
    /// - Returns: Calculated value for  Width
    func dynamicWidth(_ width: Double) -> Double {
        return self.width * width
    }
}
