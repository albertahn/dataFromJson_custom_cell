//
//  Person.swift
//  uitableview_load_data_from_json
//
//  Created by albert on 7/14/15.
//  Copyright (c) 2015 KaleidosStudio. All rights reserved.
//

import Foundation

class Person{
    
    
    var name = "name"
    var number = 0
    var commentText = "comment"
    var imageName = ""
    init(name : String, number: Int, comment_text: String, imageName: String ){
        
        self.name = name
        self.number =  number
        self.commentText = comment_text
        self.imageName = imageName
        
    }
}