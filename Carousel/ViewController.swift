//
//  ViewController.swift
//  Carousel
//
//  Created by Jessie on 9/25/15.
//  Copyright © 2015 Jessie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image1View: UIImageView!
    var image1ViewCenter: CGPoint!
    //var image1ViewInitialX: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width:320, height:1136)
        image1ViewCenter = image1View.center
        //image1ViewInitialX = image1View.frame.origin.x
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // Get the offset as scrollview scrolls in the y direction
        let currentOffset = scrollView.contentOffset.y
        
        // Calculate the final offset when fully scrolled
        let finalOffset = scrollView.contentSize.height - scrollView.frame.height
        
        print("A: Current Offset \(currentOffset) Final Offset \(finalOffset)")
        
        // Set the distance you want the item to move
        let translation = CGFloat(200)
        
        // Calculate how far you have scrolled as a percent of the total scroll
        let percentScroll = currentOffset / finalOffset
        
        // Move the object based on the percentage you have scrolled
        // Note: Add the difference to the object's initial position (set up top as an instance variable
        // or the object will go zooming off the screen! :D
        image1View.center.x = image1ViewCenter.x + percentScroll*translation
       
        //var photo1 = Photo(startPosition: CGPoint(0, 3
    }
   
}

//struct Photo{
  //  startPostition: CGPoint()!
  //  endPosition: CGPoint()!
  //  startScale:
  //  endScale:
  //  startRotation:
  //  endRotation:
//}
