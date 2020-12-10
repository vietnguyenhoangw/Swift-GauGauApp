//
//  ViewController.swift
//  GauGau
//
//  Created by coder on 12/10/20.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    // make sure you apply the correct encapsulation principles in your class
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .gray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    func setupLayout () {
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
        
        bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
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
    
    func setupBottomControl () {
//        view.addSubview(previousButton)
//        previousButton.backgroundColor = .red
        
        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
        yellowView.addSubview(previousButton)
        previousButton.leftAnchor.constraint(equalTo: yellowView.leftAnchor).isActive = true
        previousButton.rightAnchor.constraint(equalTo: yellowView.rightAnchor).isActive = true
        previousButton.bottomAnchor.constraint(equalTo: yellowView.bottomAnchor).isActive = true
        previousButton.topAnchor.constraint(equalTo: yellowView.topAnchor).isActive = true
        
        
        let blueView = UIView()
//        blueView.backgroundColor = .blue
        blueView.addSubview(pageControl)
        pageControl.leftAnchor.constraint(equalTo: blueView.leftAnchor).isActive = true
        pageControl.rightAnchor.constraint(equalTo: blueView.rightAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: blueView.bottomAnchor).isActive = true
        pageControl.topAnchor.constraint(equalTo: blueView.topAnchor).isActive = true
        
        
        let redView = UIView()
//        redView.backgroundColor = .red
        redView.addSubview(nextButton)
        nextButton.leftAnchor.constraint(equalTo: redView.leftAnchor).isActive = true
        nextButton.rightAnchor.constraint(equalTo: redView.rightAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
        
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [yellowView, blueView, redView])
        view.addSubview(bottomControlStackView)
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomControlStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // "view" is parent view
//        view.backgroundColor = .yellow
        view.addSubview(topContainerView)
        view.addSubview(bottomContainerView)
        topContainerView.addSubview(imageView)
        bottomContainerView.addSubview(descriptionText)
        
        setupLayout()
        setupBottomControl()
    }
    
}

