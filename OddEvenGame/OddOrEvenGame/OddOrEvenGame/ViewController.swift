//
//  ViewController.swift
//  OddOrEvenGame
//
//  Created by 모모 on 2022/07/11.
//  Copyright © 2022 study. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerBallCountLbl: UILabel!
    @IBOutlet weak var userBallCountLbl: UILabel!
    
    var comBallsCount: Int = 20
    var userBallsCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        computerBallCountLbl.text = String(comBallsCount)
        userBallCountLbl.text = String(userBallsCount)
        // computerBallCountLbl.text = 20 !{Cannot assign value of type 'Int' to type 'String'} Int로 선언한 함수를 text 즉 'String'으로 표현하여 난 오류 -> 그렇기 때문에 타입형변환(캐스팅)을 통해서 Int를 String으로 변환
        // computerBallCountLbl.text = String(comBallsCount) 로 변환
        // userBallCountLbl.text = 20
        // userBallCountLbl.text = String(userBallsCount) 로 변환
        
    }
    
    @IBAction func gameStartPressed(_ sender: Any) {
        print("게임을 시작힙니다")
    }
    

}

