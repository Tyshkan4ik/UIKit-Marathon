//
//  Task9CellForCollection.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 24.04.2023.
//

import Foundation
import UIKit

class Task9CellForCollection: UICollectionViewCell {
    
    private enum Constants {
        static let myImageCornerRadius: CGFloat = 10
    }
    
    //MARK: - Properties
    
    static var identifier: String {
        return String(describing: self)
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = Constants.myImageCornerRadius
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
