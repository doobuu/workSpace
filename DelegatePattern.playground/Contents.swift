import UIKit

/*
 
 Delegate Pattern
 
  - 한 클래스와 다른 클래스의 상호작용을 간단하게 할 수 있다
  - 프로토콜을 이용해서 클래스 간 요구사항의 전달이 수월해 진다
  - 클래스 또는 구조체를 상속할 필요가 없기 때문에 가볍게 사용할 수 있다
 
  -> 해야하는 일의 일부분을 위임하고 대신 처리해 주는 것
 
  remind
    Me애개는 풀기 어려운 수학문제가 있다
    수학 천재인 Harry에게 숙제를 풀어달라고 한다 (위임)
    Me가 Harry에게 숙제를 풀어달라고 하면 풀어주는 약속
 
 */


protocol HomeDelegate {
    func solveMathProblems()
}

class Me: HomeDelegate {
    // 미클래스에서는 프로토콜을 채택한다
    // 채택을 하고 프로토콜을 준수하지 않으면 해당 오류가 발생한다 'Type 'Me' does not conform to protocol 'HomeDelegate'' -> 이 경우 fix를 눌러 프로토콜을 준수하도록 한다
    // func solveMathProblems() {} -> fix를 눌러 생긴 함수로 코드 정리를 위해 함수 밑에 위치시켜 정리하도록 한다
    // Me class를 만들고 도움을 요구하는 askForHelp 함수를 만든다
    var harry = MathMarster()
    // MathMaster의 인스턴스를 생성한다
    func askForHelp() {
        self.harry.delegate = self // 딜리게이트에 셀프를 넣어주는 이유는 셀프는 자신을 뜻하는데 숙제를 부탁하는 것이 미클래스다 즉 hyebin이다 라는 뜻으로 한 마디로 시키는 주체를 넣어주는 것
        self.harry.didHomework()
    }
    
    func solveMathProblems() {
        print("숙제가 완료되었습니다")
    }
}

class MathMarster {
    // 수학 천재인 MathMaster class를 만들고 숙제를 하기 위한 didHomework 함수를 만든다 후에 프로토콜을 만든다
    var delegate: HomeDelegate?
    // 위임을 받아 처리할 수 있도록 프로토콜을 프로퍼티로 선언한다
    
    func didHomework() {
        self.delegate?.solveMathProblems()
        // 숙제를 했을 때는 문제를 풀었다라고 전달하도록 한다
        
    }
}

var hyebin = Me()
hyebin.askForHelp()
