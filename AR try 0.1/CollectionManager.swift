//
//  CollectionManager.swift
//  AR try 0.1
//
//  Created by denys pashkov on 15/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

class CollectionManager: UICollectionViewController {
    
//    MARK: - Init
    @IBOutlet weak var memes: UILabel!
    
    var found : Int = 0
    var memeFound : Int = 0
    var implemented : Int = 0
    var cellArray : [UICollectionViewCell] = [UICollectionViewCell()]
    var memeDetail : (imageName : String, textMeme : String) = ("","")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        memes.text = "\(memeFound)"
        
        if memeFound > implemented {
            
            implemented = memeFound
            
            changeMemeCell()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    MARK: - Data from ViewController are used here

    func changeMemeCell(){
        
        let memeImage = cellArray[implemented].viewWithTag(3) as! UIImageView
        memeImage.image = UIImage(named: memeDetail.imageName)
        
        let memeDescription = cellArray[implemented].viewWithTag(2) as! UILabel
        memeDescription.text = "\(memeDetail.textMeme)"
        
        
        
    }
    
//    MARK: - Manage the Collection
    
    //number of line
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GameViewController().returnNumber()
    }
    
    //work with cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        that's a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as UICollectionViewCell
        
        cell.layer.cornerRadius = 10

        cellArray.insert(cell, at: found)
        let label = cellArray[found].viewWithTag(2) as! UILabel
        label.text = "To Unlock \(found)"
        
        found = found + 1

        return cell
        
    }
    
}
