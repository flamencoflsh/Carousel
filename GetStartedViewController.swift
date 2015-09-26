//
//  GetStartedViewController.swift
//  Carousel
//
//  Created by Jessie on 9/26/15.
//  Copyright © 2015 Jessie. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    @IBOutlet weak var fullscreenCheckboxView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullscreenCheckboxView.alpha = 0
        var defaults = NSUserDefaults.standardUserDefaults()
        var fullscreen = defaults.objectForKey("viewed_fullscreen_photo") as! String
        if fullscreen == "Y"{
            print("fullscreen YES")
            fullscreenCheckboxView.alpha = 1
        }
        
             // Do any additional setup after loading the view.
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
