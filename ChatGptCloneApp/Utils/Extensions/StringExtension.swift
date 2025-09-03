//
//  StringExtension.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 1.09.2025.
//

import Foundation

extension String {
    func truncatedWords(limit: Int) -> String {
        var result = ""
        for word in split(separator: " ") {
            if result.count + word.count + (result.isEmpty ? 0 : 1) > limit {
                break
            }
            result += (result.isEmpty ? "" : " ") + word
        }
        return result
    }
}
