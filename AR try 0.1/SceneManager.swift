//
//  SceneManager.swift
//  AR try 0.1
//
//  Created by denys pashkov on 13/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

class WindowManager{
    
    var imageName : String = ""
    var textMeme : String = ""
    
    var memeArray : [meme] = []
    
//    it just works
    
    func writeArray(){
        
//        let plistURL = Bundle.main.url(forResource: "ObjectToMeme", withExtension: "plist")!
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let archiveURL = (documentsDirectory?.appendingPathComponent("ObjectToMeme").appendingPathExtension("plist"))!
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(memeArray)
        try? encodedNotes?.write(to: archiveURL, options: .noFileProtection)
    }
//    works
    func addMeme(){
        
        memeArray.append(meme(imageName: "peppe", textMeme: "the", memeName: "Frog", objectName: "Gay"))
        
    }
//    works
    func seeArray(){
        
        print("Here we go again \(memeArray)")
        
    }
//    bullshit
    func readArray(){
        print("Dimension")
        
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//        let archiveURL = (documentsDirectory?.appendingPathComponent("ObjectToMeme").appendingPathExtension("plist"))!
//
//        print(archiveURL)
//        let propertyListDecoder = PropertyListDecoder()
//        if let retrivedNotesData = try? Data(contentsOf: archiveURL){
//
//            print("Dimensions")
//            if let decodedNotes = try? propertyListDecoder.decode([meme].self, from: retrivedNotesData) {
//
//                print("Dimensiones \(decodedNotes)")
//
//            }
//        }
        
        
        // try for the one that i have on my navigator
        
//
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                let archiveURL = (documentsDirectory?.appendingPathComponent("ObjectToMeme").appendingPathExtension("plist"))!
        
                print(archiveURL)
        
                let propertyListDecoder = PropertyListDecoder()
        if  let archiveURL = Bundle.main.url(forResource: "ObjectToMeme", withExtension: "plist"){
            print("Beppe : \(archiveURL)")
            if let retrivedNotesData = try? Data(contentsOf: archiveURL){
                print("Meppe : \(retrivedNotesData)")
                if let decodedNotes = try? propertyListDecoder.decode([meme].self, from: retrivedNotesData) {
                
                                print("Dimensiones \(decodedNotes)")
                
                            }
                
            }
            
            
        }

        print("Dimens")
        
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
    

    

