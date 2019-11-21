//
//  SceneManager.swift
//  AR try 0.1
//
//  Created by denys pashkov on 13/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

class MemesClass {
    
    var memeDict: [Int:Meme] = [
        0:
            Meme(imageName: "meme-image-1", description: "this is a test description", name: "Meme 1", hint: "Look behind the water thingy"),
        1:
            Meme(imageName: "meme-image-2", description: "this is a test description", name: "Meme 2", hint: "meow"),
        2:
            Meme(imageName: "meme-image-1", description: "Much book such knowlegde", name: "Doge", hint: "book"),
    ]
    
    // save the index for the found meme in plist
    func storeFoundMeme(){
        
        let archiveURL = Bundle.main.url(forResource: "FoundMemes", withExtension: "plist")!
        
        // store the index of the memes found
        var foundMemeNames: [Int] = []
        for (key, meme) in memeDict {
            if meme.found {
                foundMemeNames.append(key)
            }
        }
        
        let encoded = try? PropertyListEncoder().encode(foundMemeNames)
        try? encoded?.write(to: archiveURL, options: .noFileProtection)
        
    }
    
    // load found memes from plist file and set found to true
    func loadFoundMemes(){
        
        if  let archiveURL = Bundle.main.url(forResource: "FoundMemes", withExtension: "plist"),
            let retrivedNotesData = try? Data(contentsOf: archiveURL),
            let foundIndecies = try? PropertyListDecoder().decode([Int].self, from: retrivedNotesData) {
            
            for index in foundIndecies {
                memeDict[index]!.found = true
            }
            
        }
    }
    
}

let memeDatabase = MemesClass()
