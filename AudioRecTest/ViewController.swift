//
//  ViewController.swift
//  AudioRecTest
//
//  Created by CAUAD04 on 2018. 8. 7..
//  Copyright © 2018년 CAUAD04. All rights reserved.
//

import UIKit
import AVFoundation


var numberOfRecords:Int = 0

class ViewController: UIViewController, AVAudioRecorderDelegate {
    
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)        //녹음 타이머를 위한 상수
    
    var recordingSession:AVAudioSession!
    var audioRecorder:AVAudioRecorder!
    var audioPlayer:AVAudioPlayer!
    
    var progressTimer: Timer!       //타이머를 위한 변수
    
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBOutlet weak var buttonLabel: UIButton!
    
    //record시 recorder가 파일 주소값을 만들고 거기에 데이터 저장.
    @IBAction func record(_ sender: Any)
    {
        //Check if we have an active recorder
        if audioRecorder == nil   //처음에 audioRecorder값 없을때, 처음 start Recording버튼 눌렀을 떄 실행됨.
        {
            
            let filename = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            print("저장소의 파일이름은 \(filename)")
            print("녹음기가 녹음파일을 저장할 주소값은\(filename)")
            print("녹음파일 저장할 저장소의 이름은\(numberOfRecords)")
            
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000,AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            //녹음 음질, 음량 같은 자잘한 설정값.
            print("settings은 \(settings)")
            //Start audio recording
            do{
                
                audioRecorder = try AVAudioRecorder(url: filename, settings: settings)
                audioRecorder.delegate = self as AVAudioRecorderDelegate  
                audioRecorder.record()  //녹음
                
                buttonLabel.setTitle("Stop Recording", for: .normal)        //버튼이름 바뀜
                progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)       //녹음시간 타이머
            }
            catch
            {
                displayAlert(title: "Ups!", message: "Recording failed")        //녹음 시 오류가 떴을 경우
            }
        } else{       //2번째에 버튼 눌렀을 때 실행. 레코더 작동중일때 누르면 실행됨.
            if audioRecorder.isRecording == true{
                do{
                    audioRecorder.pause()
                    buttonLabel.setTitle("Start Recording", for: .normal)       //버튼이름 바뀜
                }
            }
            else if audioRecorder.isRecording == false{  //3번째로 버튼 눌렀을 때 실행됨. 멈춘 상태에서 누르면 다시 녹음되는 기능.
                do{
                    audioRecorder.record()
                    buttonLabel.setTitle("Stop Recording", for: .normal)        //버튼이름 바뀜
                }
            
            }
            
        }
    }
    
    //Save 버튼 클릭- userdefault에 numberOfRecords값 저장(--> save누르면 numberOfRecords값 추가되고 그 값 저장해서 테이블 뷰에 셀수가 numberOfRecords값 만큼 표현됨.&셀의 내용물이 numberOfRecords만큼 만들어짐)
    // - 이전화면으로 이동.
    @IBAction func recordSaveButton(_ sender: Any)
    {
        numberOfRecords += 1
        print("numberOfRecordsr값은\(numberOfRecords)")      //녹음 개수 프린트
        
        //stop audio recording
        audioRecorder.stop()        //녹음 멈춤
        audioRecorder = nil         //녹음 종료
        
        progressTimer.invalidate()      //타이머 제거
        
        UserDefaults.standard.set(numberOfRecords, forKey: "myNumber") //userdefaults에 값 저장.
      
        
        
        self.navigationController?.popViewController(animated: true)        //이전 화면으로 돌아가기(top view로 돌아가기)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
              
        //settig up session
        recordingSession = AVAudioSession.sharedInstance()
        
        //userDefault로 저장했던 numberOfRecord값 불러오기.
        if let number:Int = UserDefaults.standard.object(forKey: "myNumber") as? Int
        {
            numberOfRecords = number
        }
        print("viewDidLoad됬을때 numberOfRecords의 값은\(numberOfRecords)")
        
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in            //오디오사용 off시 사용허락받기
            if hasPermission
            {
                print("Accepted")
            }
        }
    }
    
    //Function that gets path to directory
    func getDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    //Function that displays an alert
    func displayAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //
    func convertNSTimeIntervalToString(_ time:TimeInterval) -> String {
        
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
        
    }
    
    @objc func updateRecordTime() {
        currentTimeLabel.text = convertNSTimeIntervalToString(audioRecorder.currentTime)
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                                                                                                                                                                                                                                                                                                                                                                                                                                     
//    }

}
