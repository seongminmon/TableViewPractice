//
//  ShoppingViewController.swift
//  TableViewPractice
//
//  Created by 김성민 on 5/23/24.
//

import UIKit

struct Shopping {
    let contents: String
    var check: Bool
    var isLike: Bool
}

class ShoppingViewController: UITableViewController {
    
    var list: [Shopping] = [
        Shopping(contents: "그립톡 구매하기", check: true, isLike: true),
        Shopping(contents: "사이다 구매", check: false, isLike: false),
        Shopping(contents: "아이패드 케이스 최저가 알아보기", check: false, isLike: true),
        Shopping(contents: "양말", check: false, isLike: true),
    ]
    
    @IBOutlet var headerTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
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
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        let item = list[indexPath.row]
        cell.contentsLabel.text = item.contents
        
        let checkImage = item.check ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        cell.checkButton.setImage(checkImage, for: .normal)
        cell.checkButton.tintColor = .black
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        cell.checkButton.tag = indexPath.row
        
        let likeImage = item.isLike ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        cell.likeButton.setImage(likeImage, for: .normal)
        cell.likeButton.tintColor = .black
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        cell.likeButton.tag = indexPath.row
        
        return cell
    }
    
    @objc func addButtonTapped() {
        guard let contents = headerTextField.text, contents != "" else {
            return
        }
        list.insert(Shopping(contents: contents, check: false, isLike: false), at: 0)
        headerTextField.text = ""
        tableView.reloadData()
    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        list[sender.tag].check.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func likeButtonTapped(sender: UIButton) {
        list[sender.tag].isLike.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
}
