//
//  ANextViewController.swift
//  SceneChangeDemo
//
//  Created by 모모 on 2023/02/26.
//

import UIKit

class ANextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
        // 두번째 뷰 컨트롤러에서 이전 화면으로 이동하는 경우에는 뒤로 가기를 수행gkf 버튼을 생성하고 다음과 같은 코드를 추가하면 됩니다.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
