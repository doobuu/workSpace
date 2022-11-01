//
//  ViewController.swift
//  OddOrEvenGame
//
//  Created by 모모 on 2022/07/11.
//  Copyright © 2022 study. All rights reserved.
//

/*
 구현할 프로세스 정리
 1 'GAME START BTN' 컴퓨터가 1에서 10까지 랜덤으로 숫자를 선택한다
 2 사용자는 본인이 가진 구슬 안에서 베팅하고 홀과 짝 중 하나를 선택한다
 3 결과에 대한 값이 화면에 보여진다
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerBallCountLbl: UILabel!
    @IBOutlet weak var userBallCountLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    
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
        print(self.getRandom())
        
        let alert = UIAlertController.init(title: "GAME START", message: "홀과 짝 중 하나를 선택하세요", preferredStyle: .alert)
            // let alert 선언한 alert UIAlertController.init(preferredStyle 에서 .alert는 alert 창이 화면 가운데에서 생성이 되고 .actionSheet는 화면 하단에서 위로 스크롤 형태로 셍성된다
            // GAME START Btn을 누른 후 생성되는 알람창
        
//        let okayBtn = UIAlertAction.init(title: "확인", style: .default) { _ in
//            // 버튼을 클릭했을 때 동작하는 부분을 여기 코드 블럭 안에서 작성할 수 있다
//            print("확인 버튼을 클릭했습니다")
//            // GAME START Btn을 누른 후 생성된 알람창에서 확인을 눌러 생성된 알람창을 닫는 확인 버튼
              // 확인 버튼이 작동하는지 확인 후 주석으로 변환함
//        }
//
//        alert.addAction(okayBtn)
              // 확인 버튼 생성 기능이기 때문에 마찬가지로 홀짝 버튼 생성을 위해 주석으로 변환함
        
        let oddBtn = UIAlertAction.init(title: "홀", style: .default) { _ in
            print("홀 버튼을 클릭했습니다")
            // print(alert.textFields?.first?.text)
            
            guard let input = alert.textFields?.first?.text else {
                return
            }
            
            print("입력한 값은 \(input)입니다")
            
            guard let value = Int(input) else{
                return
            }
            
            self.getWinner(count: value, select: "홀")
            // self.getWinner(count: input, select: "홀") 원래는 이 구문으로 작성했지만 Cannot convert value of type 'String' to expected argument type 'Int' : 입력한 값을 통해서 받아온 타입은 스트링인데 count를 int 형으로 변형했기 때문에 오류 생성
            // 위 오류를 해결하기 위해서는 아까와 같이 통변환 즉, 타입캐스팅을 진행해야 함 또한, 그 값이 없을 수도 있기 때문에 guard 문으로 안전장치를 걸어둘 예정
            // 위 구문 count: input에서 input을 가드문을 통해 value로 변형시켜 count 부분에 value를 넣어준다
            /* 위 처럼 가드문을 따로 생성할 수 있지만 guard let input = alert.textFields?.first?.text else {
             return 구문에서 guard let input = alert.textFields?.first?.text, let value = int(input) else {
             return 으로도 사용이 가능하다
             둘 다 사용이 가능한 것을 확인하고 기억해두기 위해 홀 버튼에는 가드문을 따로 기입하고 짝 버튼에는 가드문을 한 번에 기입함
            */

        }
        
        let evenBtn = UIAlertAction.init(title: "짝", style: .default) { _ in
            print("짝 버튼을 클릭했습니다")
            
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                return
            }
            
            print("입력한 값은 \(input)입니다")
            
            self.getWinner(count: value, select: "짝")
        }
        
