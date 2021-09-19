//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/08/12.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
