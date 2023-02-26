//
//  ViewController.swift
//  SceneChangeDemo
//
//  Created by 모모 on 2023/02/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func nextPageBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController") as SecondViewController
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        // 꼭 () 안에 선언한 상수를 넣어야 한다
   
    }
    

}

