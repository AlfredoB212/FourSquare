//
//  ModalViewController.swift
//  FourSquareProject1
//
//  Created by J on 2/20/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
  private let modalView = ModalFolderView()
  private var folders = [FolderModel]()
  private var venue: SaveModel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
        setupTapGesture()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDelegates()
        setupUI()
        setupTapGesture()
    }
  
  public convenience init(folders:[FolderModel], venue:SaveModel){
    self.init()
    self.folders = folders
    self.venue = venue
    self.view.backgroundColor = .clear
  }
  
  private func setupDelegates(){
    modalView.folderTableView.delegate = self
    modalView.folderTableView.dataSource = self
  }
  
  private func setupUI(){
    view.addSubview(modalView)
  }
  
  private func setupTapGesture(){
    let tapGesture = UITapGestureRecognizer()
    tapGesture.addTarget(self, action: #selector(dismissView(_:)))
    modalView.blurEffectView.addGestureRecognizer(tapGesture)
    
  }
  
  @objc private func dismissView(_ sender:UITapGestureRecognizer){
    dismiss(animated: true, completion: nil)
  }
    
}

extension ModalViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return folders.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let folder = folders[indexPath.row]
    cell.textLabel?.text = folder.name
    cell.textLabel?.backgroundColor = .black
    return cell
  }
}

extension ModalViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var folder = folders[indexPath.row]
    FolderManager.appening(type: &folder, save: venue, at:indexPath.row)
    let folders2 = FolderManager.loadingEntry()
    dump(folders2)
    dismiss(animated: true, completion: nil)
  }
}
