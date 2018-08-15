//
//  ViewController.swift
//  LoginTest
//
//  Created by CAUAD05 on 2018. 7. 31..
//  Copyright © 2018년 ahnYeLim. All rights reserved.
//

import UIKit
//나는 uivc상속 받고 로그인 약속을 지키겠습니다.
class ViewController: UIViewController, LoginDelegateProtocol {
    func setResultStr(newid: String, newpw: String) {
        id = newid
        pw = newpw
    }
    
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    private var id:String?  //클래스 밖에서는 이 변수에 접근 할 수 없ㅇ,ㅁ. setresultsrt 쓰게 만들고 싶어서 변수에 접ㄱ늠 못하게 해서 직접 선언 못하게 할 수 있음.
    private var pw:String?
    
   // func setResultStr(newid:String, newpw:String) {
        
    //    if (newid.count < 4) {
    //    }
    //    if (newpw.count < 4){
            
     //   }
     //   id = newid
     //   pw = newpw
   // }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        idLabel.text = id
        pwLabel.text = pw
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    //화면 전환시 정보 전달하는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //자신의 주소값을 두번째 화면에게 전딜하는 코드
        let vc = segue.destination as? LoginViewController
        vc?.delegate = self    //약속 안지켜서 자신의 주소를 할당하지 못함.
    }
    
    
}




