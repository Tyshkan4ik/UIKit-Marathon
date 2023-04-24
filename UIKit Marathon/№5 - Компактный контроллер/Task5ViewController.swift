//
//  Task5ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class Task5ViewController: UIViewController {
    
    private enum Constants {
        static let indentButton: Double = 30
    }
    
    //MARK: - Properties
    
    private lazy var button: MyButton = {
        let button = MyButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupElements()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.indentButton)
        ])
    }
    
    private func setupElements() {
        view.addSubview(button)
    }
    
    @objc
    private func clickButton() {
        let controller = SecondTask5ViewController()
        controller.modalPresentationStyle = .popover
        // делаем привязку к кнопке в виде треугольника
        controller.popoverPresentationController?.sourceView = button
        // направление треугольника
        controller.popoverPresentationController?.permittedArrowDirections = .up
        controller.popoverPresentationController?.delegate = self
        present(controller, animated: true, completion: nil)
    }
}

//MARK: - extension - UIPopoverPresentationControllerDelegate

// настраиваем всплывающую презентацию.
extension Task5ViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) ->
    UIModalPresentationStyle {
        return .none
    }
    public func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false
    }
}
