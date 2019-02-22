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
    }
    private func setupCollectionNameLabel() {
        addSubview(collectionNameLabel)
        collectionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        collectionNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        collectionNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectionNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true


}
}
