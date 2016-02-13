//
//  SettingsViewController.swift
//  HW 2
//
//  Created by Alvin Hsia on 2/10/16.
//  Copyright © 2016 Alvin Hsia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIActionSheetDelegate {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        settingsScrollView.contentSize = settingsImageView.image!.size
    }

    @IBAction func onClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func onSignOut(sender: AnyObject) {
        
        // Create logout action sheet
        let signoutAlertController = UIAlertController(title: "", message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        
        // Create logout action
        let logoutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("signoutModalSegue", sender: nil)
        }
        
        // Create cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        
        signoutAlertController.addAction(cancelAction)
        signoutAlertController.addAction(logoutAction)
        // handle case of user logging out
        
        presentViewController(signoutAlertController, animated: true, completion: nil)
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
