//
//  Book.swift
//  ViewTest
//
//  Created by CAUAD05 on 2018. 7. 27..
//  Copyright © 2018년 CAUAD05. All rights reserved.
//

import Foundation
import UIKit   //UIKit import해줘야 UIImage 쓸 수 있음.

class Book {
    var title:String
    var writer:String
    var coverImage:UIImage?
    
    init(title:String, writer:String, coverImage:UIImage?) {
        self.title = title
        self.writer = writer
        self.coverImage = coverImage
    }
}
