//
//   SwippingController.swift
//  GauGau
//
//  Created by coder on 12/10/20.
//

import UIKit

//struct Page {
//    
//    let image: String
//    let descriptionText: String
//
//}

class SwippingControl: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(image: "universal_icon", descriptionText: "\n\n My first build iOS App with layout only using code. Thanks for visited, let's enjoy this app."),
        Page(image: "fire_icon", descriptionText: "\n\n Build layout using code 100%, practice with CollectionView, Swift logic more ..."),
        Page(image: "king_icon", descriptionText: "\n\n Let's start to be understand Swift")]
    
//    let image = ["universal_icon", "fire_icon", "king_icon"]
//    let descriptionContent = ["\n My first build iOS App with layout only using code. Thanks for visited, let's enjoy this app.", "\n Build layout using code 100%, practice with CollectionView, Swift logic more ...", "Let's start to be understand Swift"]
    
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
        setupBottomControl ()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        // MARK: We can using this way to assign each data's value for each UIView
//        cell.imageView.image = UIImage(named: pages[indexPath.item].image)
//        cell.descriptionText.text = pages[indexPath.item].descriptionText
        
        // MARK: Or we can passing object to cell and get value later
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
