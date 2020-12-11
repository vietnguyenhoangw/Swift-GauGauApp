//
//  PageSell.swift
//  GauGau
//
//  Created by coder on 12/11/20.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let uiImage = UIImage(named: "universal_icon")
        let imageView = UIImageView(image: uiImage)
        
        // this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        
        let attributeText = NSMutableAttributedString(string: "Gau Gau", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        attributeText.append(NSMutableAttributedString(string: "\n\n My first build iOS App with layout only using code. Thanks for visited, let's enjoy this app.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributeText
        textView.textAlignment = .center
        return textView
    }()
    
    let containerView: UIView = {
        let topContainerView = UIView()
//        topContainerView.backgroundColor = .orange
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        return topContainerView
    }()
    
    let topContainerView: UIView = {
        let topContainerView = UIView()
//        topContainerView.backgroundColor = .blue
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        return topContainerView
    }()
    
    let bottomContainerView: UIView = {
        let bottomContainerView = UIView()
//        bottomContainerView.backgroundColor = .red
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        return bottomContainerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        
        // container view
        addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        addSubview(topContainerView)
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
        
        addSubview(bottomContainerView)
        bottomContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
        topContainerView.addSubview(imageView)
        bottomContainerView.addSubview(descriptionText)
        
        // imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: -10).isActive = true
        // imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        descriptionText.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 10).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: bottomContainerView.leftAnchor, constant: 40).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: bottomContainerView.rightAnchor, constant: -40).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: 20).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implement")
    }
}
