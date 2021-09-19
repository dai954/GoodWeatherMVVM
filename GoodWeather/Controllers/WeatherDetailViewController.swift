//
//  WeatherDetailViewController.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/09/18.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var weatherViewModel: WeatherViewModel?
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "city name"
        label.textAlignment = .center
        return label
    }()
    
    let currentTempLabel: UILabel = {
        let label = UILabel()
        label.text = "currrent temp"
        label.textAlignment = .center
        return label
    }()
    
    let maxTempLabel: UILabel = {
        let label = UILabel()
        label.text = "max temp"
        label.textAlignment = .center
        return label
    }()
    
    let minTempLabel: UILabel = {
        let label = UILabel()
        label.text = "min temp"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpView()
        
        if let weatherVM = weatherViewModel {
            cityNameLabel.text = weatherVM.city
            currentTempLabel.text = weatherVM.temperature.formatAsDegree()
        }
    }
    
    private func setUpView() {
        view.addSubview(cityNameLabel)
        view.addSubview(currentTempLabel)
        view.addSubview(maxTempLabel)
        view.addSubview(minTempLabel)
        
        cityNameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        currentTempLabel.anchor(top: cityNameLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        maxTempLabel.anchor(top: currentTempLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        minTempLabel.anchor(top: maxTempLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
    }
    
}
