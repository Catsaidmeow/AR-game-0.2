//
//  CollectionViewCell.swift
//  AR try 0.1
//
//  Created by denys pashkov on 20/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var memeAllocated : meme = meme(imageName: "", textMeme: "", memeName: "", objectName: "")
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var memeName: UILabel!
    @IBOutlet weak var memeHint: UILabel!
    
}
