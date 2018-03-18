//
//  DetailVC.swift
//  LybiaApp
//
//  Created by MedBeji on 12/01/2018.
//  Copyright © 2018 unfpa. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var btn: UIButton!
    
    
    
    var isSlideUp: Bool = true
    var menuBottomAnchor: NSLayoutConstraint?
    
    @IBOutlet weak var femaleLogo: UIImageView!
    @IBOutlet weak var maleLogo: UIImageView!
    @IBOutlet weak var totalLogo: UIImageView!
    
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    lazy var indicatorsCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor  = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.contentInset =  UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        return cv
    }()
    
    
    let swipeUPView : UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let cellId = "indicatorsCellId"
    
    
    let femaleNbr: UILabel = {
        let lbl = UILabel()
        lbl.text = "3500,00"
        lbl.textColor = .white
        lbl.textAlignment  = .center
        lbl.font = UIFont.systemFont(ofSize: 22)
        return lbl
    }()
    
    let maleNbr: UILabel = {
        let lbl = UILabel()
        lbl.text = "3500,00"
        lbl.textColor = .white
        lbl.textAlignment  = .center
        lbl.font = UIFont.systemFont(ofSize: 22)
        return lbl
    }()
    
    let totalNbr: UILabel = {
        let lbl = UILabel()
        lbl.text = "3500,00"
        lbl.textColor = .white
        lbl.textAlignment  = .center
        lbl.font = UIFont.systemFont(ofSize: 22)
        return lbl
    }()
    
    /* Menu Elements */
        let menuView: UIView =  {
            let view = UIView()
            view.backgroundColor     = UIColor.init(red: 68/255, green: 87/255, blue: 106/255, alpha: 1)
            //Shadow
            view.layer.shadowColor   = UIColor.lightGray.cgColor
            view.layer.shadowOffset  = .zero
            view.layer.shadowOpacity = 1.5
            view.layer.masksToBounds = false
            view.layer.shadowRadius  = 4.0
            return view
        }()
    
        let ageTitle : UILabel = {
            let lb  = UILabel()
            lb.text = "العمر"
            lb.font = UIFont.init(name: "Farah", size: 22)
            lb.textAlignment = .center
            lb.textColor = .white
            return lb
        }()
    
        lazy var  sectionTitle : UILabel = {
            let lb           = UILabel()
            lb.text          = "القطاع"
            lb.font          = UIFont.init(name: "Farah", size: 22)
            lb.textAlignment = .center
            lb.textColor     = .white
            lb.frame         = CGRect(x: 0, y: 130, width: self.view.frame.width, height: 30)
            return lb
        }()
    
    @IBOutlet weak var indicatorsLogo: UIImageView!
    

        let agePickerView = CustomUIPickerView()
        let sectionPickerView = CustomUIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
        setupPickerView(pickerView: agePickerView,y: 44)
        setupPickerView(pickerView: sectionPickerView,y:160)
        numbersSetup()
        setupSwipeUpGesture()
        setupIndicatorsCV()
    }
    func setupSwipeUpGesture(){
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        swipeUpGesture.direction = UISwipeGestureRecognizerDirection.up
        swipeUpGesture.delegate = self
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        swipeDownGesture.direction = UISwipeGestureRecognizerDirection.down
        swipeDownGesture.delegate = self
        view.addGestureRecognizer(swipeUpGesture)
        view.addGestureRecognizer(swipeDownGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {

            return true
    }
    
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        slideUp(swipeUPView)
    }
    
    
    func setupIndicatorsCV(){
        view.addSubview(indicatorsCV)
        view.sendSubview(toBack: indicatorsCV)
        indicatorsCV.register(IndicatorCell.self, forCellWithReuseIdentifier: cellId)
        indicatorsCV.anchor(indicatorsLogo.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 2, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 82)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateFirstCategory()
    }
   
    @IBAction func changeCategory(_ sender: Any) {
        
        switch categorySegmentedControl.selectedSegmentIndex
        {
        case 0:
             animateFirstCategory()
        case 1:
             animateSecondCategory()
        default:
            break
        }
    }
    
    func animateFirstCategory() {
        self.femaleLogo.alpha = 1
        self.maleLogo.alpha = 1
        self.totalLogo.alpha = 0
        bouncingAnimation(view: self.femaleLogo)
        bouncingAnimation(view: self.maleLogo)
    }
    func animateSecondCategory(){
        self.femaleLogo.alpha = 0
        self.maleLogo.alpha = 0
        self.totalLogo.alpha = 1
        bouncingAnimation(view: self.totalLogo)
    }
    
    func bouncingAnimation(view : UIView){
        view.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        UIView.animate(withDuration: 3.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: {
                        view.transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
    }
    
    func numbersSetup(){
        
         // check if it's sex or | general
        maleLogo.addSubview(maleNbr)
        maleNbr.anchor(maleLogo.topAnchor, left: maleLogo.leftAnchor, bottom: nil, right: maleLogo.rightAnchor, topConstant: 5, leftConstant: 1, bottomConstant: 0, rightConstant: 1, widthConstant: 0, heightConstant: 25)
        femaleLogo.addSubview(femaleNbr)
        femaleNbr.anchor(femaleLogo.topAnchor, left: femaleLogo.leftAnchor, bottom: nil, right: femaleLogo.rightAnchor, topConstant: 5, leftConstant: 1, bottomConstant: 0, rightConstant: 1, widthConstant: 0, heightConstant: 25)
        
        totalLogo.addSubview(totalNbr)
        totalNbr.anchor(totalLogo.topAnchor, left: totalLogo.leftAnchor, bottom: nil, right: totalLogo.rightAnchor, topConstant: 5, leftConstant: 1, bottomConstant: 0, rightConstant: 1, widthConstant: 0, heightConstant: 25)
        
    }
    
    
    
    func setupPickerView(pickerView: CustomUIPickerView,y: CGFloat){
        pickerView.widthComponent = self.view.frame.width
        pickerView.delegate = pickerView.self
        pickerView.dataSource = pickerView.self
        pickerView.transformToHorizontale()
        menuView.addSubview(pickerView)
        pickerView.frame = CGRect(x: 0 - 300, y: y  , width: view.frame.width + 600, height: 75)
        pickerView.selectRow(1, inComponent: 0, animated: true)
    }
    
    func setupMenu(){
        // Set the corner radius for the image
        btnView.layer.cornerRadius = btnView.frame.width/2
        // Give btn a shadow
        btnView.backgroundColor     = .white
        btnView.layer.shadowColor   = UIColor.lightGray.cgColor
        btnView.layer.shadowOffset  = .zero
        btnView.layer.shadowOpacity = 1.5
        btnView.layer.masksToBounds = false
        btnView.layer.shadowRadius  = 4.0
        // Add Menu to superview
        self.view.addSubview(menuView)
        menuBottomAnchor = self.menuView.anchorWithReturnAnchors(nil, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -242, rightConstant: 0, widthConstant: 0, heightConstant: 242)[1]
        // Add ageTitle to menu
        self.menuView.addSubview(ageTitle)
        self.menuView.addSubview(sectionTitle)
        ageTitle.anchor(menuView.topAnchor, left: menuView.leftAnchor, bottom: nil, right: menuView.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
     
    }
    
   
    @IBAction func slideUp(_ sender: Any) {
        // Slide up btn
        UIView.transition(with: sender as! UIView, duration: 1.0, options: .transitionFlipFromRight, animations: {
           self.slideUpBtn()
        }, completion: { (Succ) in
            
        })
    }
    
    func slideUpBtn(){
        if self.isSlideUp {
            self.btnView.layer.position.y  = self.btnView.layer.position.y - 250
            self.menuView.layer.position.y = self.menuView.layer.position.y - 242
          
        } else {
            self.btnView.layer.position.y  = self.btnView.layer.position.y + 250
            self.menuView.layer.position.y = self.menuView.layer.position.y + 242
        }
        self.isSlideUp = !self.isSlideUp
        self.btnView.transform = self.btnView.transform.rotated(by: CGFloat.init(Double.pi))
    }
 
}




