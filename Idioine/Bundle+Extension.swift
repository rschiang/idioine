//
//  Bundle+Extension.swift
//  Idioine
//
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(fromJson resourceName: String) -> T {
        let url = self.url(forResource: resourceName, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try! decoder.decode(T.self, from: data)
    }
}
