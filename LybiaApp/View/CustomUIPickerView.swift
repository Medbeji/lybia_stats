//
//  CustomUIPickerView.swift
//  LybiaApp
//
//  Created by MedBeji on 25/02/2018.
//  Copyright © 2018 unfpa. All rights reserved.
//

import UIKit

class CustomUIPickerView: UIPickerView,UIPickerViewDataSource, UIPickerViewDelegate {

    var model = ["5ans","6ans","7ans","8ans"]
    
    let pickerView = UIPickerView()
    
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
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 135, width: 75, height: 15)
        label.textAlignment = .center
        label.font = UIFont.init(name: "Farah", size: 18)
        
        let image = UIImage(named: "40ans")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 13, y: 75, width: 55, height: 55)
        
        label.text = model[row]
        label.textColor = .lightGray
        view.addSubview(label)
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
