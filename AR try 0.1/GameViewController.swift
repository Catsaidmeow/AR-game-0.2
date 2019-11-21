//
//  GameViewController.swift
//  AR try 0.1
//
//  Created by denys pashkov on 11/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit
import Foundation
import SpriteKit
import SceneKit
import ARKit

class GameViewController: UIViewController, ARSCNViewDelegate {
    
//  MARK: - WIP

    var memeUnlocked = 0
    
    //decleration of stuff from storyboard
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    var memeIdentifier : [meme] = []
    let memesDatabase : MemesClass = MemesClass()
    
//    MARK: - Init
    
    // on start
    override func viewDidLoad() {
        
        gestureRecognizer()
        
        memesDatabase.refreshArray()

        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information, pointless now
        sceneView.showsStatistics = false
        
        //Create a new scene
        let scene = SCNScene(named : "Scene01.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // object to detect
        configuration.detectionObjects = ARReferenceObject.referenceObjects(inGroupNamed: "ToFind", bundle: Bundle.main)!
        
        //Run the view's session
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

//    MARK: - When object is found
    
//    when the object is found
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        if let objectAnchor = anchor as? ARObjectAnchor {
            
            nodeAdded(node, for: objectAnchor)

        }
        
        return node

    }
    
//    add pop-up
    func nodeAdded(_ node: SCNNode, for objectAnchor: ARObjectAnchor){
        
//        //declaration part
        let spriteKitScene = SKScene(fileNamed: "Backpack.sks")
        let memeImage = spriteKitScene?.childNode(withName: "Meme") as? SKSpriteNode
        let memeText = spriteKitScene?.childNode(withName: "Description") as? SKLabelNode
        
//      passing information
        print("peppe1")
        let defaults = UserDefaults.standard
        
        print("peppe2")
        if let actual = defaults.array(forKey: "savedMemes") as? [meme] {
            print("peppe3")
            memeIdentifier = actual
            
        }
        else {
            print("peppe3bis")
            memeIdentifier = [meme]()
            
        }
        print("peppe4")
        
        memeIdentifier.insert(memesDatabase.ObjectToMeme(objectName: objectAnchor.name!), at: memeUnlocked)
        
        print("peppe5")
        
        defaults.setValue(memeIdentifier, forKey: "savedMemes")
        
//        defaults.set(memeIdentifier, forKey: "savedMemes")
        print("peppe6")
//        change image and description
        
        memeImage?.texture = SKTexture(imageNamed: memeIdentifier[memeUnlocked].imageName)
        memeText?.text = String(memeIdentifier[memeUnlocked].textMeme)
        
//      preparing for next found object
        memeUnlocked += 1
        
//      create the 2d plane
        let plane = SCNPlane(width: 0.3 * 2, height: 0.15 * 1)
        plane.cornerRadius = plane.width / 8
        plane.firstMaterial?.diffuse.contents = spriteKitScene
        plane.firstMaterial?.isDoubleSided = true
        plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
        
//      put it in a 3d space
        let planeNode = SCNNode(geometry : plane)
        planeNode.position = SCNVector3(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)
    
        node.addChildNode(planeNode)
        
        // for not saturate the memory
        planeNode.runAction(SCNAction.sequence([.wait(duration: 60),.fadeOut(duration: 1),.removeFromParentNode()]))
        
    }
    
//    MARK: - Gesture Managmemt
    
//    new gesture
    private func gestureRecognizer(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target : self, action : #selector(tapped))
        
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        
    }
 
//    when you touch the pop-up
    @objc func tapped(recognizer : UIGestureRecognizer){
        
        let sceneView = recognizer.view as! SCNView
        let touchLocation = recognizer.location(in: sceneView)
        let hitResult = sceneView.hitTest(touchLocation, options: [:])
        
        if !hitResult.isEmpty{
            
            let node = hitResult[0].node
            
//          action to do when pressed
//          TODO: - add something more fancy
            node.runAction(SCNAction.sequence([.wait(duration: 1),.fadeOut(duration: 2),.removeFromParentNode()]))
            
        }
        
    }
    
//    MARK: - Transfer Information
    
    func saveMemeFound(){
        
        let archiveURL = Bundle.main.url(forResource: "MemeFound", withExtension: "plist")!
        let encodedNotes = try? PropertyListEncoder().encode(memeIdentifier)
        try? encodedNotes?.write(to: archiveURL, options: .noFileProtection)
        
    }
    
//    MARK: - Stuffs
    
    // Present an error message to the user
    func session(_ session: ARSession, didFailWithError error: Error) {}
    
    // Inform the user that the session hs been interrupted, for example, by presenting an overlay
    func sessionWasInterrupted(_ session: ARSession) {}
    
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    func sessionInterruptionEnded(_ session: ARSession) {}

    func returnNumber() -> Int {

        return ARReferenceObject.referenceObjects(inGroupNamed: "ToFind", bundle: Bundle.main)!.count
        
    }
    
}
