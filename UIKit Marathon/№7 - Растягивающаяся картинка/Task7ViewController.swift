//
//  Task7ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class Task7ViewController: UIViewController {
    
    private enum Constants {
        static let imageName = "portugaliya"
        static let viewHeightConstant: CGFloat = 270
        static let contentSizeHeight: CGFloat = 1000
    }
    
    //MARK: - Properties
    
    private lazy var imagePortugaliya: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: Constants.imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var scrol: UIScrollView = {
        let scrol = UIScrollView()
        scrol.backgroundColor = .clear
        scrol.frame = view.bounds
        scrol.contentSize = contentSize
        return scrol
    }()
    
    private var contentSize: CGSize {
        CGSize(
            width: view.frame.width,
            height: view.frame.height + Constants.contentSizeHeight
        )
    }
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: CGRect(
            x: .zero,
            y: .zero,
            width: view.bounds.width,
            height: Constants.viewHeightConstant
        ))
        view.backgroundColor = .green
        return view
    }()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupElements()
        setupConstaints()
        // игнарируем safe area, чтобы не изменялась картинка
        scrol.contentInsetAdjustmentBehavior = .never
        scrol.delegate = self
        // делаем navigationBar прозрачным
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // возвращаем navigationBar к дефолтному значению
        self.navigationController?.navigationBar.setBackgroundImage(.none, for: .default)
        self.navigationController?.navigationBar.shadowImage = .none
    }
    
    private func setupElements() {
        view.addSubview(scrol)
        scrol.addSubview(contentView)
        contentView.addSubview(imagePortugaliya)
    }
    
    private func setupConstaints() {
        NSLayoutConstraint.activate([
            imagePortugaliya.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePortugaliya.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePortugaliya.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        //выставляем приоритеты констрейнтов чтобы картинка уезжала вместе со скролом
        let topConstraint = imagePortugaliya.topAnchor.constraint(equalTo: view.topAnchor)
        topConstraint.priority = .defaultHigh
        topConstraint.isActive = true
        
        let heightConstraint = imagePortugaliya.heightAnchor.constraint(equalToConstant: Constants.viewHeightConstant)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
    }
}

//MARK: - extension - UIScrollViewDelegate

extension Task7ViewController: UIScrollViewDelegate {
    //делаем чтобы индикатор прокрутки не нализал на картинку
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: imagePortugaliya.bounds.height - view.safeAreaInsets.top, left: .zero, bottom: .zero, right: .zero)
    }
}
