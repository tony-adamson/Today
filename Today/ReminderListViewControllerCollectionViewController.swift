//
//  ReminderListViewControllerCollectionViewController.swift
//  Today
//
//  Created by Антон Адамсон on 09.09.2023.
//

import UIKit

class ReminderListViewControllerCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout

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
