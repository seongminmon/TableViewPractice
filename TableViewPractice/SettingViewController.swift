//
//  SettingViewController.swift
//  TableViewPractice
//
//  Created by 김성민 on 5/23/24.
//

import UIKit

class SettingViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "설정"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "이동", style: .plain, target: self, action: #selector(nextButtonTapped))
    }
    
    @objc func nextButtonTapped() {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - 섹션
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOptions
    }
    
    // MARK: - 셀
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].subOptions.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOptions[indexPath.row]
        
        return cell
    }
    
}
