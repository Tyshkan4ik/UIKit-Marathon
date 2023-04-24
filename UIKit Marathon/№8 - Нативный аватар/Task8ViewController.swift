//
//  Task8ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class Task8ViewController: UIViewController {

    private enum Constants {
        static let imageName = "person.crop.circle.fill"
        static let heightScroll: CGFloat = 1000
        static let imageAvatarRightConstant: CGFloat = -15
        static let imageAvatarBottomConstant: CGFloat = -12
        static let imageAvatarSize: CGFloat = 36
    }
    
    //MARK: - Properties
    
    private lazy var imageAvatar: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: Constants.imageName)
        imageView.image = image
        imageView.tintColor = .systemGray4
        return imageView
    }()
    
    private lazy var scrol: UIScrollView = {
        let scrol = UIScrollView()
        scrol.backgroundColor = .white
        scrol.frame = view.bounds
        scrol.contentSize = contentSize
        return scrol
    }()
    
    private var contentSize: CGSize {
        CGSize(
            width:view.frame.width,
            height: view.frame.height + Constants.heightScroll
        )
    }
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationItem()
        setupElements()
    }
    
    private func setupElements() {
        view.addSubview(scrol)
    }
    
    /// Поиск view определенного типа
    /// - Parameters:
    ///   - parentView: родительское вью
    ///   - type: тип искомого вью
    /// - Returns: Возвращается искомое вью
    func findSubview(parentView: UIView, type: UIView.Type) -> UIView? {
        for subview in parentView.subviews {
            if subview.isKind(of: type) {
                return subview
            } else if let desiredInstance = findSubview(parentView: subview, type: type) {
                return desiredInstance
            }
        }
        return nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    /// Устанавливаем navigationBar с аватаром
    private func setupNavigationItem() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        
        DispatchQueue.main.async {
            if let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") as? UIView.Type, let viewNavigationController = self.navigationController {
                if let largeTitleView = self.findSubview(parentView: viewNavigationController.view, type: largeTitleClass) {
                    let viewAvatar = self.imageAvatar
                    viewAvatar.clipsToBounds = true
                    largeTitleView.addSubview(viewAvatar)
                    viewAvatar.translatesAutoresizingMaskIntoConstraints = false
                    
                    NSLayoutConstraint.activate([
                        viewAvatar.rightAnchor.constraint(
                            equalTo: largeTitleView.rightAnchor,
                            constant: Constants.imageAvatarRightConstant
                        ),
                        viewAvatar.bottomAnchor.constraint(
                            equalTo: largeTitleView.bottomAnchor,
                            constant: Constants.imageAvatarBottomConstant
                        ),
                        viewAvatar.heightAnchor.constraint(equalToConstant: Constants.imageAvatarSize),
                        viewAvatar.widthAnchor.constraint(equalTo: viewAvatar.heightAnchor)
                    ])
                }
            }
        }
    }
}
