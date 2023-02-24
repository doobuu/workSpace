//
//  ViewController.swift
//  LifrCycle
//
//  Created by 모모 on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("뷰가 로드 되었습니다")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("뷰가 나타날 것입니다")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("뷰가 나타났습니다")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("뷰가 사라질 것입니다")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("뷰가 사라졌습니다")
    }
    
    // navigation controller -> 아이폰 설정화면에서 상세페이지로 들어가는 UI
    // root View Controller 삭제 후 navigation Controller의 속성창에서 is Initial View Controller를 체크한다
    // navigation View 클릭 후 'control'을 누르면서 마우스 오른쪽 버튼으로 viewController로 드래그 앤 드롭, Relationship Segue의 root View Controller를 선택한다
    // Main view Controller에 Btn을 추가로 만든 후, MainViewController에 UIBut를 등록한다
    // 새로운 ViewController를 새로 생성한 후, main에 존재하는 이미지 클릭 후 속성창에서 class,storyBoardID를 수정한다 
    
    @IBAction func btnPressed(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "SecondController") as SecondController
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
        // btn 추가 후 다시 Main View Controller로 되돌아 왔을 때 "뷰가 로드 되었습니다" 라는 로그가 나타나지 않는 것은 viewDidLoad는 앱이 시작될 때 로드가 한 번만 생성되기 때문이다
        
    }
}

