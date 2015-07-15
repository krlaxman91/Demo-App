//
//  viewController2.swift
//  SwiftSideMenuBar
//
//  Created by Laxman on 11/06/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

import UIKit

class Login: UIViewController , UITextFieldDelegate {

    @IBOutlet var emailTextFeild: UITextField!
    
    @IBOutlet var passwordTextFeild: UITextField!
    
   
    @IBOutlet var loginButton: UIButton!
    
    
    
    @IBOutlet var facebookActionButton: UIButton!
    
    @IBOutlet var twitterActionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
        
        textfeildTransparent()
        
        emailTextFeild.delegate = self
        passwordTextFeild.delegate = self
        
        emailTextFeild.returnKeyType = UIReturnKeyType.Next
        passwordTextFeild.returnKeyType = UIReturnKeyType.Go
        
        emailTextFeild.keyboardType = UIKeyboardType.EmailAddress
        
        passwordTextFeild.secureTextEntry = true
        
        
        loginButton.layer.cornerRadius = 4.0
        socialSharingButtonRound()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textfeildTransparent()
    {
        emailTextFeild.backgroundColor = UIColor.clearColor()
        passwordTextFeild.backgroundColor = UIColor.clearColor()
        emailTextFeild.textColor = UIColor.whiteColor()
        passwordTextFeild.textColor = UIColor.whiteColor()
        emailTextFeild.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordTextFeild.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
       // emailTextFeild.layer.borderWidth = 1.0
     
     
        //adding layer to email feild
        var border = CALayer()
        var width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: emailTextFeild.frame.size.height - width, width:  emailTextFeild.frame.size.width, height: emailTextFeild.frame.size.height)
        
        border.borderWidth = width
        emailTextFeild.layer.addSublayer(border)
        emailTextFeild.layer.masksToBounds = true
    
        
        //adding layer to assword text feild
        var borderone = CALayer()
        var widthone = CGFloat(1.0)
        borderone.borderColor = UIColor.whiteColor().CGColor
        borderone.frame = CGRect(x: 0, y: passwordTextFeild.frame.size.height - widthone, width:  passwordTextFeild.frame.size.width, height: passwordTextFeild.frame.size.height)
        
        borderone.borderWidth = widthone
        
        passwordTextFeild.layer.addSublayer(borderone)
        passwordTextFeild.layer.masksToBounds = true
    }
    

    
    func socialSharingButtonRound()
    {
        facebookActionButton.layer.cornerRadius = 5.0
        twitterActionButton.layer.cornerRadius = 5.0
        
    }
    
    
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches as Set<NSObject>, withEvent: event)
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == emailTextFeild
            
        {
            
            var isValid = isValidEmail(emailTextFeild.text)
            if isValid {
                emailTextFeild.resignFirstResponder()
                passwordTextFeild.becomeFirstResponder()
            }
            else {
                let alert = UIAlertController(title: "Hi", message: "Not a valid Email id.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        else
        {
            var passwordLength = passwordTextFeild.text
            
            if passwordLength.isEmpty
            {
                let alert = UIAlertController(title: "Hi", message: "Password can't be empty.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else
            {
            passwordTextFeild.resignFirstResponder()
            }
            }
        return true
    }
    

    
    
    
    
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        println("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        println("sideMenuShouldOpenSideMenu")
        return false
    }

   
    
   //MARK: Validation
    
    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
}
