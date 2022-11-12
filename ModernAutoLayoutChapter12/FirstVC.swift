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
    private let textView = UITextView.makeTextView(style: .body)
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
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textView, footnoteLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)  //отключаем тк будет внутри view для чтения на ipad
//        stackView.isLayoutMarginsRelativeArrangement = true //чтобы работал padding
        return stackView
    }()
    
    private lazy var containerView: UIView = {  //программно нельзя сделать читаемый формат для iPad (галочка в interface builder) для stackView можно сделать отдельно для лейблов вью и тд, для этого стаквью вставляем во view и уже для него делаем читаемый формат.
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
            view.addSubview(stackView)

            let readableGuide = view.readableContentGuide   //делается читаемый формат для iPad
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: readableGuide.leadingAnchor),
                stackView.topAnchor.constraint(equalTo: readableGuide.topAnchor),
                stackView.trailingAnchor.constraint(equalTo: readableGuide.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: readableGuide.bottomAnchor)
                ])
            return view
        }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
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
        
        titleLabel.text = appDelegate.title
        textView.text = appDelegate.text
        footnoteLabel.text = appDelegate.footnote
        
        NSLayoutConstraint.activate([
            frameGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameGuide.topAnchor.constraint(equalTo: view.topAnchor),
            frameGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentGuide.topAnchor.constraint(equalTo: containerView.topAnchor),    //меняем со стаквью на контейнервью
            contentGuide.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            contentGuide.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentGuide.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            frameGuide.widthAnchor.constraint(equalTo: contentGuide.widthAnchor)
        ])
    }
}
