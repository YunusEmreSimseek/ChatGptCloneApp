//
//  UserDefaultsService.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 3.09.2025.
//

import Foundation

final class UserDefaultsService: IUserDefaultService {
    func saveItem<T: Encodable>(_ data: T, forKey key: UserDefaultsKey) {
        guard let data = try? JSONEncoder().encode(data) else { return }
        UserDefaults.standard.set(data, forKey: key.rawValue)
    }

    func getItem<T: Decodable>(_ type: T.Type, forKey key: UserDefaultsKey) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }

    func deleteItem(forKey key: UserDefaultsKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
