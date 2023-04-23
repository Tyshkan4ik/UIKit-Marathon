//
//  Task2ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class Task2ViewController: UIViewController {
    
    enum Constants {
        static let ButtonConstraintTop: CGFloat = 20
    }
    
    //MARK: - Properties
    
    var button1: MyCustomButton = {
        var button = MyCustomButton(text: "маленькая")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var button2: MyCustomButton = {
        var button = MyCustomButton(text: "средняя кнопка")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var button3: MyCustomButton = {
        var button = MyCustomButton(text: "большая кнопка")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  
    //MARK: - Methods
    
    @objc func tupOnNextScen() {
        let controller = Task2SecondViewController()
        self.present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupElements()
        setupConstraints()
        button3.addTarget(self, action: #selector(tupOnNextScen), for: .touchUpInside)
    }
    
    private func setupElements() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.ButtonConstraintTop),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: Constants.ButtonConstraintTop),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: Constants.ButtonConstraintTop),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
