//
//  IUserDefaultService.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 3.09.2025.
//

import Foundation

protocol IUserDefaultService {
    func saveItem<T: Encodable>(_ data: T, forKey key: UserDefaultsKey)
    func getItem<T: Decodable>(_ type: T.Type, forKey key: UserDefaultsKey) -> T?
    func deleteItem(forKey key: UserDefaultsKey)
}
