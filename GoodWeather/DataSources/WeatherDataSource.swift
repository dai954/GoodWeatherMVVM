//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/09/18.
//

import UIKit

class WeatherDataSource:NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "cellId"
    var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weatherListViewModel.numberOfRows(1)
        return weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("cell not found")
        }
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
        
        return cell
    }
    
    
}
