//
//  ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var gradientButton: UIButton = {
        let button = UIButton()
        button.setTitle("Задание №1: \nГрадиент и Тень", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        collection.backgroundColor = .systemYellow
        collectionView.scrollDirection = .vertical
        collection.register(CellForCollection.self, forCellWithReuseIdentifier: CellForCollection.identifier)
        collectionView.minimumLineSpacing = 20 //Constants.lineSpacingConstant //минимальное расстояние между items коллекции
        //collection.preservesSuperviewLayoutMargins = true
        collectionView.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20) // отступ элементов от края коллекции
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = false
        
        return collection
    }()
    
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = "Марафон по UIKit"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        setupElements()
        setupConstraints()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.navigationController?.navigationBar.barTintColor = .systemYellow
    }
    
    private func setupElements() {
        view.addSubview(collectionView)
        //view.addSubview(gradientButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            gradientButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            gradientButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            gradientButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            gradientButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    
}

//MARK: - extension - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForCollection.identifier, for: indexPath) as! CellForCollection
        myCell.setup(indexPath: indexPath.row)
        return myCell
    }
    
    
}

//MARK: - extension - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller: UIViewController
        
        switch indexPath.row {
        case 0: controller = Task1ViewController()
        case 1: controller = Task2ViewController()
        case 2: controller = Task3ViewController()
        case 3: controller = Task4ViewController()
        case 4: controller = Task5ViewController()
        case 5: controller = Task6ViewController()
        case 6: controller = Task7ViewController()
        case 7: controller = Task8ViewController()
        case 8: controller = Task9ViewController()
        default: controller = Task1ViewController()
        }
        
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
