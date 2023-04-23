
//  Task3ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class Task3ViewController: UIViewController {
    
    enum Constants {
        static let cornerRadius: CGFloat = 10
        static let animationDuration: CGFloat = 0.7
        static let viewSquareFrameY: CGFloat = 150
        static let viewSquareLength: CGFloat = 80
        static let sliderIndentFromviewSquare: CGFloat = 44
        static let scalingViewSquare: CGFloat = 1.5
    }
    
    //MARK: - Properties
    
    var animator = UIViewPropertyAnimator(
        duration: Constants.animationDuration,
        curve: .easeOut
    )
    
    private lazy var viewSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupElements()
        addActionCompletionPercentage()
        addActionReleaseTheSlider()
        addAnimations()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if viewSquare.transform == .identity {
            viewSquare.frame = .init(
                x: view.layoutMargins.left,
                y: Constants.viewSquareFrameY,
                width: Constants.viewSquareLength,
                height: Constants.viewSquareLength
            )
            slider.sizeToFit()
            slider.frame = .init(
                x: view.layoutMargins.left,
                y: viewSquare.frame.maxY + Constants.sliderIndentFromviewSquare,
                width: view.frame.width - view.layoutMargins.left - view.layoutMargins.right,
                height: slider.frame.height
            )
        }
    }
    
    private func setupElements() {
        view.addSubview(viewSquare)
        view.addSubview(slider)
    }
    
    /// Анимация перемещения квадрата за слайдером и увелечение + поворот
    private func addAnimations() {
        animator.addAnimations {
            //реализуем перемещение квадрата за слайдером
            self.viewSquare.frame.origin.x = self.view.frame.width - self.view.layoutMargins.left - self.view.layoutMargins.right - self.viewSquare.frame.width
            // реализуем поворот и масштабирование квадрата
            self.viewSquare.transform = CGAffineTransform(scaleX: Constants.scalingViewSquare, y: Constants.scalingViewSquare).rotated(by: .pi / 2)
        }
    }
    
    /// Процент завершения анимации. Получаем значение бигунка от 0 до 1 и привязываем это значение к проценту завершения анимации.
    private func addActionCompletionPercentage() {
        slider.addAction(.init(handler: { _ in
            self.animator.fractionComplete = CGFloat(self.slider.value)
        }), for: .valueChanged)
    }
    
    /// При отпускании бигунка, он перемещается в конец слайдера вместе с квадратом
    private func addActionReleaseTheSlider() {
        slider.addAction(.init(handler: { _ in
            self.animator.startAnimation()
            self.slider.setValue(1, animated: true)
        }), for: [.touchUpInside, .touchUpOutside] )
        // чтобы квадрат не прилипал к правому краю, а продолжал анимацию (анимация остается в активном состоянии после ее завершения).
        animator.pausesOnCompletion = true
    }
}
