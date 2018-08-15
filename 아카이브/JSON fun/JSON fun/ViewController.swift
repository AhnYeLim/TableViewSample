//
//  ViewController.swift
//  JSON fun
//
//  Created by CAUAD05 on 2018. 8. 2..
//  Copyright © 2018년 ahnYeLim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //create acurrency?, get data from a web
        //get an HTTP address from a web site
        
        let url = URL(string: "http://api.fixer.io/latest")
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            
            if error != nil {
                print("error")
            }
            else {
                if let content = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        
                        if let rates = myJson["rates"] as? NSDictionary
                        {
                            if let currency = rates["GBP"] {
                                print (currency)
                            }
                        }
                    }
                    catch {
                        
                    }
                }
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

