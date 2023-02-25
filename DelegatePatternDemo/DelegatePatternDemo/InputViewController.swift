//
//  InputViewController.swift
//  DelegatePatternDemo
//
//  Created by 모모 on 2023/02/25.
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
//
// InputViewController에서는 사용자의 이름과 나이를 입력할 textfield와 Lbl, 입력완료 btn을 생성한다
// 사용자 이름과 textfield, 사용자 나이와 textfield를 각각의 stackView로 생성
// 각각의 stackView를 같이 하나의 stackView로 재생성한다
// 입력완료 Btn의 제약조건을 하나의 stackView로 걸어주기 위해서 입력완료 Btn을 클릭 후
// 마우스 오른쪽 버튼을 누르면서 하나의 stackView로 드래그 앤 드롭하여 제약조건을 설정한다
// 여기서의 제약조건은 leading,trailing,vertical spacing으로 지정한 결과 제약조건에 대한 오류가 도출되기 때문에 하나로 된 stackView의 제약조건을 가로세로 정가운데로 추가하여 오류를 해결한다
// protocol은 class 위에 선언한다
// 만약 @IBOutlet의 네이밍을 잘못 지었을 경우 변경하기 위해서는 인터페이스(스토리보드)에서 해당 오브젝트를 선택한 후에 inspector창에서 Show The Connections Inspector 메뉴를 클릭하고 referencing outlets에 코드랑 연결되어 있는 해당 ViewContorller(여기서는 InputViewControllerf가 해당한다)를 삭제한다 삭제를 하고 난 후에는 해당 @IBOutlet의 동그라미 부분이 비어있는 동그라미로 보여지게 되는데 이때 이름을 수정하고 처음 드래그 앤 드롭을 한 것과 반대방향으로 마우스 오른쪽 버튼 또는 control키를 누른 상태에서 비어있는 동그라미 부분부터 해당 인터페이스 Lbl,textfield로 드래그 앤 드롭하면 네이밍을 수정하고 재연결할 수 있다
// userNameTf의 경우 string으로 받지만 userAgeTf의 경우 값을 Int로 받기 때문에 해당 부분에 대한 오류가 발생한다 -> 'Cannot convert value of type 'String' to expected argument type 'Int''
// 일단은 age에 대한 데이터값도 string으로 변경한다
// 해당 프로토콜을 기존의 viewController에 protocol을 채택해 줘야 한다 -> 기존의 ViewController로 이동


import UIKit

protocol UserInfoDelegate {
    func getUserInfo(name:String, age:String)
}

class InputViewController: UIViewController {
    
    var delegate: UserInfoDelegate?

    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var userAgeTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setUserInfo(_ sender: UIButton) {
        
        //let userName = self.userNameTf.text
        //let userAge = self.userAgeTf.text
        // textfield 값의 경우 값의 유무를 확정할 수 없기 때문에 이전에 배운 guard문을 통해서 오류를 반환한다
        
        guard let userName = self.userNameTf.text, let userAge = self.userAgeTf.text else {
            print("사용자 정보가 없습니다")
            return
        }

        
        self.delegate?.getUserInfo(name: userName, age: userAge)
        self.navigationController?.popViewController(animated: true)
        // 두 번째 뷰에서 첫 번째로 뷰로 이동하는 메서드를 호출하지 않아서 작동하지 않는 걸 확인할 수 있다
        // popViewController 통해서 네이게이션 뷰 이전 화면으로 이동할 수 있다 
    }
}
