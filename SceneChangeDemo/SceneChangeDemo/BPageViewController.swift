//
//  BPageViewController.swift
//  SceneChangeDemo
//
//  Created by 모모 on 2023/02/26.
//

import UIKit

class BPageViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func bNextBtn(_ sender: UIButton) {
        guard let bNextVC = self.storyboard?.instantiateViewController(withIdentifier: "BNextViewController") else {
            return
        }
        // storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
        
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        // 화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
        self.present(bNextVC, animated: true)
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
