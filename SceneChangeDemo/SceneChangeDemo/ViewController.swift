//
//  ViewController.swift
//  SceneChangeDemo
//
//  Created by 모모 on 2023/02/26.
//

// Scene Change 실슺
// 1 navigation contorller 이용한 화면 전환 (push)
// 2 show 메서드를 이용한 화면 전환 (메모리 관리 위험으로 거의 사용하지 않음)
// 3 present 메서드를 이용한 화면 전환 


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func nextPageBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        // 꼭 () 안에 선언한 상수를 넣어야 한다
   
    }
    

}

