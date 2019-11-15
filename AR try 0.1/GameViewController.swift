//
//  GameViewController.swift
//  AR try 0.1
//
//  Created by denys pashkov on 11/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit
import SpriteKit
import SceneKit
import ARKit

class GameViewController: UIViewController, ARSCNViewDelegate {
    
    //mamage the SKS file
//    let sceneManager = SceneManager()
    
    //decleration of label
    @IBOutlet weak var Try01: UILabel!
    @IBOutlet weak var Try2: UILabel!
    
    //decleration of stuff from storyboard
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    // on start
    override func viewDidLoad() {
        
        gestureRecognizer()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
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

//    when the object is found
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        if let objectAnchor = anchor as? ARObjectAnchor {
            
            nodeAdded(node, for: objectAnchor)

        }
        
        Try01.text = "Found"
        
        return node

    }
    
//    add pop-up
    func nodeAdded(_ node: SCNNode, for objectAnchor: ARObjectAnchor){
        
        //declaration part
        
        let memeIdentifier = WindowManager().ObjectToMeme(objectName: objectAnchor.referenceObject.name!)
        let spriteKitScene = SKScene(fileNamed: "Backpack.sks")
        let memeImage = spriteKitScene?.childNode(withName: "Meme") as? SKSpriteNode
        let memeText = spriteKitScene?.childNode(withName: "Description") as? SKLabelNode
        
        //change image and description
        memeImage?.texture = SKTexture(imageNamed: memeIdentifier.imageName)
        memeText?.text = String(memeIdentifier.textMeme)
        
//        create the 2d plane
        let plane = SCNPlane(width: 0.3 * 2, height: 0.15 * 1)
        plane.cornerRadius = plane.width / 8
        plane.firstMaterial?.diffuse.contents = spriteKitScene
        plane.firstMaterial?.isDoubleSided = true
        plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
        
//        put it in a 3d space
        let planeNode = SCNNode(geometry : plane)
        planeNode.position = SCNVector3(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)
    
        node.addChildNode(planeNode)
//        node.geometry?.firstMaterial?.diffuse.contents = meme // to change
        
        planeNode.runAction(SCNAction.sequence([.wait(duration: 15),.fadeOut(duration: 2),.removeFromParentNode()]))
        
    }
    
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
            
            // what to do
            node.runAction(SCNAction.sequence([.wait(duration: 1),.fadeOut(duration: 2),.removeFromParentNode()]))
            
        }
        
    }
    
    // Present an error message to the user
        func session(_ session: ARSession, didFailWithError error: Error) {}
    
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    func sessionWasInterrupted(_ session: ARSession) {}
    
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    func sessionInterruptionEnded(_ session: ARSession) {}

}
