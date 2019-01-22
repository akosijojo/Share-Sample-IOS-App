//
//  PopUpViewController.swift
//  ShareSampleViewController
//
//  Created by OrangeApps Inc. on 1/22/19.
//  Copyright © 2019 OrangeApps Inc. All rights reserved.
//

import UIKit

class PopUpViewController : UIViewController, UIDocumentInteractionControllerDelegate  {
    
    let contentView : UIView = {
        let view = UIView()
        view.alpha = 0
        return view
    }()
    
    let imageView : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "imageView")
        return img
    }()
    
    let closeButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "cross"), for: .normal)
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        btn.backgroundColor = .white
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return btn
    }()
    
    let shareButton : UILabel = {
        let btn = UILabel()
//        btn.setImage(UIImage(named: "sharebtn"), for: .normal)
//        btn.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
//        btn.backgroundColor = UIColor.gray
//        btn.imageEdgeInsets = UIEdgeInsets(top: btn.frame.size.width - 30, left: btn.frame.size.width - 30, bottom: btn.frame.size.width - 30, right: btn.frame.size.width - 30)
//        btn.layer.borderWidth = 2
//        btn.layer.borderColor = UIColor.white.cgColor
        btn.isUserInteractionEnabled = true
        btn.backgroundColor = .clear
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animate(withDuration: 0.500) {
            self.contentView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    func setUpView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.leading.equalTo(view)
            make.trailing.bottom.equalTo(view)
        }

        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.leading.equalTo(contentView)
            make.trailing.bottom.equalTo(contentView)
        }

        let height : CGFloat = view.frame.height / 20
        let padding : CGFloat = view.frame.height / 5 - height + 5
        let width : CGFloat = view.frame.width / 4 + 10
        contentView.addSubview(shareButton)
        shareButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.bottom.equalTo(contentView).offset(-padding)
        }
        
        contentView.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.layoutMarginsGuide.snp.top).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.width.equalTo(30)
        }
        closeButton.layer.cornerRadius = 15
        
        let tapShare = UITapGestureRecognizer(target: self, action: #selector(shareButtonAction))
        shareButton.addGestureRecognizer(tapShare)
    }
    
    @objc func closeAction() {
//        UIView.animate(withDuration: 0.500, animations: {
//            self.contentView.alpha = 0
//            self.view.layoutIfNeeded()
//        }) { (_) in
//            self.dismiss(animated: true, completion: nil)
//        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func shareButtonAction() {
        print("Share Action")
        postImage(img: UIImage(named: "winImage")!)
    }

}


// sharing extension
extension PopUpViewController {
    
    func postImage(img: UIImage) {
    
        let shareItems:Array = [img]
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.print, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToVimeo]
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        self.present(activityViewController, animated: true, completion: nil)

    }
    
}

