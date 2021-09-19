//
//  Extentions+Layout.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/08/12.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
