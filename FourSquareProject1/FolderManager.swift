//
//  FolderManager.swift
//  FourSquareProject1
//
//  Created by Jason on 2/12/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation

final class FolderManager{
  private init(){}
  private static let folderSaveingName = "FolderName.plist"
  private static var savingFolder = [FolderModel]()
  static func removing(at deleteIndex:Int){
    guard savingFolder.count - 1 >= deleteIndex else { return }
    savingFolder.remove(at: deleteIndex)
    savingEntry()
  }
  static func CreateNewFolder(type: FolderModel){
    savingFolder.append(type)
    savingEntry()
  }
  
  static func deletor(type : inout FolderModel, at deleteIndex:Int){
    guard let folderIndex = (savingFolder.firstIndex { $0.name == type.name }) else { return }
    savingFolder[folderIndex].contents.remove(at: deleteIndex)
    savingEntry()
  }
  
  static func appening(type : inout FolderModel, save: SaveModel, at index:Int){
    savingFolder[index].contents.append(save)
    savingEntry()
  }
  
  static func savingEntry(){
    let pathToSaveTo = DataPersistenceManager.filepathToDocumentsDirectory(filename: folderSaveingName)
    do {
      let favoriteQuiz = try PropertyListEncoder().encode(savingFolder)
      try favoriteQuiz.write(to: pathToSaveTo, options: Data.WritingOptions.atomic)
    } catch {
      print("error in the static function savingEntry: \(error)")
    }
  }
  
  static func loadingEntry() -> [FolderModel]{
    
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: folderSaveingName).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path){
        do {
          savingFolder = try PropertyListDecoder().decode([FolderModel].self, from: data)
        } catch {
          print(error)
        }
      } else {
        print("LoadtheEntry func data area is nil")
      }
    }
    else {
      print("\(folderSaveingName) does not exsist")
    }
    return savingFolder
  }
}
