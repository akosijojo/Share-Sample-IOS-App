//
//  ViewController.swift
//  ShareSampleViewController
//
//  Created by OrangeApps Inc. on 1/22/19.
//  Copyright © 2019 OrangeApps Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let showButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        button.setTitle("Show", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(showPopView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(showButton)
        showButton.center = view.center
    }

    @objc func showPopView() {
        let controller = PopUpViewController()
        self.present(controller, animated: true, completion: nil)
    }

}

