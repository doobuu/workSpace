//
//  SettingViewController.swift
//  OddOrEvenGame
//
//  Created by 모모 on 2023/03/14.
//  Copyright © 2023 study. All rights reserved.
//

import UIKit

protocol SettingDelegate {
    func getBallsCount(ballsCount: Int)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var ballsCountTextField: UITextField!
    
    var settingDelegate: SettingDelegate?
    // 프로토콜을 사용할 수 있도록 딜리게이트를 선언한다, 위임 받을 수 있도록 변수를 선언
    var defaultBallsCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func settingDoneBtn(_ sender: UIButton) {
        
        guard let ballsStr = self.ballsCountTextField.text, let balls = Int(ballsStr) else {
            self.settingDelegate?.getBallsCount(ballsCount: self.defaultBallsCount)
            self.dismiss(animated: true, completion: nil)
            return
            // 입력 값이 없을 때는 디폴트로 설정된 구슬 개수가 리턴되도록 한다
            // 그리고 화면을 닫도록 한다 -> dismiss
        }
        self.settingDelegate?.getBallsCount(ballsCount: balls)
        // 입력 받은 구슬의 개수가 있을 때는 그 개수를 받을 수 있도록 한다
        // self.settingDelegate?.getBallsCount(ballsCount: balls) ->  cannot convert value of type 'String' to expected argument type 'Int' 해당 오류가 생성되기 때문에 타입캐스팅도 진행하도록 한다 -> self.settingDelegate?.getBallsCount(ballsCount: Int(balls))
        // -2 Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
        // -2 Coalesce using '??' to provide a default when the optional value contains 'nil'
        // -2 Force-unwrap using '!' to abort execution if the optional vaule contains 'nil'
        // 타입캐스팅을 진행해도 위와 같은 -2 오류가 발생한다 해당 오류가 발생하는 이유는 타입캐스팅을 한 Int도 옵셔널 인트이기 때문이다 해당 오류를 고치기 위한 값을 가드문에 추가로 기입해 오류를 수정한다
        /* guard let balls = self.ballsCountTextField.text,  else {
        self.settingDelegate?.getBallsCount(ballsCount: self.defaultBallsCount)
        self.dismiss(animated: true, completion: nil)
        return
         위 가드문이 옵셔널 인트로 인한 오류가 발생하기 전에 진행한 코드
        */
        /*guard let ballsStr = self.ballsCountTextField.text, let balls = ballsStr else {
         self.settingDelegate?.getBallsCount(ballsCount: self.defaultBallsCount)
         self.dismiss(animated: true, completion: nil)
         return
         위와 같이 해결했는데도 오류가 발생한다 ->
         initializer for conditional binding must have Optional type, not 'String'
         이 오류의 해결법은 옵셔널 인트로 발생한 부분에 대한 추가적인 코드 기입 부분에서 타입캐스팅을 진행하면 돤다 밑의 코드 참고
         guard let ballsStr = self.ballsCountTextField.text, let balls = Int(ballsStr) else {
             self.settingDelegate?.getBallsCount(ballsCount: self.defaultBallsCount)
             self.dismiss(animated: true, completion: nil)
             return
         
         이렇게 타입캐스팅을 해서 해당 오류는 사라지고
         self.settingDelegate?.getBallsCount(ballsCount: Int(balls))
         이 부분의 타입캐스팅은 하지 않아도 된다
         옵셔널을 확인하는 용도로 사용 가능
         */
        
        // balls의 타입을 보면(option 누르고 해당 텍스트 클릭) 옵셔널 스트링 타입인 것을 알 수 있다 값이 입력되어 있지 않은 상황에서의 디폴트 값을 설정하도록 한다 TextField 밑에 var defaultBallsCount = 10 설정
        // Btn을 클릭했을 때 ballsCountTextField 안에 있는 값을 가져오도록 한다
        self.dismiss(animated: true, completion: nil)
    }
}
