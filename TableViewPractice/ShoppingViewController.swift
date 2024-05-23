//
//  ShoppingViewController.swift
//  TableViewPractice
//
//  Created by 김성민 on 5/23/24.
//

import UIKit

class ShoppingViewController: UITableViewController {
    
    @IBOutlet var headerTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    let list = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "쇼핑"
        
        headerTextField.placeholder = "무엇을 구매하실 건가요?"
        headerTextField.backgroundColor = .systemGray5
        headerTextField.layer.cornerRadius = 20
        
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = .systemGray3
        addButton.layer.cornerRadius = 10
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        
        cell.textLabel?.text = list[indexPath.row]
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 20
        
        return cell
    }
}
