//
//  ModalFolderView.swift
//  FourSquareProject1
//
//  Created by J on 2/20/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class ModalFolderView: UIView {
  public var folderTableView: UITableView = {
    let tv = UITableView()
    tv.backgroundColor = .white
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
  
  public var blurEffectView: UIVisualEffectView = {
    let effect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    let blurView = UIVisualEffectView(effect: effect)
    blurView.translatesAutoresizingMaskIntoConstraints = false
    return blurView
  }()
  
  override init(frame: CGRect) {
    super.init(frame:UIScreen.main.bounds)
    commonInit()
  }
  
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    setupView()
  }
  
  private func setupView(){
    setupBlurEffect()
    setupTableView()
    backgroundColor = .clear
  }
  
  private func setupTableView(){
    addSubview(folderTableView)
    folderTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    folderTableView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    folderTableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
    folderTableView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
  }
  
  private func setupBlurEffect(){
    addSubview(blurEffectView)
    blurEffectView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    blurEffectView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    blurEffectView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    blurEffectView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
  }
}
