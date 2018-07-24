//
//  ViewController.swift
//  myClass2
//
//  Created by CAUAD05 on 2018. 7. 23..
//  Copyright © 2018년 CAUAD05. All rights reserved.
//

import UIKit
//uiviewcontroller라는 class의 속성들을 상속 받겠다.
class ViewController: UIViewController {
    //outlet은 접근,사ㅏ용자가 행동을 취해서 그 이벤트~action 
    @IBOutlet weak var myLabel: UILabel!
    @IBAction func buttonClicked(_ sender: Any) {
        myLabel.text = "Hello World!"  
    }

    //상속 받은 함수를 재지정 하겠다. override: 재정의 , 일단 super.viewdidload 함수를 쓴다음에 내가 원하는 기능 쓰겠다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
//지금 메모리가 없어서 뒤에 화면 한테 첫번째 화면을 위해 죽어라..라는 거래 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

