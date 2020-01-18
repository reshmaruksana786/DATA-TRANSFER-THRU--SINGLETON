//
//  ThirdViewController.swift
//  DATA TRANSFER THRU -SINGLETON
//
//  Created by Syed.Reshma Ruksana on 21/11/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    
    @IBOutlet weak var lastNameLbl: UILabel!
    
    @IBOutlet weak var ageLbl: UILabel!
    
    
    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    
    @IBOutlet weak var emailIDLbl: UILabel!
    
    
    @IBOutlet weak var qualificationLbl: UILabel!
    
    
    @IBOutlet weak var yearOfPassingLbl: UILabel!
    
    @IBOutlet weak var totalMarksLbl: UILabel!
    
    @IBOutlet weak var percentageLbl: UILabel!
    
    
    
    
    

    override func viewDidLoad() {

        super.viewDidLoad()
        
        firstNameLbl.text="FIRST NAME:    \(DataTransfer.shared.firstName!)"
        lastNameLbl.text="LAST NAME:    \(DataTransfer.shared.lastName!)"
        ageLbl.text="AGE:    \(String(DataTransfer.shared.age!))"
        mobileNumberLbl.text="MOBILE NO:   \(String(DataTransfer.shared.mobileNo!))"
        emailIDLbl.text="EMAIL ID:   \(DataTransfer.shared.emailID!)"
        qualificationLbl.text="QUALIFICATION:   \(DataTransfer.shared.qualification!)"
        yearOfPassingLbl.text="YEAR OF PASSING:  \(DataTransfer.shared.yearOfPassing!)"
        totalMarksLbl.text="TOTAL MARKS:  \(String(DataTransfer.shared.totalMarks!))"
        percentageLbl.text="PERCENTAGE:   \(String(DataTransfer.shared.percentage!))"


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
