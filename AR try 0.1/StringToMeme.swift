//
//  SceneManager.swift
//  AR try 0.1
//
//  Created by denys pashkov on 13/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

class MemesClass{
 
    var memeArray : [meme] = []
    
//    How write on plist with array
    
    func writeArray(){
        
        let archiveURL = Bundle.main.url(forResource: "ObjectToMeme", withExtension: "plist")!
        let encodedNotes = try? PropertyListEncoder().encode(memeArray)
        try? encodedNotes?.write(to: archiveURL, options: .noFileProtection)
        
    }
    
//    for read back all the memes with date
    func refreshArray(){
        
    if  let archiveURL = Bundle.main.url(forResource: "ObjectToMeme", withExtension: "plist"),
        let retrivedNotesData = try? Data(contentsOf: archiveURL),
        let decodedNotes = try? PropertyListDecoder().decode([meme].self, from: retrivedNotesData) {
            
            memeArray = decodedNotes
            
        }
                
}
    
    func ObjectToMeme(objectName : String) -> meme{
            
        for tempMeme in memeArray {
                
            if tempMeme.objectName == objectName {
                return tempMeme
                
            }
        }
        
        return meme(imageName: "placeholder.jpeg", textMeme: "Work in progress\nplease wait", memeName: "Placeholder", objectName: "noneFound")
    
    }
}
    

    

