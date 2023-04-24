//
//  SecondTask5ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 24.04.2023.
//

import UIKit

class SecondTask5ViewController: UIViewController {

    private enum Constants {
        static let viewWidth: Double = 300
        static let viewHeight: Double = 280
        static let viewHeightChange: Double = 150
        static let indentSegment: Double = 20
        static let indentButtonClose: Double = -10
        static let animateDuration: TimeInterval = 0.8
    }
    
    //MARK: - Properties
    
    private lazy var buttonClose: UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(clickButtonClose), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let items = ["280pt", "150pt"]
        let segment = UISegmentedControl(items: items)
        segment.addTarget(self, action: #selector(clickSegment), for: .valueChanged)
        segment.backgroundColor = .systemGray4
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        //размер контроллера представления
        self.preferredContentSize = CGSize(
            width: Constants.viewWidth,
            height: Constants.viewHeight
        )
        setupElements()
        setupConstraints()
    }
    
    private func setupElements() {
        view.addSubview(buttonClose)
        view.addSubview(segmentedControl)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.indentSegment),
            
            buttonClose.topAnchor.constraint(equalTo: segmentedControl.topAnchor),
            buttonClose.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            buttonClose.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.indentButtonClose)
        ])
    }
    
    @objc
    private func clickButtonClose() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func clickSegment(_ segment: UISegmentedControl) {
        
        switch segment.selectedSegmentIndex {
        case 0:
            animateHeight(withDuration: Constants.animateDuration, height: Constants.viewHeight)
        case 1:
            animateHeight(withDuration: Constants.animateDuration, height: Constants.viewHeightChange)
        default:
            break
        }
    }
    
    /// Меняем размер контролера при переключении сегмента
    /// - Parameters:
    ///   - withDuration: продолжительность анимации
    ///   - height: высота контроллера
    private func animateHeight(withDuration: TimeInterval, height: Double) {
        UIView.animate(withDuration: withDuration) {
            self.preferredContentSize.height = height
        }
    }
}
