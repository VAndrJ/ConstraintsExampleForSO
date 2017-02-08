//
//  ViewController.swift
//  ConstraintsExampleForSO
//
//  Created by VAndrJ on 2/8/17.
//  Copyright © 2017 VAndrJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customview(vc: self, num: "12323423 P")
    }
    
    func customview(vc: UIViewController, num: String){
        let v = UIView()
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 15
        //let touch = UITapGestureRecognizer(target:vc, action:Selector("boxButton:"))
        //v.addGestureRecognizer(touch)
        
        let imgBox = UIImageView(image: UIImage(named: "box_image_gray.png"))
        imgBox.contentMode = UIViewContentMode.scaleAspectFit
        v.addSubview(imgBox)
        
        let textview = UILabel()
        textview.text = num
        textview.font = UIFont(name:"HelveticaNeue-Bold", size: 13.0)
        textview.textColor = UIColor.black
        textview.textAlignment = NSTextAlignment.center
        v.addSubview(textview)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        textview.translatesAutoresizingMaskIntoConstraints = false
        imgBox.translatesAutoresizingMaskIntoConstraints = false
        //в Swift 2 NSLayoutConstraint.constraintsWithVisualFormat(...
        v.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[img(20)]-5-|", options: [], metrics: nil, views: ["img": imgBox]))
        v.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lbl(30)]-0-|", options: [], metrics: nil, views: ["lbl": textview]))
        v.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[lbl(>=50)]-5-[img(20)]-5-|", options: [], metrics: nil, views: ["img": imgBox, "lbl": textview]))
        NSLayoutConstraint.activate(v.constraints)
        
        let logButton : UIBarButtonItem = UIBarButtonItem(customView: v)
        vc.navigationItem.rightBarButtonItem = logButton
    }
}

