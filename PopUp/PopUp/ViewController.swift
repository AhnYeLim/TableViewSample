//
//  ViewController.swift
//  PopUp
//
//  Created by CAUAD05 on 2018. 8. 3..
//  Copyright © 2018년 ahnYeLim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onAlertTapped(_ sender: Any) {
        let alert = UIAlertController(title: "My title here", message: "My message here", preferredStyle: .alert)
        
        alert.addTextField { (textFiled) in
            textFiled.placeholder = "My placeholder here"
            textFiled.keyboardType = .numberPad
        }
        
        
        
        
        
        let action1 = UIAlertAction(title: "My Action 1", style: .default) { (action) in
            print("This is Action 1")
            print(alert.textFields?.first?.text)
        }
        let action2 = UIAlertAction(title: "My Action 2", style: .cancel) { (action) in
            print("This is Action 2")
        }
        let action3 = UIAlertAction(title: "My Action 3", style: .destructive) { (action) in
            print("Deleting All your Data")
        }
        alert.addAction(action3)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
        
    }

    @IBAction func onSheetTapped(_ sender: Any) {
        let sheet = UIAlertController(title: "My title here", message: "My message here", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "My Action 1", style: .default) { (action) in
            print("This is Action 1")
        }
        let action2 = UIAlertAction(title: "My Action 2", style: .cancel, handler:nil)
        let action3 = UIAlertAction(title: "Bad Stuff", style: .destructive) { (_) in
            print("you have deleted your account")
        }
        sheet.addAction(action3)
        sheet.addAction(action1)
        sheet.addAction(action2)
        present(sheet, animated: true, completion: nil)
    }
    




}
