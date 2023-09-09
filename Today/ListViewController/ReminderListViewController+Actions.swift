//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Антон Адамсон on 09.09.2023.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
