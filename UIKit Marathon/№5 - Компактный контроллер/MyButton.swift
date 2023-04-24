//
//  MyButton.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 24.04.2023.
//

import Foundation
import UIKit

class MyButton: UIButton {
    // меняем цвет кнопок когда открывается модальное окно
    override func tintColorDidChange() {
        super.tintColorDidChange()
        switch tintAdjustmentMode {
        case.dimmed:
            setTitleColor(.systemGray4, for: .normal)
        default:
            setTitleColor(.systemBlue, for: .normal)
        }
    }
}
