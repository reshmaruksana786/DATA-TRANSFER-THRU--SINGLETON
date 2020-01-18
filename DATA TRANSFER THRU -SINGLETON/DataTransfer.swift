//
//  DataTransfer.swift
//  DATA TRANSFER THRU -SINGLETON
//
//  Created by Syed.Reshma Ruksana on 21/11/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class DataTransfer: NSObject {
    
    
    static var shared:DataTransfer=DataTransfer()
    
    var firstName:String!
    var lastName:String!
    var age:Int!
    var mobileNo:Int!
    var emailID:String!
    var qualification:String!
    var yearOfPassing:String!
    var totalMarks:Int!
    var percentage:Float!

    
  private  override init(){
        super.init()

    }
    

}
