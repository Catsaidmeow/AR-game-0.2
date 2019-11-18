//
//  extension.swift
//  AR try 0.1
//
//  Created by denys pashkov on 15/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

//for manage easyer the main color of our aplication (i just wanted to create an extension,kinda childish right? )

extension UIColor{
    
    static func rgb(red : CGFloat, green : CGFloat, blue : CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func mainColor()->UIColor{
        return UIColor.rgb(red: 221, green: 94, blue: 86)
    }
    
}
