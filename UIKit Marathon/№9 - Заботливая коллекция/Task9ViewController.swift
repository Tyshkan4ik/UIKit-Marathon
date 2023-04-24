//
//  Task9ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class Task9ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    enum Constants {
        static let numberOfItemsInSection = 15
        static let collectionViewBottomConstant: CGFloat = 100
        static let sectionInsetTop: CGFloat = 0
        static let sectionInsetLeft: CGFloat = 15
        static let sectionInsetRight: CGFloat = 15
        static let sectionInsetBottom: CGFloat = 200
        //static let lineSpacingConstant: CGFloat = 10
        static let itemCellSizeWidth: CGFloat = 250
        static let itemCellSizeHeight: CGFloat = 350
        static let itemCellsGapConstant: CGFloat = 10
    }
    
    //MARK: - Properties
    
    private let itemCellSize: CGSize = CGSize(
        width: Constants.itemCellSizeWidth,
        height: Constants.itemCellSizeHeight
    )
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionView
        )
        collection.backgroundColor = .white
        collectionView.scrollDirection = .horizontal
        collection.register(Task9CellForCollection.self, forCellWithReuseIdentifier: Task9CellForCollection.identifier)
        //collection.preservesSuperviewLayoutMargins = true
        // отступ элементов от края коллекции
        collectionView.sectionInset = UIEdgeInsets(
            top: Constants.sectionInsetTop,
            left: Constants.sectionInsetLeft,
            bottom: Constants.sectionInsetBottom,
            right: Constants.sectionInsetRight)
        collection.translatesAutoresizingMaskIntoConstraints = false
        //collection.isPagingEnabled = false
        return collection
    }()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationSettings()
        view.backgroundColor = .white
        setupElements()
        setupConstraints()
        collectionView.dataSource = self
        collectionView.delegate = self
       // self.view.insetsLayoutMarginsFromSafeArea = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupElements() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.collectionViewBottomConstant)
        ])
    }
    
    private func setupNavigationSettings() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Collection"
    }
    
    //делаем чтобы после прокрутки колекции останавливался в начале Item
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = itemCellSize.width + collectionView.layoutMargins.left
        let itemIndex = (targetContentOffset.pointee.x) / (pageWidth)
//        targetContentOffset.pointee.x = round(itemIndex) * pageWidth - (collectionView.layoutMargins.left / 2)
        targetContentOffset.pointee.x = round(itemIndex) * pageWidth
    }
    
    //MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: Task9CellForCollection.identifier, for: indexPath) as! Task9CellForCollection
        return myCell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.layoutMargins.left
    }
}
