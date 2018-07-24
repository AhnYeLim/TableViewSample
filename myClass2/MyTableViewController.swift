//
//  MyTableViewController.swift
//  myClass2
//
//  Created by CAUAD05 on 2018. 7. 24..
//  Copyright © 2018년 CAUAD05. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    var name:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        name.append("안예림")  //index0
        name.append("김민수")   //index 1
        name.append("홍길동")  //index 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
//table view가 자신의 컨트롤러에게... 중요한 함수들 1번.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//2번.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return name.count
        //count는 int타입의 변수
    }

    //3번.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = name[indexPath.row]
        
        
        
        //cell 안에 label이 없을 수도 있다. ?:옵셔널에 값이 있을 때만 다음 동작함.  이 변수에 값이 없으면 다음 뒤에 코드는 실행하지 마라
        var a:Int?
        //?:옵셔널 선언
        a = 10
      //var sum = a + 1    unwrapping 에라 모르겠다고 까는 것. 값이 없다고 선언했지만 값이 있는 경우에만 !사용하는데 최대한 쓰지 말아햐 함. Int라는 그릇위에 optional이라는 포장 하나 더 덧씌움. 값이 없는 거에 접근하는 순간 프로그램이 즉시 죽어버림. 이런 일을 막고자 optional 이라는 걸 만든거임.
        var sum = a! + 1
        
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
