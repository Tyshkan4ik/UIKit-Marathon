//
//  CellForCollection.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import Foundation
import UIKit

class CellForCollection: UICollectionViewCell {
    
    private enum Constants {
        static let myImageCornerRadius: CGFloat = 10
    }
    
    //MARK: - Properties
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var label: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = Constants.myImageCornerRadius
        backgroundColor = .systemIndigo
       setupElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    //MARK: - Methods
    
    func setupElements() {
        contentView.addSubview(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setup(text: String) {
        label.text = text
    }
}
