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
//    @IBOutlet weak var memes: UILabel!
    
    var arrayDimension : Int = 0
    var memeFound : Int = 0
    var implemented : Int = 0
    var buttonClicked : Int = 0
    var cellArray : [UICollectionViewCell] = [UICollectionViewCell()]
    var memeDetail : [meme] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        while memeFound > implemented {
            
            changeMemeCell()
            implemented = implemented + 1

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    MARK: - Data from ViewController are used here

    func changeMemeCell(){
        
        // try with element 0 to set
        let memeImage = cellArray[implemented].viewWithTag(3) as! UIImageView
        memeImage.image = UIImage(named: memeDetail[implemented].imageName)
        
        let memeDescription = cellArray[implemented].viewWithTag(2) as! UILabel
        memeDescription.text = "\(memeDetail[implemented].textMeme)"
        
        
        
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
        
        cellArray.insert(cell, at: arrayDimension)
        let label = cellArray[arrayDimension].viewWithTag(2) as! UILabel
        label.text = "To Unlock \(arrayDimension)"
        
        let popUpButton = cellArray[arrayDimension].viewWithTag(4) as! UIButton
        
        popUpButton.tag = popUpButton.tag + arrayDimension
        
        arrayDimension = arrayDimension + 1

        return cell
        
    }
    
//    MARK: - buttons for popup
    
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
        
//        @IBAction func showPopUp(_ sender: Any) {
//
//            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpStoryboard") as! PopUpViewController
//
//            let navigationController = UINavigationController(rootViewController: popOverVC)
//
//            navigationController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//
//            self.present(navigationController, animated: false, completion: nil)
//
////            self.addChild(popOverVC)
////            popOverVC.view.frame = self.view.frame
////            self.view.addSubview(popOverVC.view)
////            popOverVC.didMove(toParent: self)
//
//        }
    
    
    
}
