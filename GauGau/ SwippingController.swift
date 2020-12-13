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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
