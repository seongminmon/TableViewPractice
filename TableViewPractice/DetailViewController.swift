//
//  DetailViewController.swift
//  TableViewPractice
//
//  Created by 김성민 on 7/18/24.
//

import UIKit
import SnapKit
import Then

enum SettingOptions: Int, CaseIterable {
    case total, personal, others
    
    var mainOptions: String {
        switch self {
        case .total: return "전체 설정"
        case .personal: return "개인 설정"
        case .others: return "기타"
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .total: return ["공지사항", "실험실", "버전 정보"]
        case .personal: return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others: return ["고객센터/도움말"]
        }
    }
}

final class DetailViewController: UIViewController {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    func createLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
    var dataSource: UICollectionViewDiffableDataSource<SettingOptions, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureDataSource()
        updateSnapshot()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureDataSource() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { cell, indexPath, item in
            var contentConfig = UIListContentConfiguration.valueCell()
            contentConfig.text = item
            contentConfig.textProperties.font = .boldSystemFont(ofSize: 16)
            cell.contentConfiguration = contentConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let cell = collectionView.dequeueConfiguredReusableCell(
                using: registration,
                for: indexPath,
                item: item
            )
            return cell
        })
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SettingOptions, String>()
        snapshot.appendSections(SettingOptions.allCases)
        SettingOptions.allCases.forEach {
            snapshot.appendItems($0.subOptions, toSection: $0)
        }
        dataSource.apply(snapshot)
    }
}
