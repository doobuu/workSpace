//
//  ViewController.swift
//  DelegatePattrenDemo2
//
//  Created by 모모 on 2023/02/26.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAge: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func InfoPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "GetUserInfoViewController") as GetUserInfoViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
        /*
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let viewController = storyboard.instantiateViewController(identifier: "GetUserInfoViewController") as GetUserInfoViewController
         
         self.navigationController?.pushViewController(viewController, animated: true)
         여기까기가 btn을 눌렀을 경우 다음 화면으로 이동할 이벤트 발생용 navigationController에게 부여한 rootViewController를 사용하여 해당 'GetUserInfoViewController'로 넘어갈 수 있다
         */
        
        /* 다른 방법
         @IBAction func NextPage(_ sender: Any) {

        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nextVC = sb.instantiateViewController(withIdentifier: "NextPageController")

        nextVC.modalPresentationStyle = .fullScreen

        present(nextVC, animated: true)

        }
        -> 함수를 설명하자면 Main 스토리 보드를 불러와서 NextPageController라는 이름을 가진 뷰를 가지고 와서 풀사이즈로 보여줘라
         */
        
        /* 다른 방법
         let stortboard = UIStoryboard.init(name: "메인 스토리 보드 Name", bundle: nil)
         let controller = stortboard.instantiateViewController(identifier: "이동할 storyboard Id") as! 이동할 ui view controller class

         // 스크린 이동
         showDetailViewController(controller, sender: nil)
         */
        
    
    
}

