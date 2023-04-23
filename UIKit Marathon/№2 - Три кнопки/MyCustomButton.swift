//
//  MyCustomButton.swift
//  UIKit Marathon
//
//  Created by Виталий Троицкий on 23.04.2023.
//

import Foundation
import UIKit

class MyCustomButton: UIButton {
    
    enum Constants {
        static let cornerRadius: CGFloat = 5
        static let contentInsetsTopAndBottom: CGFloat = 10
        static let contentInsetsLeadingAndTrailing: CGFloat = 14
        static let indentImage: CGFloat = 8
        static let animationDuration: CGFloat = 0.2
        static let TransformX: CGFloat = 0.9
        static let TransformY: CGFloat = 0.9
    }
    
    //MARK: - Initializers
    
    init(text: String) {
        super.init(frame: .zero)
        
        backgroundColor = .link
        setTitleColor(.white, for: .highlighted)
        setTitle(text, for: .normal)
        setImage(UIImage(systemName: "arrow.forward.circle.fill")?.withTintColor(.white, renderingMode: .automatic), for: .normal)
        
        configuration = UIButton.Configuration.filled()
        configuration?.contentInsets = NSDirectionalEdgeInsets(
            top: Constants.contentInsetsTopAndBottom,
            leading: Constants.contentInsetsLeadingAndTrailing,
            bottom: Constants.contentInsetsTopAndBottom,
            trailing: Constants.contentInsetsLeadingAndTrailing
        )
        semanticContentAttribute = .forceRightToLeft
        //растояние между текстом и картинкой
        configuration?.imagePadding = Constants.indentImage
        layer.cornerRadius = Constants.cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    // когда кнопка нажата делаем анимированную трансформацию
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIButton.animate(withDuration: Constants.animationDuration) {
            self.transform = CGAffineTransform(scaleX:
                                                Constants.TransformX,
                                               y: Constants.TransformY
            )
        }
    }
    
    // когда кнопка отпущена анимированно возвращаемся в исходное состояние
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIButton.animate(withDuration: Constants.animationDuration) {
            self.transform = CGAffineTransform.identity
        }
    }
    
    //делаем прирывание анимации
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return self.layer.presentation()?.hitTest(self.convert(point, to: superview)).flatMap { _ in return self } ?? nil
    }
    
    // используем dimmed чтобы покрасить кнопки когда открывается модальный контроллер поверх
    override func tintColorDidChange() {
        super.tintColorDidChange()
        switch tintAdjustmentMode {
        case.dimmed:
            self.backgroundColor = .systemGray
            self.layer.cornerRadius = 5
            self.imageView?.tintColor = .systemGray2
        default:
            self.backgroundColor = .clear
        }
    }
}
