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
        label.font = UIFont.preferredFont(forTextStyle: style)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }
}
