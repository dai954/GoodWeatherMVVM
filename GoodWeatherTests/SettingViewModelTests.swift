//
//  SettingViewModelTests.swift
//  GoodWeatherTests
//
//  Created by 石川大輔 on 2021/09/18.
//

import XCTest
@testable import GoodWeather

class SettingViewModelTests: XCTestCase {

    private var settingVM: SettingViewModel!

    override func setUp() {
        super.setUp()
        self.settingVM = SettingViewModel()
    }

    func test_return_correct_display_name_for_fahrenheit() {

        XCTAssertEqual(settingVM.selectedUnit.displayName, "Fahrenheit")
    }

    func test_should_make_sure_that_default_unit_setting_is_fahrenheit() {

        XCTAssertEqual(settingVM.selectedUnit, .fahrenheit)

    }

    func test_to_be_able_to_save_unit() {
        settingVM.selectedUnit = .celsius

        XCTAssertNotNil(UserDefaults.standard.string(forKey: "unit"))
    }

    override func tearDown() {
        super.tearDown()

        UserDefaults.standard.removeObject(forKey: "unit")
    }

}
