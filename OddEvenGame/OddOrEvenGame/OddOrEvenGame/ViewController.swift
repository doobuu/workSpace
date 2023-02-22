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

/*
 구현할 프로세스 추가 정리
 1 음악 파일을 추가한다
 2 AVFoundation 프레임워크를 추가한다
 3 AVAudioPlayer 객체를 만들어 음악을 실행한다
 */

import UIKit
import AVFoundation
// 사용하고자 하는 프레임 워크를 선언하면 사용 가능하다

class ViewController: UIViewController {

    @IBOutlet weak var computerBallCountLbl: UILabel!
    @IBOutlet weak var userBallCountLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var imageContainer: UIView!
    // 게임시작 버튼을 누르기 전에는 화면이 보이지 않아야 하기 때문에
    @IBOutlet weak var fistImage: UIImageView!
    
    var player: AVAudioPlayer?
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
        self.imageContainer.isHidden = true
        // viewDidLoad 화면에서는 imageContainer view 가 보이지 않아야 하기 때문에
        
        self.play(fileName: "intro")
        // 해당 코드를 실행하기 전 파일을 호출해 해당 경로를 잘 가지고 오는지 로그로 확인할 수 있다 테스트
        
    }
    
    func play(fileName: String) {
        let filePath = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        // print("filePath \(filePath)") -> String interpolation produces a debug description for an optional value; did you mean to make this explicit? 해당 오류에 대해 찾아보기
        // 옵션 버튼을 누른 후 상수를 누르면 선언된 상수에 대한 속성을 볼 수 있다 현재는 ' let filePath: URL? '
        // filePath의 경로를 가지고 오는지 확인하기 위해 로그로 표시해 본다 -> print("filePath \(filePath)")
        
        guard let path = filePath else {
            return
        }
        // 컴파일 에러를 처리하기 위해서 guard문을 사용해 수정한다 -> 해당 컴파일 오류는 ' Value of optional type 'URL?' must be unwrapped to a value of type 'URL' '
        
        // self.player = try? AVAudioPlayer(contentsOf: path)
        // try -> 해당 수식 오류가 발생 유무가 알 수 없을 때 실행하기 위함, 옵셔널을 추가함으로 에러 발생시 미리 반환되기 때문에 간단하게 에러를 처리할 수 있다
        // filePath가 nil일 경우에는 return을 시키고, 값이 있을 경우에는 AVAudioPlayer 객체에서 경로를 갖고 오도록 한다
        // 예외 에러 처리에 관련해서 try를 옵셔널로 사용하는 방법도 있고, 옵셔널로 사용하지 않고 docatch 로 사용할 수도 있다
        
        do {
            self.player = try AVAudioPlayer(contentsOf: path)
            
            guard let soundPlayer = self.player else {
                return
                // ' var player: AVAudioPlayer? ' -> player를 옵셔널로 선언했기 때문에 옵셔널 자체가 값의 유무를 모르기 때문에 guard문을 사용하여 오류를 예방해 오류가 발생하면 return 시킨다
            }
            
            soundPlayer.prepareToPlay()
            soundPlayer.play()
            // prepareToPlay() 메서드는 버퍼를 미리 로드하여 재생할 오디오 플레이어를 미리 준비한다 그래서 이 함수를 호출하면 버퍼를 미리 로드하고 재생에 필요한 오디오 하드웨어를 가져와 플레이 메서드를 호출하는 시점과 사운드 출력을 시작하는 시점 사이에 지연을 최소화한다
            // play() 함수는 비동기적으로 사운드를 재생한다 오디오 플레이어가 준비되지 않은 상태에서 이 메서드를 호출하게 되면 암시적으로 프리페얼투메세지가 호출된다 
            
        } catch let Error {
            print("\(Error.localizedDescription)")
        }
        // docatch문의 try를 선언해서 사용할 수 있고 특정에러가 발생하면 catch를 통해서 해당 에러타입에 따라 대항하는 실행코드를 작성할 수도 있다 에러 발생시 출력문을 보여주게 한다
        //
        
    }
    
    @IBAction func gameStartPressed(_ sender: Any) {
        self.imageContainer.isHidden = false
        // viewDidLoad 화면에서는 보이지 않았던 imageContainer view가 gameBtn을 누르면 보여야 하기 때문에 거짓으로 코드 작성
        /* print("게임을 시작힙니다")
        print(self.getRandom()) */
        
        /* UIView.animate(withDuration: 3.0) {
            self.fistImage.transform =  CGAffineTransform(scaleX: 5, y: 5)
            self.fistImage.transform =  CGAffineTransform(scaleX: 1, y: 1)
            // 3.0 은 속도를 나타냄 (3초) 5,5 와 1,1 은 크기를 나타냄 커졌다 작아지는 애니메이션을 주기 위함
        }*/
        
        self.play(fileName: "gamestart")
        
        UIView.animate(withDuration: 3.0) {
            self.fistImage.transform =  CGAffineTransform(scaleX: 5, y: 5)
            self.fistImage.transform =  CGAffineTransform(scaleX: 1, y: 1)
        } completion: { Bool in
            self.imageContainer.isHidden = true
            // 해당 fist 애니메이션 작동 후 이미지가 사라져야 다른 화면이 보이기 때문에 애니메이션 작동 후 안 보이게 만들어 줌
            self.showAlert()
            // showAlert 함수를 띄우기 위해서 작성한 코드
        }
        
    }
    
    func showAlert() {
        // 깃헙을 확인해 보면 fistImage를 넣기 전에는 gameStartPressed 함수 안에 존재했던 코드들이 게임 스타트 버튼을 누르고 fist image가 먼저 나온 다음 홀짝을 정하는 버튼이 나와야 하기 때문에 showAlert 함수를 새로 만들어 그 안으로 이전의 코드들을 이동시킴
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
            
            self.play(fileName: "click")
            
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
            
            self.play(fileName: "click")
            
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
            self.resultLbl.text = result
            self.calculateBalls(winner: "user", count: count)
            
        } else {
            print("COMPUTER WIN")
            result = result + "(COMPUTER WIN)"
            self.resultLbl.text = result
            self.calculateBalls(winner: "com", count: count)
            
        }
        
    }
    
    func checkAccoutEmpty(balls : Int) -> Bool {
        return balls == 0
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
            
            if self.checkAccoutEmpty(balls: userBallsCount) {
                self.resultLbl.text = "The finally winner is a computer"
            }
            /* if self.checkAccoutEmpty(balls: self.userBallsCount) {
                self.resultLbl.text = "The finally winner is a computer"
                해당 수식 오류 -> resultLbl 이미 result 결과값을 보여주고 있기 때문에 해당 함수에서 보여질 수 없는 오류를 갖고 있음 따라서, 이 코드에서 구현 X
             } */
        } else {
            self.userBallsCount = self.userBallsCount + count
            self.comBallsCount = self.comBallsCount - count
            
            if self.checkAccoutEmpty(balls: self.comBallsCount) {
                self.resultLbl.text = "The finally winner is the user"
            }
            /* if self.checkAccoutEmpty(balls: self.userBallsCount) {
                self.resultLbl.text = "The finally winner is the user"
                해당 수식 오류 -> resultLbl 이미 result 결과값을 보여주고 있기 때문에 해당 함수에서 보여질 수 없는 오류를 갖고 있음 따라서, 이 코드에서 구현 X
                기존 self.resultLbl.text = result 수식이 getWinner 함수 밖에 존재했는데 그렇게 되면 효율성 있는 로직 구현 불가능으로 getWinner 수식 안에 있는 각각의 if 함수 안에 존재하게 변형한다
            }
             */
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


