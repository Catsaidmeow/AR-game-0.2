//
//  SceneManager.swift
//  AR try 0.1
//
//  Created by denys pashkov on 13/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

class WindowManager{
    
    var imageName : String = ""
    var textMeme : String = ""
    
    func ObjectToMeme(objectName : String) -> (imageName : String, textMeme : String) {
        
        switch objectName {
        case "Cuffie2", "Cuffie" :
            return ("images-2.jpeg","Albertino \nAngela")
        case "Scatola" :
            return ("images-2.jpeg","Divulgazione")
        default:
            return ( "placeholder.jpeg" , "Work in progress\nplease wait" )
        }        
    }
    
}
