//
//  CollectionViewController.swift
//  FourSquareProject1
//
//  Created by Alfredo Barragan on 2/11/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit
class CollectionViewController: UIViewController {
  let controlView = CollectionView()
  var folders = [FolderModel](){
        didSet{
           self.controlView.myCollectionView.reloadData()
        }
    }
  let cellIdentifier = "CollectionViewCell"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(controlView)
        title = "My Collection"
        controlView.myCollectionView.dataSource = self 
        controlView.myCollectionView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAlert))
        }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        folders = FolderManager.loadingEntry()
    }
    
    @objc func showAlert(){
        let alert = UIAlertController(title: "Enter title for new folder", message: "No spaces allowed or special characters", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "enter folder title"
            textField.textAlignment = .center
        }
        let okay = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            if var text = alert.textFields?.first?.text{
                text.insert("@", at: text.startIndex)
                let folder = FolderModel(name: text, contents: [SaveModel]())
                FolderManager.CreateNewFolder(type: folder)
                self.folders = FolderManager.loadingEntry()
            }
        }
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }
  @objc private func deleteFolder(_ sender:UIButton){
    let deleteAtIndex = sender.tag
    FolderManager.removing(at: deleteAtIndex)
    folders = FolderManager.loadingEntry()
  }
}
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return folders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { fatalError("")}
        let folder = folders[indexPath.row]
        cell.deleteButton.tag = indexPath.row
        cell.collectionNameLabel.text = folder.name
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.black.cgColor
        cell.backgroundColor = .lightGray
        cell.deleteButton.addTarget(self, action: #selector(deleteFolder(_:)), for: .touchUpInside)
        return cell
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let folder = folders[indexPath.row]
        let venuesVC = VenuesViewController(folder: folder)
        navigationController?.pushViewController(venuesVC, animated: true)
    }
}
