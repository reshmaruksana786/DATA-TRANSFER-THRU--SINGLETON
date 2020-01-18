//
//  SecondViewController.swift
//  DATA TRANSFER THRU -SINGLETON
//
//  Created by Syed.Reshma Ruksana on 21/11/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var qualificationTF: UITextField!
    
    @IBOutlet weak var yearOfPassingTF: UITextField!
    
    
    @IBOutlet weak var totalMarksTF: UITextField!
    
    
    @IBOutlet weak var percentageTF: UITextField!
    
    
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qualificationTF.delegate=self
        yearOfPassingTF.delegate=self
        totalMarksTF.delegate=self
        percentageTF.delegate=self
        
        
        qualificationTF.keyboardType = UIKeyboardType.alphabet
        yearOfPassingTF.keyboardType = UIKeyboardType.numberPad
        totalMarksTF.keyboardType = UIKeyboardType.numberPad
        percentageTF.keyboardType = UIKeyboardType.numberPad


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onBackBtnTap(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubmitBtnTap(_ sender: UIButton) {

        if((qualificationTF.text?.isEmpty)! || (yearOfPassingTF.text?.isEmpty)! || (totalMarksTF.text?.isEmpty)! || (percentageTF.text?.isEmpty)!)
        {
            getAlert(titleName: "Warning", messageDetails: "Enter All Details")
        }
//        else
//        {
            DataTransfer.shared.qualification = qualificationTF.text!
            DataTransfer.shared.yearOfPassing = yearOfPassingTF.text!
            DataTransfer.shared.totalMarks = Int(totalMarksTF.text!)
            DataTransfer.shared.percentage = Float(percentageTF.text!)
            
            let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdVC")
            
            present(thirdVC!, animated: true, completion: nil)
//        }
     
    }
    
    // function for alert
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // function for name Validations
    
    func isValidName(nameStr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{1,20}"
        
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: nameStr)
    }
    
    // function for Number Validations
    func isValidNumbers(numbers:String) -> Bool {
        let ageRegEx = "[0-9.]{2,5}"
        
        let agePred = NSPredicate(format:"SELF MATCHES %@", ageRegEx)
        return agePred.evaluate(with: numbers)
    }
    
    
     var returnValue = true

    
    //SHOULD END EDITING
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == qualificationTF){
            if(isValidName(nameStr: textField.text!)){
            }else
            {
                getAlert(titleName: "OK", messageDetails: " Enter Alphabets Only")
            }
            
        }
        if(textField == yearOfPassingTF){
            if(isValidNumbers(numbers: textField.text!)){
            }else
            {
                getAlert(titleName: "OK", messageDetails: " Enter Valid Passed Out Year")
            }
        }
        
        if(textField == totalMarksTF){
            if(isValidNumbers(numbers: textField.text!)){
            }else
            {
                getAlert(titleName: "OK", messageDetails: " Enter Valid Marks")
            }
        }
        if(textField == percentageTF){
            if(isValidNumbers(numbers: textField.text!)){
            }else
            {
                getAlert(titleName: "OK", messageDetails: " Enter Valid percentage")
            }
        }
        return returnValue
    }

    //SHOULD BEGIN EDITING
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == qualificationTF){
            returnValue = true
        }
        if(textField == yearOfPassingTF){
            if(qualificationTF.text!.count >= 2){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if( textField == totalMarksTF){
            if(yearOfPassingTF.text!.count >= 2){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        if( textField == percentageTF){
            if(totalMarksTF.text!.count <= 5000){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        
        return returnValue
        
    }

}
