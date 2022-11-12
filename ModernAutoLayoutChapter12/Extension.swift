//
//  ExtensionUILabel.swift
//  ModernAutoLayoutChapter12
//
//  Created by Pavlov Matvey on 11.11.2022.
//

import UIKit

extension UILabel {
    static func makeLabel(style: UIFont.TextStyle) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: style) //для выбора системных шрифтов
        label.adjustsFontForContentSizeCategory = true //для выбора системных шрифтов
        label.numberOfLines = 0
        return label
    }
}

extension UITextView {
    static func makeTextView(style: UIFont.TextStyle) -> UITextView {
        let view = UITextView()
        view.font = UIFont.preferredFont(forTextStyle: style)
        view.adjustsFontForContentSizeCategory = true
        view.textContainer.lineFragmentPadding = 0  //чтобы текст был плотно слева
        view.isScrollEnabled = false    //обязательно тк если true, то текста не видно
        return view
    }
}
