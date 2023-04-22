//
//  SquareGradientView.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 22.04.2023.
//
import Foundation
import UIKit

/// Класс наследуемый от UIView. В классе реализован градиент backgroundColor, радиус скругления углов, тень, прозрачность и радиус размытия тени.
class SquareGradientView: UIView {
    
    private let gradient = CAGradientLayer()
    
    init(
        radius: CGFloat,
        colorGradient: [UIColor],
        shadowOpacity: Float,
        shadowRadius: CGFloat = 20
    ) {
        super.init(frame: .zero)

        gradient.cornerRadius = radius
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.colors = colorGradient.map { $0.cgColor }
        
        //Делаем тень и радиус на разных слоях чтобы работало корректно
        layer.shadowOpacity = shadowOpacity // прозрачность тени
        layer.shadowRadius = shadowRadius // размытость тени
        layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //инициализируем размеру слоя gradient размер корневой view
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
}
