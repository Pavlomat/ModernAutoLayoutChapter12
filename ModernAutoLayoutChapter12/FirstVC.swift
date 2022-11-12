//
//  FirstVC.swift
//  ModernAutoLayoutChapter12
//
//  Created by Pavlov Matvey on 11.11.2022.
//

import UIKit

class FirstVC: UIViewController {
    
    private let padding: CGFloat = 20.0
    
    private let titleLabel = UILabel.makeLabel(style: .headline)
    private let textLabel = UILabel.makeLabel(style: .body)
    private let footnoteLabel = UILabel.makeLabel(style: .footnote)
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
//        var quote: Quote? {
//                didSet {
//                    titleLabel.text = appDelegate.title
//                    textLabel.text = appDelegate.footnote
//                    footnoteLabel.text = appDelegate.text
//                }
//            }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textLabel, footnoteLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        
        let frameGuide = scrollView.frameLayoutGuide
        let contentGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            frameGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameGuide.topAnchor.constraint(equalTo: view.topAnchor),
            frameGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentGuide.topAnchor.constraint(equalTo: stackView.topAnchor),
            contentGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            contentGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            contentGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            frameGuide.widthAnchor.constraint(equalTo: contentGuide.widthAnchor)
        ])
        
        titleLabel.text = appDelegate.title
        textLabel.text = appDelegate.text
        footnoteLabel.text = appDelegate.footnote
    }
}
