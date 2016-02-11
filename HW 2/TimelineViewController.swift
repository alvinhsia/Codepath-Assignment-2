//
//  TimelineViewController.swift
//  HW 2
//
//  Created by Alvin Hsia on 2/10/16.
//  Copyright © 2016 Alvin Hsia. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var timelineScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timelineScrollView.contentSize = CGSize(width: 320, height: 1564)
        
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
