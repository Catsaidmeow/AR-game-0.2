//
//  PopUpViewController.swift
//  AR try 0.1
//
//  Created by denys pashkov on 16/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var informationView: UIView!
    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var memeDescription: UILabel!
    
    var popUpMeme : meme = meme(imageName: "", textMeme: "", memeName: "", objectName: "")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        informationView.layer.cornerRadius = 20
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        setInformationView()
        
        // Do any additional setup after loading the view.
    }
    
    func setInformationView(){
        
        memeDescription.text = popUpMeme.textMeme
        memeImage.image = UIImage(named: popUpMeme.imageName)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
         if touch?.view != informationView {
            dismiss(animated: false, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