//        let evenBtn = UIAlertAction.init(title: "짝", style: .default) { _ in
//            print("짝 버튼을 클릭했습니다")
//        }
        
        alert.addTextField { textfield in
            textfield.placeholder = "베팅할 구슬의 개수를 지정하세요"
            // 사용자가 베팅할 구슬의 개수를 지정하는 textfield로 알람창에서 .addTextField(configurationHandler:)를 이용하여 textfield 생성 후 .placeholer를 지정하면 사용자가 특정값을 입력하기 전에는 placeholder 부분이 보여지게 되고 입력하게 되면 문구가 사라지게 된다 ex) "베팅할 구슬의 개수를 지정하세요"라는 문구가 입력 전에는 보여지지만 extfield 안에 개수를 입력하게 되면 해당 문구는 사라지게 된다
        }
        
        
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        self.present(alert, animated: true) {
            print("화면이 띄워졌습니다 ")
            // 여기서 self는 ViewController를 지칭함
            // GAME START Btn을 눌러 제대로 알람창이 활성화되는 것을 확인하는 부분
        }
         
    }
    
    func getWinner(count: Int, select: String) {
        // 사용자가 선택한 숫자 count, 사용자가 선택한 홀과 짝 string
        let com = self.getRandom()
        let comType = com % 2 == 0 ? "짝" : "홀"
        // % 나누기 연산자 -> 모듈러 연산자
        // 작성 구문은 삼항연산자로 조건이 맞을 때(com % 2 == 0이라는) 세미콜론 앞 구문이 실행되고 조건에 맞지 않을 때 뒷 구문이 실행된다
        // com이 선택한 값을 확인하기 위해서 Main.storyBoard 결과화면에 짝/홀 결과를 입력하도록 한다 -> resultLbl
        //self.resultLbl.text = "결과" + comType
        
        var result = comType
        if comType == select {
            // comType이 사용자가 select한 값과 같으면을 나타내는 구문
            print("USER WIN")
            result = result + "(USER WIN)"
            self.calculateBalls(winner: "user", count: count)
        } else {
            print("COMPUTER WIN")
            result = result + "(COMPUTER WIN)"
            self.calculateBalls(winner: "com", count: count)
        }
        
        self.resultLbl.text = result
    }
    func calculateBalls(winner: String, count: Int) {
        // count는 사용자가 배팅한 값
        if winner == "com" {
            // if winner == com { 경우 Cannot find 'com' in scope 오류 생성 -> com을 스트링으로 표현 ( "com" )
            /* 여기서 string으로 표현한 "com"은 getWinner 함수에 있는
             self.calculateBalls(winner:"") 부분에 지정된 string으로 적어야 결과 값이 제대로 계산됨
             */
            self.userBallsCount = self.userBallsCount - count
            // 현재 구문은 사용자 졌을 때 배팅을 한 값만큼 잃는 것을 표현하기 때문에 잃은 그 값만큼 컴퓨터가 얻는 구문 또한 필요
            self.comBallsCount = self.comBallsCount + count
        } else {
            self.userBallsCount = self.userBallsCount + count
            self.comBallsCount = self.comBallsCount - count
        }
        
        self.userBallCountLbl.text = "\(self.userBallsCount)"
        self.computerBallCountLbl.text = "\(self.comBallsCount)"
        /* self.userBallCountLbl.text = self.userBallsCount
           self.computerBallCountLbl.text = self.comBallsCount
           Cannot assign value of type 'int' to type 'Stiring?' 타입캐스팅이 필요하다는 오류 생성
           int로 생성된 값을 string으로 받아와서 생긴 오류로 밑의 예시처럼 변환 가능
           self.userBallCountLbl.text = "\(self.userBallsCount)"
           self.computerBallCountLbl.text = "\(self.comBallsCount)"
         */
          
         
         
    }
   
    func getRandom() -> Int {
        return Int(arc4random_uniform(10) + 1)
        //arc4random_uniform(10)은 0-9까지 사용하기 때문에 1-10까지 필요한 이번 상황에서는 1을 더한다
        //Cannot convert return expression of type 'UInt32' to return type 'Int' 데이터 타입이 UInt32이기 때문에 Int로 리턴을 하기 위해서는 통변환 즉 타입캐스팅을 해야 함 ex) arc4random_uniform(10)+1 -> Int(arc4random_uniform(10)+1)
        //랜덤값이 잘 적용되는지 확인하기 위해서는 게임스타트 버튼을 누른 후 뜨는 팝업창들을 일시적으로 주석을 건 다음 게임스타트 버튼에서 확인하기
    }
    

}


