//
//  MainViewController.swift
//  myClass2
//
//  Created by CAUAD05 on 2018. 7. 24..
//  Copyright © 2018년 CAUAD05. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //화면이 나왔어 등장인물이 나왔다고 연출 스텝한테 알려주는 함수. 무대커튼이 열리는 개념. override:재정의 super.viewDidLoad : 상속받은 유아이뷰컨트롤러의 viewDID함수 사용하겠다.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//메모리 부족한 상황에서 호출되는 함수. 프로그램이 곧 죽게 생겼다. 경고하는 것.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
