//
//  DetailViewSetup.swift
//  FourSquareProject1
//
//  Created by Jason on 2/11/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class DetailViewSetup: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    lazy var picture: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .black
        
    return image
    }()
    
    lazy var address: UILabel = {
       var label = UILabel()
        label.numberOfLines = 0
        label.text = "Address"
        
        return label
    }()
    
    lazy var nameOfLocation: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.text = "Name"

        return label
    }()
    
    lazy var direction: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .green
        button.titleLabel?.textColor = .white
        button.setTitle("Direction", for: .normal)
        
        return button
    }()
    
    lazy var tip: UITextView = {
        var textField = UITextView()
        textField.makeTextWritingDirectionLeftToRight(self)
        textField.backgroundColor = .blue
        textField.allowsEditingTextAttributes = true
        
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        var button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    
    
    
    func commonInit(){
        pictureLayout()
        nameAddressLayout()
        addressLayout()
        directionLayout()
        tipLayout()
        saveButtonLayout()
    }
    func saveButtonLayout(){
        addSubview(saveButton)
        
    }
    
    func pictureLayout(){
        addSubview(picture)
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        picture.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        picture.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        picture.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true

    }
    
    func addressLayout(){
        addSubview(address)
        address.translatesAutoresizingMaskIntoConstraints = false
        address.topAnchor.constraint(equalTo: nameOfLocation.bottomAnchor, constant: 15).isActive = true
        address.heightAnchor.constraint(equalToConstant: 30).isActive = true

        address.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        address.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
    }
    func nameAddressLayout(){
        addSubview(nameOfLocation)
        nameOfLocation.translatesAutoresizingMaskIntoConstraints = false
        nameOfLocation.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 15).isActive = true
        nameOfLocation.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameOfLocation.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        nameOfLocation.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
    }
    
    func directionLayout(){
        addSubview(direction)
        direction.translatesAutoresizingMaskIntoConstraints = false
        direction.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 15).isActive = true
        direction.heightAnchor.constraint(equalToConstant: 30).isActive = true
        direction.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        direction.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
    }
    
    func tipLayout(){
        addSubview(tip)
        tip.translatesAutoresizingMaskIntoConstraints = false
        tip.topAnchor.constraint(equalTo: direction.bottomAnchor, constant: 15).isActive = true
        tip.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tip.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        tip.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true

    }
    
    
    
}
