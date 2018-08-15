//
//  RecStoredTableViewController.swift
//  AudioRecTest
//
//  Created by CAUAD04 on 2018. 8. 7..
//  Copyright © 2018년 CAUAD04. All rights reserved.
//

import UIKit
import AVFoundation


class RecStoredTableViewController: UITableViewController {
    
    var audioPlayer:AVAudioPlayer!
    
        
    @IBOutlet var myTableView: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let number:Int = UserDefaults.standard.object(forKey: "myNumber") as? Int
        {
            numberOfRecords = number
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
        print("viewWillAppear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Function that gets path to directory
    func getDirectory() -> URL    //실제 저장소의 주소값 얻어오는 함수.
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("paths는\(paths)") //paths는 URL타입의 어레이 값. [URL]
        let documentDirectory = paths[0]
        print("documentDirectory의 값은 \(documentDirectory)")  //documentDirectory: 어레이안의 url값중 하나를 가져옴. 실제값:file:///Users/cauad05/Library/Developer/CoreSimulator/Devices/8243E916-B6E8-4090-BCF5-D3A3BC2D92CC/data/Containers/Data/Application/6AF92FF2-C998-43B4-8139-4CD0318FE961/Documents/

        return documentDirectory
    }
    
    
    
    
    //Setting up table view
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numberOfRecords는 \(numberOfRecords)")
        return numberOfRecords      //셀의 개수 = 레코드 수
        
    }
    //셀 내용물 구성하는 함수.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "음성녹음" + String(indexPath.row + 1) //만들어진 녹음파일 갯수만큼 셀 수가 생성. 순차적으로 셀의 이름이 만들어짐. 1,2,3... 셀의 이름에 해당하는 녹음데이터에 접근할려면 indexPath.row+1값으로 접근해야함.
        print("indexPath.row의 값은\(indexPath.row)")
        return cell
    }
    //셀 선택했을 때 실행되는 함수
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("선택된 셀의 indexPath는 \(indexPath.row)")
        let path = getDirectory().appendingPathComponent("\(indexPath.row + 1).m4a") //path: 저장된 파일의 주소값.
        print("재생할 파일의 주소값은\(path), 재생할 파일의 파일명은\(indexPath.row + 1)")

        do          //테이블 뷰 셀에 녹음된 파일 입히고 누르면 플레이
        {
            audioPlayer = try AVAudioPlayer(contentsOf: path)    //path의 파일을 재생하라.
            audioPlayer.play()
        }catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)       //값을 전달push
//    {
//        var numOfRecords = numberOfRecords
//    }
//

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


