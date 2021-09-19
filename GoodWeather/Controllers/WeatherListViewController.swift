//
//  WeatherListViewController.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/08/12.
//

import UIKit

class WeatherListViewController: UIViewController, UITableViewDelegate, AddWeatherDelegate {
    
    private let cellId = "weathterCellId"
    let tableView = UITableView()
    
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit?
    
    var dataSource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        self.dataSource = TableViewDataSource<WeatherCell, WeatherViewModel>(cellIdentifier: cellId, items: weatherListViewModel.weatherViewModels, configureCell: { cell, vm in
            cell.cityNameLavel.text = vm.city
            cell.temperatureLavel.text = vm.temperature.formatAsDegree()
        })
        
        tableView.dataSource = dataSource
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value) ?? .fahrenheit
        }
        
        tableView.register(WeatherCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        setupNav()
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        dataSource.updateItems(weatherListViewModel.weatherViewModels)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherDetailVC = WeatherDetailViewController()
        weatherDetailVC.weatherViewModel = weatherListViewModel.modelAt(indexPath.row)
        navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func setupNav() {
        
        navigationItem.title = "weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(settingTapped))
    }
    
    @objc func addTapped() {
        let addWeatherCityVC = AddWeatherCityViewController()
        addWeatherCityVC.delegate = self
        let nav = UINavigationController(rootViewController: addWeatherCityVC)
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc func settingTapped() {
        let settingVC = SettingViewController()
        settingVC.delegate = self
        let nav = UINavigationController(rootViewController: settingVC)
        self.present(nav, animated: true, completion: nil)
    }
}

extension WeatherListViewController: SettingDelegate {
    func settingDone(vm: SettingViewModel) {
        if lastUnitSelection?.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)
        }
    }
}
