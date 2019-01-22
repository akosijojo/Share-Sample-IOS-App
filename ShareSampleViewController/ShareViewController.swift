//
//  ShareViewController.swift
//  ShareSampleViewController
//
//  Created by OrangeApps Inc. on 1/22/19.
//  Copyright © 2019 OrangeApps Inc. All rights reserved.
//

import UIKit

class ShareViewController : UIViewController,UIDocumentInteractionControllerDelegate {
    
    let imageView : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "winImage")
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.center = view.center
    }
 
    
    
}

