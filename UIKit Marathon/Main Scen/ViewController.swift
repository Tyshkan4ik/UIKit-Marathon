//
//  ViewController.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//

import UIKit

enum allTasks: String, CaseIterable {
    case task1 = "Задание №1 \nГрадиент и Тень"
    case task2 = "Задание №2 \nТри кнопки"
    case task3 = "Задание №3 \nАнимация"
    case task4 = "Задание №4 \nТаблица"
    case task5 = "Задание №5 \nКомпактный контроллер"
    case task6 = "Задание №6 \nИнерционный квадрат"
    case task7 = "Задание №7 \nРастягивающаяся картинка"
    case task8 = "Задание №8 \nНативный аватар"
    case task9 = "Задание №9 \nЗаботливая коллекция"
}

class ViewController: UIViewController {
    
    private enum Constants {
        static let heightItem: CGFloat = 60
        static let widthItem: CGFloat = UIScreen.main.bounds.width - 40
        static let elementsIndentTop: CGFloat = 10
        static let elementsIndentLeft: CGFloat = 20
        static let elementsIndentBottom: CGFloat = 0
        static let elementsIndentRight: CGFloat = 20
        static let minimumLineSpacing: CGFloat = 20
    }
    
    //MARK: - Properties
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionView
        )
        collection.backgroundColor = .systemYellow
        collectionView.scrollDirection = .vertical
        collection.register(CellForCollection.self, forCellWithReuseIdentifier: CellForCollection.identifier)
        //минимальное расстояние между items коллекции
        collectionView.minimumLineSpacing = Constants.minimumLineSpacing
        // отступ элементов от края коллекции
        collectionView.sectionInset = UIEdgeInsets(
            top: Constants.elementsIndentTop,
            left: Constants.elementsIndentLeft,
            bottom: Constants.elementsIndentBottom,
            right: Constants.elementsIndentRight
        )
        collection.translatesAutoresizingMaskIntoConstraints = false
        //collection.isPagingEnabled = false
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
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - extension - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTasks.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CellForCollection.identifier,
            for: indexPath
        ) as! CellForCollection
        let model = allTasks.allCases[indexPath.row].rawValue
        myCell.setup(text: model)
        return myCell
    }
    
    
}

//MARK: - extension - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.widthItem, height: Constants.heightItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = getController(indexPath: indexPath.row)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    /// Возвращает UIViewController выбраного Task
    /// - Parameter indexPath: Индекс item в коллекции
    /// - Returns: UIViewController выбраного задания
    private func getController(indexPath: Int) -> UIViewController {
        let controller: UIViewController
        switch indexPath {
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
        return controller
    }
}
