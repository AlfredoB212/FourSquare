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
        label.backgroundColor = .white
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
        collectionNameLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
        collectionNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
        collectionNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        collectionNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true


}
}
