//
//  CollectionViewCell.swift
//  FourSquareProject1
//
//  Created by Alfredo Barragan on 2/20/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    public lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
  
    public lazy var deleteButton: UIButton = {
      let button = UIButton()
      button.setTitle("Delete", for: .normal)
      button.setTitleColor(.black, for: .normal)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.isUserInteractionEnabled = true
      return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        }
    
    private func commonInit(){
        setupCollectionNameLabel()
        setupDeleteButton()
    }
    private func setupCollectionNameLabel() {
        addSubview(collectionNameLabel)
        collectionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        collectionNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        collectionNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectionNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
  private func setupDeleteButton(){
    addSubview(deleteButton)
    deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    deleteButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
    deleteButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.15).isActive = true
    deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
}
