//
//  UICollectionView.swift
//  AR try 0.1
//
//  Created by denys pashkov on 20/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit
import Foundation

class collectionView : UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayCounter : Int = 0
    var implemented : Int = 0
    var cellNumber : Int = 0
    var memeDetail : [meme] = []
    let temp : meme = meme(imageName: "placeholder.jpeg", textMeme: "placeholder.jpeg", memeName: "placeholder.jpeg", objectName: "placeholder.jpeg")
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        memeDetail = UserDefaults.standard.array(forKey: "savedMemes") as? [meme] ?? [meme]()
//        memeFoundUpdate()
        
        while memeDetail.count > implemented {
            
            implemented = implemented + 1

        }
        
    }
    
    //temp
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setCells()
        
    }
    
//    MARK: - setting cells
    
    func setCells(){
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 100)/2, height: (self.collectionView.frame.size.height - 100)/2)

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.tag = cellNumber
        cellNumber = cellNumber + 1
        
        if memeDetail.count > cellNumber {
            cell.memeAllocated = memeDetail[cellNumber]
            return cellWithFoundMeme(cell: cell)
        }
        else {
            return cellWithoutFoundMeme(cell : cell)
            
        }

    }
    
//    if the the cell have alredy a meme
    func cellWithFoundMeme( cell : CollectionViewCell) -> CollectionViewCell{
        
        cell.memeImageView.image = UIImage(named: cell.memeAllocated.imageName)
        
        return cell
        
    }
    
//    if the cell don't have yet a meme
    func cellWithoutFoundMeme(cell : CollectionViewCell) -> CollectionViewCell{
        
        cell.memeAllocated.imageName = "placeholder.jpeg"
        cell.memeImageView.image = UIImage(named: cell.memeAllocated.imageName )!
        
        return cell
        
    }
    
//    MARK: - Take Dates From Meme Found (to change)
    
//    func memeFoundUpdate(){
//
//        if  let archiveURL = Bundle.main.url(forResource: "MemeFound", withExtension: "plist"),
//        let retrivedNotesData = try? Data(contentsOf: archiveURL),
//        let decodedNotes = try? PropertyListDecoder().decode([meme].self, from: retrivedNotesData) {
//
//            memeDetail = decodedNotes
//
//        }
//    }
    
//    MARK: - Update meme when found
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
        
    }
    
//    MARK: - Call the performSegue here
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = collectionView//.cellForItem(at: indexPath)
            
            performSegue(withIdentifier: "toInformation", sender: cell)
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toInformation"{
            
            let nextScreen = segue.destination as! PopUpViewController
            
            if memeDetail.count > (sender as AnyObject).tag {
                
                nextScreen.popUpMeme = memeDetail[(sender as AnyObject).tag]
                
            }
            else {
                
                nextScreen.popUpMeme = meme(imageName: "placeholder.jpeg", textMeme: "placeholder.jpeg", memeName: "placeholder.jpeg", objectName: "placeholder.jpeg")
                
            }
            
        }
        

    }
    
    
//    MARK: - Experiments
    
//    i was just trying some function here
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }*/
    
}
