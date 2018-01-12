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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBtnMenu()
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
    
   
    @IBAction func slideUp(_ sender: Any) {
        
    
        UIView.transition(with: sender as! UIView, duration: 1.5, options: .transitionFlipFromRight, animations: {
            self.btnView.layer.position.y = self.btnView.layer.position.y - 250
            self.btnView.transform = self.btnView.transform.rotated(by: CGFloat.init(Double.pi))
        }, completion: { (Succ) in
        })
    }
    
}
