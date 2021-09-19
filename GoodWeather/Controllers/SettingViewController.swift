//
//  SettingViewController.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/08/13.
//

import UIKit

protocol SettingDelegate {
    func settingDone(vm: SettingViewModel)
}

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    private var settingViewModel = SettingViewModel()
    private let tableView = UITableView()
    var delegate: SettingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Setting"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        
    }
    
    @objc private func doneTapped() {
        print("doneTapped")
        if let delegate = self.delegate {
            delegate.settingDone(vm: settingViewModel)
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }

        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingViewModel.selectedUnit = unit
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingViewModel.units[indexPath.row]
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == settingViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
}
