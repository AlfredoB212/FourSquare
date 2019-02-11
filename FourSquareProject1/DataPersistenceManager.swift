//
//  DataPersistenceManager.swift
//  FourSquareProject1
//
<<<<<<< HEAD
//  Created by Alfredo Barragan on 2/11/19.
=======
//  Created by Alfredo Barragan on 2/8/19.
>>>>>>> 13900dbe1a78505b10b2ccc8df4ac59d42af8f32
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation
final class DataPersistenceManager {
    private init() {}
    
    static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func filepathToDocumentsDirectory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}
