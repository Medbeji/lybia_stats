//
//  DetailVC.swift
//  LybiaApp
//
//  Created by MedBeji on 12/01/2018.
//  Copyright © 2018 unfpa. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var btn: UIButton!
    var isSlideUp: Bool = true
    var menuBottomAnchor: NSLayoutConstraint?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBtnMenu()
        self.view.addSubview(menuView)
        menuBottomAnchor = self.menuView.anchorWithReturnAnchors(nil, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -242, rightConstant: 0, widthConstant: 0, heightConstant: 242)[1]
    }
    
    func setupBtnMenu(){
        // Set the corner radius for the image
        btnView.layer.cornerRadius = btnView.frame.width/2
        // Give btn a shadow
        btnView.backgroundColor = .white
        btnView.layer.shadowColor = UIColor.lightGray.cgColor
        btnView.layer.shadowOffset = .zero
        btnView.layer.shadowOpacity = 1.5
        btnView.layer.masksToBounds = false
        btnView.layer.shadowRadius = 4.0
    }
    
    let menuView: UIView =  {
       let view = UIView()
        view.backgroundColor = UIColor.init(red: 68/255, green: 87/255, blue: 106/255, alpha: 1)
        //Shadow
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 1.5
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 4.0
        return view
    }()
    

    
    @IBAction func slideUp(_ sender: Any) {
        // Slide up btn
        UIView.transition(with: sender as! UIView, duration: 1.0, options: .transitionFlipFromRight, animations: {
           self.slideUpBtn()
        }, completion: { (Succ) in
            
        })
    }
    
    func slideUpBtn(){
        if self.isSlideUp {
            self.btnView.layer.position.y = self.btnView.layer.position.y - 250
            self.menuView.layer.position.y = self.menuView.layer.position.y - 242
          
        } else {
            self.btnView.layer.position.y = self.btnView.layer.position.y + 250
            self.menuView.layer.position.y = self.menuView.layer.position.y + 242

        }
        self.isSlideUp = !self.isSlideUp
        self.btnView.transform = self.btnView.transform.rotated(by: CGFloat.init(Double.pi))
    }
 
}
