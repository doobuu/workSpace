//
//  SecondViewController.swift
//  SceneChangeDemo
//
//  Created by 모모 on 2023/02/26.
//

import UIKit

class SecondViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func avcBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let aViewController = storyboard.instantiateViewController(withIdentifier: "APageViewController")
        // print("APgea")
        
        self.show(aViewController, sender: self)
    
    }
    
    @IBAction func bvcBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bViewController = storyboard.instantiateViewController(withIdentifier: "BPageViewController")
        // print("BPage")
        
        self.show(bViewController, sender: self)
    }
    
}
