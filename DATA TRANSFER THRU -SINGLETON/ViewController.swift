//
//  ViewController.swift
//  DATA TRANSFER THRU -SINGLETON
//
//  Created by Syed.Reshma Ruksana on 21/11/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    

    @IBOutlet weak var mobileNumberTF: UITextField!
    


    @IBOutlet weak var emailIDTF: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTF.delegate=self
        lastNameTF.delegate=self
        ageTF.delegate=self
        mobileNumberTF.delegate=self
        emailIDTF.delegate=self

        
        firstNameTF.keyboardType = UIKeyboardType.alphabet
        lastNameTF.keyboardType = UIKeyboardType.alphabet
        ageTF.keyboardType = UIKeyboardType.numberPad
        mobileNumberTF.keyboardType = UIKeyboardType.phonePad
        emailIDTF.keyboardType = UIKeyboardType.emailAddress

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func onNextBtnTap(_ sender: UIButton) {
        
        
        if((firstNameTF.text?.isEmpty)! || (lastNameTF.text?.isEmpty)! || (ageTF.text?.isEmpty)! || (mobileNumberTF.text?.isEmpty)! || (emailIDTF.text?.isEmpty)!)
        {
            getAlert(titleName: "Warning", messageDetails: "Enter All Details")
        }
        DataTransfer.shared.firstName = firstNameTF.text!
        DataTransfer.shared.lastName = lastNameTF.text!
        DataTransfer.shared.age = Int(ageTF.text!)
        DataTransfer.shared.mobileNo = Int(mobileNumberTF.text!)
        DataTransfer.shared.emailID = emailIDTF.text!

        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC")
        
        present(secondVC!, animated: true, completion: nil)
        
        
        
    }
    // function for alert
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // functions for Delegates
    
    var returnValue = true
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF){
            returnValue = true
        }
        if(textField == lastNameTF){
            if(firstNameTF.text!.count >= 2){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if( textField == ageTF){
            if(lastNameTF.text!.count >= 2){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        if( textField == mobileNumberTF){
            if(ageTF.text!.count <= 100){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        if( textField == emailIDTF){
            if(mobileNumberTF.text!.count >= 9){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        return returnValue
        
    }
    // function for name Validations
    
    func isValidName(nameStr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{1,20}"
        
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: nameStr)
    }
    
    // function for age Validations
    func isValidAge(age:String) -> Bool {
        let ageRegEx = "[0-9]{2,3}"
        
        let agePred = NSPredicate(format:"SELF MATCHES %@", ageRegEx)
        return agePred.evaluate(with: age)
    }
    
    
    // function for email Validation
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    // function for number Validation
    
    func isValidNumber(numberStr:String) -> Bool {
        let numberRegEx = "[7-9][0-9]{9}"
        
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberPred.evaluate(with: numberStr)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF || textField == lastNameTF){
            if(isValidName(nameStr: textField.text!)){
            }else
            {
                getAlert(titleName: "OK", messageDetails: " Enter Alphabets Only")
            }
            
        }
        if(textField == ageTF){
            if(isValidAge(age: textField.text!)){
            }else
            {
                getAlert(titleName: "OK", messageDetails: " Enter Valid Age")
            }
        }
        
        if(textField == mobileNumberTF){
            if(isValidNumber(numberStr: textField.text!)){
            }else
            {
                getAlert(titleName: "OK", messageDetails: " Enter Valid Mobile Number")
            }
        }
        if(textField == emailIDTF){
            if(isValidEmail(emailStr: textField.text!)){
            }else
            {
                getAlert(titleName: "OK", messageDetails: " Enter Valid Email id")
            }
        }
        return returnValue
    }

}

