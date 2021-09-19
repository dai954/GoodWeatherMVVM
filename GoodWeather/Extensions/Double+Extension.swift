//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/08/12.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f", self)
    }
}
