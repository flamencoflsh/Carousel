//
//  CreateViewController.swift
//  Carousel
//
//  Created by Jessie on 9/26/15.
//  Copyright © 2015 Jessie. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    

    @IBOutlet weak var checkboxSelectedView: UIImageView!
    @IBOutlet weak var checkboxView: UIImageView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var buttonView: UIView!
    var initialY: CGFloat!
    var initialY2: CGFloat!
    let offset: CGFloat = -115
    let offset2: CGFloat = -225
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 568)
        checkboxSelectedView.hidden = true
        initialY = dataView.frame.origin.y
        initialY2 = buttonView.frame.origin.y
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
    
    @IBAction func didClickBack(sender: AnyObject) {
        
        navigationController!.popViewControllerAnimated(true)

    }
       //@IBAction func didClickBack(sender: AnyObject) {
        
        //navigationController!.popViewControllerAnimated(true)
   // }

    @IBAction func didClickCheckbox(sender: AnyObject) {
        
        if checkboxSelectedView.hidden == true{
            checkboxSelectedView.hidden = false
        }else{
            checkboxSelectedView.hidden = true
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
            
            self.dataView.frame.origin = CGPoint(x: self.dataView.frame.origin.x, y: self.initialY)
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
            
            self.dataView.frame.origin = CGPoint(x: self.dataView.frame.origin.x, y: self.initialY + self.offset)
            self.buttonView.frame.origin = CGPoint(x: self.buttonView.frame.origin.x, y: self.initialY2 + self.offset2)
            
            }, completion: nil)
    }

    @IBAction func onTap(sender: AnyObject) {
        
        dataView.endEditing(true)
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
