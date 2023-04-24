//
//  Task6ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class Task6ViewController: UIViewController {

    private enum Constants {
        static let sideLenght: CGFloat = 100
        static let cornerRadius: Double = 10
        static let snapValue: CGFloat = 1
        static let two: CGFloat = 2
    }
    
    //MARK: - Properties
    
    private lazy var squareView: UIView = {
        let view = UIView(
            frame: CGRect(
                x: view.center.x - Constants.sideLenght / Constants.two,
                y: view.center.y - Constants.sideLenght / Constants.two,
                width: Constants.sideLenght,
                height: Constants.sideLenght
            )
        )
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    var animator: UIDynamicAnimator!
    //пружинное поведение
    var snap: UISnapBehavior!
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupElements()
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    private func setupElements() {
        view.addSubview(squareView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // удаляем SnapBehavior каждый раз после отработки анимации, чтобы корректно работал при каждом клике
        if snap != nil {
            animator.removeBehavior(snap)
        }
        let touch = touches.first!
        snap = UISnapBehavior(item: squareView, snapTo: touch.location(in: view))
        snap.damping = Constants.snapValue
        animator.addBehavior(snap)
    }
}
