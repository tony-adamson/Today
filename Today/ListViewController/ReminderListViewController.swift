//
//  ReminderListViewController.swift
//  Today
//
//  Created by Антон Адамсон on 09.09.2023.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout

        /**
         Регистрация ячейки определяет, как настроить содержимое и внешний вид ячейки.
         */
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        /* long version
        var reminderTitles = [String]()
        for reminder in Reminder.sampleData {
            reminderTitles.append(reminder.title)
        }
        snapshot.appendItems(reminderTitles)
         */
        snapshot.appendItems(Reminder.sampleData.map { $0.title} )
        dataSource.apply(snapshot)
        
        // Назначим источник данных представленному виду коллекции.
        collectionView.dataSource = dataSource
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
