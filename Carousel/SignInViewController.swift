//
//  SignInViewController.swift
//  Carousel
//
//  Created by Jessie on 9/25/15.
//  Copyright © 2015 Jessie. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {
    var initialY: CGFloat!
    var initialY2: CGFloat!
    let offset: CGFloat = -75
    let offset2: CGFloat = -215

    @IBOutlet weak var thinkingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var allView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialY = loginView.frame.origin.y
        initialY2 = buttonView.frame.origin.y
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 568)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        self.topView.alpha = 0
        self.topView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(0.5, animations: {
            // This causes first view to fade in and second view to fade out
            self.topView.alpha = 1
            self.topView.transform = CGAffineTransformMakeScale(1, 1)
            
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        
        if usernameField.text == ""{
            
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address.", preferredStyle: .Alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }else if passwordField.text == ""{
            
            let alertController = UIAlertController(title: "Password Required", message: "Please enter a password for your Dropbox.", preferredStyle: .Alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }

            
        } else if self.passwordField.text == "password"{
                
                print("signing in")
                thinkingIndicator.startAnimating()
                
                let alertController = UIAlertController(title: "Signing in...", message: nil, preferredStyle: .Alert)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                    
                    delay(2, closure: { () ->
                        () in
                        alertController.dismissViewControllerAnimated(true, completion: nil)
                        self.thinkingIndicator.stopAnimating()
                        
                        self.performSegueWithIdentifier("loginSegue", sender: nil)
                        
                    })

                }
        }else {
            
            print("signing in")
            thinkingIndicator.startAnimating()
            
            let alertController = UIAlertController(title: "Signing in...", message: nil, preferredStyle: .Alert)
            
            self.presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                
                delay(2, closure: { () ->
                    () in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                    self.thinkingIndicator.stopAnimating()
                    
                    let alertController = UIAlertController(title: "Sign In Failed", message: "Incorrect email or password.", preferredStyle: .Alert)
                    
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.presentViewController(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }

                    
                })
            }

        }
    }
    
    @IBAction func didClickBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // Get the offset as scrollview scrolls in the y direction
        let currentOffset = scrollView.contentOffset.y
        
        // Calculate the final offset when fully scrolled
        let finalOffset = scrollView.contentSize.height - scrollView.frame.height
        
        print("B: Current Offset: \(currentOffset) Final Offset: \(finalOffset)")
        
        if currentOffset < -50{
            loginView.endEditing(true)
        }
        
    }

    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
           self.loginView.frame.origin = CGPoint(x: self.loginView.frame.origin.x, y: self.initialY)
           self.buttonView.frame.origin = CGPoint(x: self.buttonView.frame.origin.x, y: self.initialY2)
            
            }, completion: nil)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
           self.loginView.frame.origin = CGPoint(x: self.loginView.frame.origin.x, y: self.initialY + self.offset)
           self.buttonView.frame.origin = CGPoint(x: self.buttonView.frame.origin.x, y: self.initialY2 + self.offset2)
            
            }, completion: nil)
    }

    @IBAction func onTap(sender: AnyObject) {
        loginView.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
