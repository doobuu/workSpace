//
//  ViewController.swift
//  DelegatePatternDemo
//
//  Created by 모모 on 2023/02/25.
//
// Delegate Pattern 실습
// Main 화면에서 navigation Controller를 사용한다 다음 root Vire Controller를 삭제한다
// 새로 생성한 navigation Controller를 클릭 후 속성창에서 is intial View Controller로 체크한다
// 마우스 오른쪽 버튼 또는 컨트롤 버튼을 누르면서 navigation controller를 기존 view Controller로 드래그 앤 드롭한다
// Relationship Segue의 하단에 존재하는 root View Controller를 선택한다 이런 방식으로 root View Controller를 변경할 수 있다
// 그리고 새로운 View Controller를 하나 더 생성한다
// Delegate Pattern 실습을 하기 위하여 기존에 생성된 View Controller에서는 사용자에 대한 정보를 보여준다
// 사용자 정보를 입력할 수 있는 버튼을 하나 만들어 준다
// 사용자 정보에 입력 받을 기능에 있어서 두 번째 view Contoller에 위임을 할 것이다
// 두 번째 view Controller에서는 사용자 이름과 나이를 입력 받고
// '입력을 완료하였습니다'라는 버튼을 누르게 되면 해당 정보를 첫 번째 view Controller에 보내주는 것을 실습하도록 한다
// 기존의 View Controller에 두 개의 레이블, 하나의 버튼을 추가하여 각각 사용자의 이름,나이,사용자 정보 입력 버튼을 만든다
// 두 개의 Lbl과 Btn을 하나의 stackView로 생성하여 가로세로 제약조건을 준다
// Navigator에서 View Contorller를 클릭 후 command+N을 눌러 새로운 파일을 생성한다 -> cocoa touch class를 선택하고 이름을 지정한다 여기서는 InputViewController
// 새로운 InputViewController 생성 후 다시 navigator의 Main으로 돌아와 두 번째로 생성한 View Controller를 클릭 후 inspector 창에서 class와 storyboardId를 새로 생성한
// View Controller의 이름으로 지정한다 그렇게 해야 새로 생성한 View Controller에 대한 로직과 코드 블럭을 해당 View Controller에 선언할 수 있다 -> 여기서는 InputViewController
// 이제 Lbl과 Btn을 생성한 View Controller에서 각각의 Lbl을 마우스 오른쪽 버튼 또는 control버튼을 누른 후 class 밑에 드래그 앤 드롭하여 각각의 @IBOutlet 생성할 수 있다 (다른 말로 스토리보드에서 소스파일로 드래그 앤 드롭하여 @IBOutlet 생성 가능)
// '사용자 정보를 입력해 주세요' Btn은 해당 버튼을 눌러야 하는 코드가 발생하기 때문에 viewDidLoad 밑에 위치시킨 후 버튼 type을 UIButton으로 변경한 후 생성한다
// InputViewController에서 생성한 protocol을 추가하여 class에 채택한다
// class에 protocol을 채택하고 난 후 채택은 했지만 준수하지 않았다는 오류가 발생한다 -> 'Type 'ViewController' does not conform to protocol 'UserInfoDelegate''
// 위의 경우 fix를 클릭해 생성된 함수를 보기 좋게 정리해 준다 -> 지금의 경우 btnPressed 코드 블럭 밑에 위치한다

import UIKit

class ViewController: UIViewController, UserInfoDelegate {
 

    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userAgeLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }

    @IBAction func btnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "InputViewController") as InputViewController
        
        viewController.delegate = self
        // delegate를 self로 지정해 주지 않았기 때문에 getUserInfo가 호출되지 않은 것이다
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func getUserInfo(name: String, age: String) {
        print("userName\(name), userAge\(age)")
        // 출력문을 통하여 해당 정보가 잘 리턴되어 돌아오는지 확인하도록 한다
        self.userNameLbl.text = name
        self.userAgeLbl.text = age
        // 입력받은 데이터 값을 Lbl에 보일 수 있도록 설정한다 
    }
    
}

