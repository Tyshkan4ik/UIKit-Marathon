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
    
    func setup(indexPath: Int) {
        
        switch indexPath {
        case 0: label.text = "Задание №1 \nГрадиент и Тень"
        case 1: label.text = "Задание №2 \nТри кнопки"
        case 2: label.text = "Задание №3 \nАнимация"
        case 3: label.text = "Задание №4 \nТаблица"
        case 4: label.text = "Задание №5 \nКомпактный контроллер"
        case 5: label.text = "Задание №6 \nИнерционный квадрат"
        case 6: label.text = "Задание №7 \nРастягивающаяся картинка"
        case 7: label.text = "Задание №8 \nНативный аватар"
        case 8: label.text = "Задание №9 \nЗаботливая коллекция"
        default: label.text = ""
        }
    }
}
