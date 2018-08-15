
//
//  LoginViewController.swift
//  LoginTest
//
//  Created by CAUAD05 on 2018. 7. 31..
//  Copyright © 2018년 ahnYeLim. All rights reserved.
//

import UIKit

//protocol은 약속을 만드는 것. 그 대상은 없고 약속 자체만 만듣는 것. protocol의 시작은 대문자.(class도 마찬가지)  setresultstr이라는 함수 구현하기가 약속. 약속만 하나 있는거고 이걸 지켜야할 대상은 아직 업는 상태
protocol LoginDelegateProtocol {
    func setResultStr(newid:String, newpw:String)
}

class LoginViewController: UIViewController {
    
    var delegate:LoginDelegateProtocol? //이 protocol의 약속을 지키는 아무나나   //Delegate( 첫번쨰 화면) 의 타입은 뷰 컨. delegate 선언 힐테니까 니 주소값 전달해줘. 그 타입이 뷰컨이어서 모든 다른 화면(second vc 이나 서드뷰컨) 에게는 값을 전달 할 수 없음. 문제:첫번쨰 화면이 뷰컨으로 밖에 안됨.
   // var delegate:AnyObject? //어느 타입이든 가능함. 광범위한 타입 문제:아무나가 그안에 변수인 id나 pw를 만들어 놓지 않은 상태임. 그러면 이 프로그램에서 코드는 죽어버림.

    @IBOutlet weak var IdTestField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func clickedOkButton(_ sender: Any) {
        let idStr = IdTestField.text
        let pwStr = passwordTextField.text
        
        //delegate?.id = idStr
        //delegate?.pw = pwStr
        
        if let newid = idStr, let newpw = pwStr {
        delegate?.setResultStr(newid: newid, newpw: newpw)
        }
        //vc 에 setresult 없으면 또 못씀. delefate를 anyobjrct라 했을 때 셋함수 없음ㄴ 문제 생김.
        
        
        //창이 닫히는 게 애미네미션 . 위에서 부터 창이 내려옴. 아직 안닫혔는데 다음 코드의 일을 함.애니메이션이 닫히는 
        self.dismiss(animated: true, completion: nil)  //창 닫는 코드
        //메모리 상에 만들어진 객체의 주소값이 self.     폴더가 다르면 같은 이름의 변수 생성해도 됨. 밖의 폴더와 다른 안의 폴더에서 밖의 폴더에 어떤 이름의 변수가 있더라고 안의 폴더에서 그와똑같은 이름 가진 변수 만들 수 있음. 그래서 self로 같은 이름의 변수들을 구분하는 것. 큰 주머니안에 작은 주머니가 만들어지면
        //같은 이름이 없으면 self생략해도 됨. self는 이름의 중복 이외도 쓰는 이유가 몇개 더 있음.
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

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

