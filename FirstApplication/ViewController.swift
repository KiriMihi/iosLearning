//
//  ViewController.swift
//  FirstApplication
//
//  Created by Kirill M on 03.08.2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var dictofFonts = [String: String]()
    var fonts = UIFont.familyNames.map({ UIFont.fontNames(forFamilyName: $0)}).reduce([]) { $0 + $1 }
    
    
    @IBOutlet weak var collectionViewList: UICollectionView!
    override func viewDidLoad() {
        for fontFamily in UIFont.familyNames
        {
            for fontName in UIFont.fontNames(forFamilyName: fontFamily as String)
            {
               dictofFonts[fontName] = fontFamily
            }
        }
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UICollectionView Delegate/DataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fonts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! CollectionViewCell
        
        let data = self.fonts[indexPath.item]
        collectionCell.textLabel.text = data
        collectionCell.textLabel.numberOfLines = 0
    
        let text = dictofFonts[self.fonts[indexPath.item]]
        collectionCell.textDesc.text = text
        collectionCell.textDesc.numberOfLines = 0
 
        
        
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fontFamily  = dictofFonts[fonts[indexPath.row]]
        let viewController = FontViewController(nibName: nil, bundle: nil)
        viewController.family = fontFamily
        viewController.font = fonts[indexPath.row]
        self.show(viewController, sender: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding - 20
        let collectionViewHeight = collectionView.frame.size.height - padding - 20
        
        return CGSize(width: collectionViewSize/2, height: collectionViewHeight/4)
    }
}

