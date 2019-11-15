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
    
    var found : Int = 0
    var cellArray : [UICollectionViewCell] = [UICollectionViewCell()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    MARK: - Add Found Meme
    
    func sevisnef(array : [UICollectionViewCell]){
        
        print("This is my cell \(cellArray[0])")
        let label = cellArray[5].viewWithTag(2) as! UILabel
        label.text = "Got it"
        
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
        print(found)
        print(cell.viewWithTag(2) as! UILabel)
        if found == 6 {
            print("This is my cell \(cellArray[0])")
            sevisnef(array: cellArray)
        }
        return cell
        
    }
    
}
