//
//  BookDetailViewController.swift
//  ViewTest
//
//  Created by CAUAD05 on 2018. 7. 27..
//  Copyright © 2018년 CAUAD05. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var myText:String?
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    var selectedBook:Book?
    
    override func viewWillAppear(_ animated: Bool) {
        //3번쨰 화면에서 작성한 문자열을 표시
        resultLabel.text = myText
    }
    
    @IBOutlet weak var writerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//이미 로드 된 상태이기 때문에 3번째 에서 2번째 갈때는 뷰디드로드가 실행이 안됨. 화면이 최초에 나올떄만 이 함수가 호출됨.
        // Do any additional setup after loading the view.
        
        guard let book = selectedBook else{
            return
        }

        self.navigationItem.title = book.title
        writerLabel.text = book.writer

        if let coverImage = book.coverImage {
        coverImageView.image = coverImage
        }
        
        
        //NotificationCenter.default.addObserver(self, selector:#selector(testFunc(notification:)),name:Notification)
        
        //var bookTitle = book.title
        //var bookWriter = book.writer
        
//        self.navigationItem.title = selectedBook?.title
//        writerLabel.text = selectedBook?.writer
//        if let coverImage = selectedBook?.coverImage {
//            coverImageView.image = coverImage
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
       let inputVC = segue.destination as? inputViewController//3번쨰 화면의 객체
        
        inputVC?.delegate = self //seld:자신의 주소
        
        
    }
    

}
