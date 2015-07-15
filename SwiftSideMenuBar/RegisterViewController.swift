//
//  RegisterViewController.swift
//  SwiftSideMenuBar
//
//  Created by Laxman on 11/06/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet var profileimageview: UIImageView!
    
    @IBOutlet var firstNameFeild: UITextField!
    
    
    @IBOutlet var lastNameFeild: UITextField!
    
    
      @IBOutlet var emailFeild: UITextField!
    
      @IBOutlet var passwordFeild: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Register"

       firstNamefeildClear()
        lastNamefeildClear()
        emailfeildClear()
        
        passwordfeildClear()
        
        createImageView()
        
        signInButton()
      //  self.view.addSubview(firstNameFeild)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func firstNamefeildClear()
  {
     firstNameFeild = UITextField(frame: CGRect(x: 20, y: 100, width: 180, height: 40));
    
    firstNameFeild.delegate = self
    
     self.view.addSubview(firstNameFeild)
    firstNameFeild.backgroundColor = UIColor.clearColor()
    firstNameFeild.textColor = UIColor.whiteColor()
  
   firstNameFeild.returnKeyType = UIReturnKeyType.Next
    
    
    var border = CALayer()
    var width = CGFloat(0.3)
    border.borderColor = UIColor.lightTextColor().CGColor
    border.frame = CGRect(x: 0, y: firstNameFeild.frame.size.height - width, width:  firstNameFeild.frame.size.width, height: firstNameFeild.frame.size.height)
    
    border.borderWidth = width
    firstNameFeild.layer.addSublayer(border)
    firstNameFeild.layer.masksToBounds = true
    
    
    
    firstNameFeild.attributedPlaceholder = NSAttributedString(string:"First Name",
        attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])

    
    
    }
    
    func lastNamefeildClear()
    {
        lastNameFeild = UITextField(frame: CGRect(x: 20, y: 150, width: 180, height: 40));
        lastNameFeild.delegate = self
        self.view.addSubview(lastNameFeild)
        lastNameFeild.backgroundColor = UIColor.clearColor()
        lastNameFeild.textColor = UIColor.whiteColor()
        
        lastNameFeild.returnKeyType = UIReturnKeyType.Next

        
        var border = CALayer()
        var width = CGFloat(0.3)
        border.borderColor = UIColor.lightTextColor().CGColor
        border.frame = CGRect(x: 0, y: lastNameFeild.frame.size.height - width, width:  lastNameFeild.frame.size.width, height: lastNameFeild.frame.size.height)
        
        border.borderWidth = width
        lastNameFeild.layer.addSublayer(border)
        lastNameFeild.layer.masksToBounds = true
        
        lastNameFeild.attributedPlaceholder = NSAttributedString(string:"Last Name",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
    }

    
    func emailfeildClear()
    {
        
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
       let screenHeight = screenSize.height

        
        emailFeild = UITextField(frame: CGRect(x: 20, y: 200, width: screenWidth - 50, height: 40));
        emailFeild.delegate = self
        self.view.addSubview(emailFeild)
        emailFeild.backgroundColor = UIColor.clearColor()
        emailFeild.textColor = UIColor.whiteColor()
        emailFeild.keyboardType = UIKeyboardType.EmailAddress
   
        emailFeild.returnKeyType = UIReturnKeyType.Next

        
        var border = CALayer()
        var width = CGFloat(0.3)
        border.borderColor = UIColor.lightTextColor().CGColor
        border.frame = CGRect(x: 0, y: emailFeild.frame.size.height - width, width:  screenWidth - 50, height: emailFeild.frame.size.height)
        
        border.borderWidth = width
        emailFeild.layer.addSublayer(border)
        emailFeild.layer.masksToBounds = true
        
        emailFeild.attributedPlaceholder = NSAttributedString(string:"Email Address",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
    }

    
    func passwordfeildClear()
    {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        passwordFeild = UITextField(frame: CGRect(x: 20, y: 250, width: screenWidth - 50, height: 40));
        passwordFeild.delegate = self
        self.view.addSubview(passwordFeild)
        passwordFeild.backgroundColor = UIColor.clearColor()
        passwordFeild.textColor = UIColor.whiteColor()
        passwordFeild.secureTextEntry = true
        
        passwordFeild.returnKeyType = UIReturnKeyType.Go
        
        var border = CALayer()
        var width = CGFloat(0.3)
        border.borderColor = UIColor.lightTextColor().CGColor
        border.frame = CGRect(x: 0, y: passwordFeild.frame.size.height - width, width:  screenWidth - 50, height: passwordFeild.frame.size.height)
        
        border.borderWidth = width
        passwordFeild.layer.addSublayer(border)
        passwordFeild.layer.masksToBounds = true
        
        passwordFeild.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
    }
    

    func signInButton()
    {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        var signiInButton : UIButton = UIButton(frame: CGRectMake(20, 320, screenWidth - 50, 40))
        signiInButton.backgroundColor = UIColor.lightGrayColor()
        signiInButton.layer.cornerRadius = 4.0
       
        signiInButton.setTitle("SignIn", forState: UIControlState.Normal)
        
        signiInButton.titleLabel?.textColor = UIColor.whiteColor()
        self.view.addSubview(signiInButton)
    
    }
    
    
    
    func createImageView()
    {
        var profileImageView : UIImageView = UIImageView(frame: CGRectMake(210, 80, 100, 100))
        profileImageView.backgroundColor = UIColor.lightGrayColor()
        
        profileImageView.layer.cornerRadius = 50.0
        
        self.view.addSubview(profileImageView)
    
    }
    

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches as Set<NSObject>, withEvent: event)
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == firstNameFeild
            
        {
            if firstNameFeild.text.isEmpty
            {
                let alert = UIAlertController(title: "Hi", message: "First Name can't be empty.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else
            {
                firstNameFeild.resignFirstResponder()
                lastNameFeild.becomeFirstResponder()
            }
            
        }
      else if textField == lastNameFeild
        {
            if lastNameFeild.text.isEmpty
            {
                let alert = UIAlertController(title: "Hi", message: "Last Name can't be empty.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else
            {
                lastNameFeild.resignFirstResponder()
                emailFeild.becomeFirstResponder()
            }
        }
        
        else if textField == emailFeild
        {
            var isValid = isValidEmail(emailFeild.text)
            if isValid {
                
                emailFeild.resignFirstResponder()
                passwordFeild.becomeFirstResponder()
            }
            else {
                let alert = UIAlertController(title: "Hi", message: "Not a valid Email id.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        else
        {
            
            if passwordFeild.text.isEmpty
            {
                let alert = UIAlertController(title: "Hi", message: "Password can't be empty.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else
            {
                passwordFeild.resignFirstResponder()
                
            }
            
            
            
        }
        return true
    }
    

    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
}
