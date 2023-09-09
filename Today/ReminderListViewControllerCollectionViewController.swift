//
//  ReminderListViewControllerCollectionViewController.swift
//  Today
//
//  Created by Антон Адамсон on 09.09.2023.
//

import UIKit

class ReminderListViewControllerCollectionViewController: UICollectionViewController {

    /**
     Добавим псевдоним типа для разнояемого источника данных.
     */
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout

        /**
         Регистрация ячейки определяет, как настроить содержимое и внешний вид ячейки.
         */
        let cellRegistration = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = reminder.title
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
    }
    /**
     функция создает новую переменную конфигурации списка со сгруппированным внешним видом.
     */
    private func listLayout () -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

}
