//
//  CustomUIPickerView.swift
//  LybiaApp
//
//  Created by MedBeji on 25/02/2018.
//  Copyright © 2018 unfpa. All rights reserved.
//

import UIKit

class CustomUIPickerView: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {

    var model = [String]()
    
 
    
    var rotationAngle: CGFloat!
    
    let width:CGFloat = 100
    let height:CGFloat = 100
    
    var widthComponent: CGFloat?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 75
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
       
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 75, height: 150)
     
        let image = UIImage(named: model[row])
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 13, y: 75, width: 55, height: 55)
        view.addSubview(imageView)
         // view rotation
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        
        return view
    }
    
    func transformToHorizontale(){
        rotationAngle = -90 * (.pi/180)
        self.transform = CGAffineTransform(rotationAngle: rotationAngle)
    }
    
}
