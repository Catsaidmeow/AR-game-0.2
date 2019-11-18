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
    
    var arrayCounter : Int = 0
    var implemented : Int = 0
    var buttonClicked : Int = 0
    var cellArray : [UICollectionViewCell] = [UICollectionViewCell()]
    var memeDetail : [meme] = []
    
    override func viewDidAppear(_ animated: Bool) {
        
        memeFoundUpdate()
        
        while memeDetail.count > implemented {
            
            changeMemeCell()
            implemented = implemented + 1

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//        MARK: - Take Datas From Meme Found
    
    func memeFoundUpdate(){
        
        if  let archiveURL = Bundle.main.url(forResource: "MemeFound", withExtension: "plist"),
        let retrivedNotesData = try? Data(contentsOf: archiveURL),
        let decodedNotes = try? PropertyListDecoder().decode([meme].self, from: retrivedNotesData) {
            
            memeDetail = decodedNotes
            
        }
    }

//        MARK: - Manage the Collection
        
//        number of line
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return GameViewController().returnNumber() + implemented
        }
        
//        work with cell
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
//        that's a cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as UICollectionViewCell
            
            cell.layer.cornerRadius = 10
            
            cellArray.insert(cell, at: arrayCounter)
            let label = cellArray[arrayCounter].viewWithTag(2) as! UILabel
            label.text = "To Unlock \(arrayCounter)"
            
            let popUpButton = cellArray[arrayCounter].viewWithTag(4) as! UIButton
            
            popUpButton.tag = popUpButton.tag + arrayCounter
            
            arrayCounter = arrayCounter + 1

            return cell
            
        }
    
    //    MARK: - Manage Cells

    func changeMemeCell(){
        
        // try with element 0 to set
        let memeImage = cellArray[implemented].viewWithTag(3) as! UIImageView
        memeImage.image = UIImage(named: memeDetail[implemented].imageName)
        
        let memeDescription = cellArray[implemented].viewWithTag(2) as! UILabel
        memeDescription.text = "\(memeDetail[implemented].textMeme)"
        
    }
    
//    MARK: - Segue managment
    
    @IBAction func toInformation(_ sender: AnyObject) {

        buttonClicked = sender.tag - 4
        
        performSegue(withIdentifier: "toInformation", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextScreen = segue.destination as! PopUpViewController
        if implemented > buttonClicked {
            nextScreen.imageName = memeDetail[0].imageName
            nextScreen.descriptionText = memeDetail[0].textMeme
            
        }
        else{
            nextScreen.imageName = "placeholder.jpeg"
            nextScreen.descriptionText = "Work in progress\nplease wait"
            
        }

    }
    
}
