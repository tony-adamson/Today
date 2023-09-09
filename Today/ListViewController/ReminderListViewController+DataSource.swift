//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Антон Адамсон on 09.09.2023.
//

import UIKit

extension ReminderListViewController {
    /**
     Добавим псевдоним типа для разнояемого источника данных.
     */
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    /**
     Добавим псевдоним типа для разновидного источника данных.
     */
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
        let reminder = Reminder.sampleData[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = reminder.title
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(
                    forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration
        
        var doneButtonConfiguration = doneButtonConfiguration(from: reminder)
        doneButtonConfiguration.tintColor = UIColor(named: "TodayListCellDoneButtonTint")
        cell.accessories = [
                    .customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always)
                ]
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = UIColor(named: "TodayListCellBackground")
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    private func doneButtonConfiguration(from reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
