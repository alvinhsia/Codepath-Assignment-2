//
//  LoginViewController.swift
//  HW 2
//
//  Created by Alvin Hsia on 2/9/16.
//  Copyright © 2016 Alvin Hsia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    // create error alert controller
    let emptyAlertController = UIAlertController(title: "Both Fields Required", message: "Please fill out both your email address and password.", preferredStyle: .Alert)
    
    // create error alert controller
    let errorAlertController = UIAlertController(title: "Invalid Email or Password", message: "Please try again.", preferredStyle: .Alert)

    // create a cancel action
    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        loginScrollView.delegate = self
        
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -230
        
        // add the cancel action to the AlertControllers
        errorAlertController.addAction(cancelAction)
        emptyAlertController.addAction(cancelAction)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if loginScrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }

    func keyboardWillShow(notification: NSNotification!) {
        
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        // Scroll the scrollview up
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {

        // move buttonview back down
        buttonParentView.frame.origin.y = buttonInitialY
        
        // scroll content back up a little
        loginScrollView.contentOffset.y = -15
        
        loginIndicator.stopAnimating()
        
    }
    
    @IBAction func onTapOut(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onBackTap(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func onLoginTap(sender: AnyObject) {
        
        // check if fields are empty
        if self.emailField.text!.isEmpty || self.passwordField.text!.isEmpty {
            self.presentViewController(self.emptyAlertController, animated: true, completion: nil);
        }
        
        else {
            // animate indicator on tap
            loginIndicator.startAnimating()
            
            // delay for indicator animation
            delay(2) {
                
                // modal segue to tutorial if fields are filled
                if self.emailField.text! == "ah" && self.passwordField.text! == "ah" {
                    self.performSegueWithIdentifier("loginModalSegue", sender: self)
                }
                
                // show error alert if wrong credentials
                else {
                    self.presentViewController(self.errorAlertController, animated: true, completion: nil);
                }
            }
        }
    }
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
