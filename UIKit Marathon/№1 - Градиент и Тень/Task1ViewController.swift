//
//  Task1ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class Task1ViewController: UIViewController {
    
    /// Константы используемые в классе Task1ViewController
    private enum Constants {
        static let sideLenghtSquare: CGFloat = 150
        static let xPosition: CGFloat = 100
    }
    
    //MARK: - Properties
    
    private lazy var viewSquare: SquareGradientView = {
        let view = SquareGradientView(
            radius: 20,
            colorGradient: [
                UIColor.blue,
                UIColor.cyan
            ],
            shadowOpacity: 0.8
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupElements()
        setupConstraints()
    }
    
    private func setupElements() {
        view.addSubview(viewSquare)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewSquare.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.xPosition),
            viewSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            viewSquare.heightAnchor.constraint(equalToConstant: Constants.sideLenghtSquare),
            viewSquare.widthAnchor.constraint(equalToConstant: Constants.sideLenghtSquare)
        ])
    }
}
