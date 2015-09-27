//
//  FeedViewController.swift
//  Carousel
//
//  Created by Jessie on 9/25/15.
//  Copyright © 2015 Jessie. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var wheelView: UIImageView!
    @IBOutlet weak var wheelAfterView: UIImageView!
    var initialY: CGFloat!
    @IBOutlet weak var completeCheckView: UIImageView!
    @IBOutlet weak var bannerView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wheelView.alpha = 0
        wheelAfterView.alpha = 0
        scrollView.delegate = self
        initialY = scrollView.center.y
        completeCheckView.alpha = 0
        scrollView.contentSize = imageView.image!.size

        var defaults = NSUserDefaults.standardUserDefaults()
        var fullscreen = defaults.objectForKey("viewed_fullscreen_photo") as! String
        var played = defaults.integerForKey("played_fullscreen_complete_check") as! Int
        if fullscreen == "Y" && played != 1{
            print("fullscreen YES")
            
            UIView.animateWithDuration(1) { () -> Void in
                self.completeCheckView.alpha = 1
            }
            
            delay(1, closure: { () ->
                () in
                
                UIView.animateWithDuration(0.2) { () -> Void in
                    self.completeCheckView.alpha = 0
                }
                
            })
            
            defaults.setInteger(1, forKey: "played_fullscreen_complete_check")
            defaults.synchronize()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickFullscreen(sender: AnyObject) {
        
        defaults.setObject("Y", forKey: "viewed_fullscreen_photo")
        defaults.synchronize()
    }
    
    @IBAction func didScrollWheel(sender: AnyObject) {
        
        wheelAfterView.alpha = 1
        UIView.animateWithDuration(1) { () -> Void in
            self.completeCheckView.alpha = 1
        }

        UIView.animateWithDuration(0.2, delay: 2, options: [], animations: { () -> Void in
            self.completeCheckView.alpha = 0
            
        }) { (Bool) -> Void in
            self.bannerView.hidden = true
        }

        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let previousOffset = defaults.integerForKey("previousOffset")

        
        // Get the offset as scrollview scrolls in the y direction
        let currentOffset = scrollView.contentOffset.y
        
        // Calculate the final offset when fully scrolled
        let finalOffset = scrollView.contentSize.height - scrollView.frame.height
        
        print("B: Current Offset \(currentOffset) Final Offset: \(finalOffset)")
        
        defaults.setInteger(Int(currentOffset), forKey: "previousOffset")
        defaults.synchronize()
        
        if (previousOffset+Int(currentOffset)) > 40{
            UIView.animateWithDuration(0.2) { () -> Void in
                self.wheelView.alpha = 1
            }
        }else  {
            UIView.animateWithDuration(0.2) { () -> Void in
                self.wheelView.alpha = 0
            }
        }
        
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
