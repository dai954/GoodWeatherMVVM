//
//  SettingVIewModel.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/08/13.
//

//import Foundation
//
//enum Unit: String, CaseIterable {
//    case celsius = "metric"
//    case fahrenheit = "imperial"
//}
//
//extension Unit {
//    var displayName: String {
//        get {
//            switch (self) {
//            case .celsius:
//                return "Celcius"
//            case .fahrenheit:
//                return "Fahrenheit"
//            }
//        }
//    }
//}
//
//class SettingViewModel {
//
//    let units = Unit.allCases
//
//    var selectedUnit: Unit {
//        get {
//            let userDefaults = UserDefaults.standard
//            var unitValue = ""
//            if let value = userDefaults.value(forKey: "unit") as? String {
//                unitValue = value
//            }
//            return Unit(rawValue: unitValue)!
//        }
//        set {
//            let userDefault = UserDefaults.standard
//            userDefault.set(newValue.rawValue, forKey: "unit")
//        }
//    }
//}

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self) {
                case .celsius:
                    return "Celcius"
                case .fahrenheit:
                    return "Fahrenheit"
            }
        }
    }
    
}

class SettingViewModel {
    
    let units = Unit.allCases
//    var _selectedUnit: Unit = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
//            guard let unitValue = UserDefaults.standard.value(forKey: "unit") as? String else {
//                fatalError("failed to get unit value")
//            }
            return Unit(rawValue: unitValue) ?? .fahrenheit
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}

