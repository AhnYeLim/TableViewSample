//
//  inputViewController.swift
//  ViewTest
//
//  Created by CAUAD05 on 2018. 7. 27..
//  Copyright © 2018년 CAUAD05. All rights reserved.
//

import UIKit

class inputViewController: UIViewController {
    
    @IBAction func Test(_ sender: Any) {
         NotificationCenter.default.post(name: Notification.Name("test"),object:nil)
    }
    
    //역으로 데이터 전달 하는 법
   
    var delegate:BookDetailViewController?
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func buttonClicked(_ sender: Any) {    //show일 떈 popview 로 modal로 떴을 때는 dismiss
       //self.navigationController?.popViewController(animated: true)
        
        delegate?.myText = myTextField.text  //값 전달해주고 창닫기
        
        self.dismiss(animated: true, completion: nil)
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
