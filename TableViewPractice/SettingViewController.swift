//
//  SettingViewController.swift
//  TableViewPractice
//
//  Created by 김성민 on 5/23/24.
//

import UIKit

class SettingViewController: UITableViewController {
    
    let sectionHeader = ["전체 설정", "개인 설정", "기타"]
    let cellDataSource = [
        ["공지사항", "실험실", "버전 정보"],
        ["개인/보안", "알림", "채팅", "멀티프로필"],
        ["고객센터/도움말"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "설정"
        
    }
    
    // MARK: - 섹션
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    
    // MARK: - 셀
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDataSource[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        
        cell.textLabel?.text = cellDataSource[indexPath.section][indexPath.row]
        
        return cell
    }
    
}
