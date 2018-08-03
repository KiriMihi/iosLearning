//
//  FontViewController.swift
//  FirstApplication
//
//  Created by Kirill M on 03.08.2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

class FontViewController: UIViewController {

    @IBOutlet weak var textFont: UILabel!
    var font: String!
    var family: String!
    
    
    override func viewDidLoad() {
        
        
        textFont?.text = self.font as Optional
        textFont?.backgroundColor = UIColor.green
        
        super.viewDidLoad()
    }

}
