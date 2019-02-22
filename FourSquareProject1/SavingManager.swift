//
//  SavingManager.swift
//  FourSquareProject1
//
//  Created by Jason on 2/12/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation

final class SavingManager{
  private init(){}
  private static let saving = "SavedVenue.plist"
  private static var save = [SaveModel]()
  
  static func removing(index: Int){
    save.remove(at: index)
    savingEntry()
  }
  static func appening(type : SaveModel){
    save.append(type)
    savingEntry()
  }
  
  static func savingEntry(){
    
    let pathToSaveTo = DataPersistenceManager.filepathToDocumentsDirectory(filename: saving)
    do {
      let favoriteQuiz = try PropertyListEncoder().encode(save)
      try favoriteQuiz.write(to: pathToSaveTo, options: Data.WritingOptions.atomic)
    } catch {
      print("error in the static function savingEntry: \(error)")
    }
  }
  
  static func loadingEntry() -> [SaveModel]{
    
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: saving).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path){
        do {
          save = try PropertyListDecoder().decode([SaveModel].self, from: data)
        } catch {
          print(error)
        }
      } else {
        print("LoadtheEntry func data area is nil")
      }
    } else {
      print("\(saving) does not exsist")
    }
    return save
  }
}
