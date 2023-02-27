//
//  APageViewController.swift
//  SceneChangeDemo
//
//  Created by 모모 on 2023/02/26.
//

import UIKit

class APageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func ANextBtn(_ sender: Any) {
        // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let aNextVC = self.storyboard?.instantiateViewController(withIdentifier: "ANextViewController") else {
            return
        }
        //storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
        aNextVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
        // nextVC.modalPresentationStyle = .fullScreen
        // 풀스키린으로 만드는 방법도 있다
        self.present(aNextVC, animated: true)
        //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
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
