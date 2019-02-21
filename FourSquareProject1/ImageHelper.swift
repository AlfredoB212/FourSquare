//
//  ImageHelper.swift
//  FourSquareProject1
//
//  Created by Alfredo Barragan on 2/8/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//
import UIKit
final class ImageHelper {
  private init() {}
  private static var savedImages = fetchImages()
  private static let filename = "Images.plist"
  
  private static var cache = NSCache<NSString, UIImage>()
  
  static func fetchImageFromNetwork(urlString: String, completion: @escaping (AppError?, UIImage?) -> Void) {
    NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data ) in
      if let appError = appError {
        completion(appError, nil)
      } else if let data = data {
        DispatchQueue.global().async {
          if let image = UIImage(data: data) {
            let imageModel = ImageModel(url:urlString, data:data)
            saveImageToDisk(image: imageModel)
            DispatchQueue.main.async {
              completion(nil, image)
            }
          }
        }
      }
    }
  }
  
  static func fetchImageFromCache(urlString: String) -> UIImage? {
    return cache.object(forKey: urlString as NSString)
  }
  
  static func fetchImage(urlString:String) -> UIImage {
    guard var image = UIImage(named: "placeHolder") else { fatalError("NO PLACEHOLDER") }
    guard let savedImageData = (fetchImages().first { $0.url == urlString })?.data,
      let savedImage = UIImage(data: savedImageData) else {
      fetchImageFromNetwork(urlString: urlString) { (error, networkImage) in
        if let error = error {
          print(error)
        } else if let networkImage = networkImage {
          image = networkImage
        }
      }
      return image
    }
    image = savedImage
    return image
  }
  
  private static func saveImageToDisk(image:ImageModel){
    savedImages.append(image)
    save(images: savedImages)
  }
  
  private static func save(images:[ImageModel]){
    
    let imagesPath = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
    do{
      let imagesData = try PropertyListEncoder().encode(images)
      try imagesData.write(to: imagesPath, options: Data.WritingOptions.atomic)
    }catch{
      print("error in the static function save: \(error)")
    }
  }
  private static func fetchImages() -> [ImageModel] {
    var images = [ImageModel]()
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path){
        if let savedImages = try? PropertyListDecoder().decode([ImageModel].self, from: data) {
          images = savedImages
          return images
        }
      }
    }
    return images
  }
}
