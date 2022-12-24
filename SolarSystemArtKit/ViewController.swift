//
//  ViewController.swift
//  SolarSystemArtKit
//
//  Created by Yusuf Mert Yıldız on 20.12.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
    
        // Küp oluşturmak
//        let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//
//        let boxMaterials = SCNMaterial()
//
//        boxMaterials.diffuse.contents = UIImage(named: "art.scnassets/mini_knight.png")
//
//        myBox.materials = [boxMaterials]
//
//        let node = SCNNode()
//
//        node.position = SCNVector3(0,0.1, -0.5)
//        node.geometry = myBox
//        sceneView.scene.rootNode.addChildNode(node)
        
       // let mySphere = createSphere(radius: 0.1, content: "mini_knight", vector:SCNVector3(0, 0.1, -0.5))
      
        let world = createSphere(radius: 0.1, content: "world.jpeg", vector: SCNVector3(x: 0, y: 0.2, z: -1))
        let jupiter = createSphere(radius: 0.3, content: "jupiter.jpeg", vector: SCNVector3(1, 0.2, -1))
        let venus = createSphere(radius: 0.15, content: "venüs.jpeg", vector: SCNVector3(2, 0.2, -1))
        let merkur = createSphere(radius: 0.6, content: "merkür.jpeg", vector: SCNVector3(5, 0.2, -1))
        
        
        
        sceneView.scene.rootNode.addChildNode(world)
        sceneView.scene.rootNode.addChildNode(merkur)
        sceneView.scene.rootNode.addChildNode(venus)
        sceneView.scene.rootNode.addChildNode(jupiter)

    }
    
    
    func createSphere(radius : CGFloat , content:String, vector:SCNVector3) -> SCNNode {
        
        
        let mySphere = SCNSphere(radius: radius)
        let sphereMaterials = SCNMaterial()
        
        
        
        sphereMaterials.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        mySphere.materials = [sphereMaterials]
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
        sceneView.scene.rootNode.addChildNode(node)
        
        return node
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
