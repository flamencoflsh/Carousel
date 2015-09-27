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
    @IBOutlet weak var image2View: UIImageView!
    @IBOutlet weak var image3View: UIImageView!
    @IBOutlet weak var image4View: UIImageView!
    @IBOutlet weak var image5View: UIImageView!
    @IBOutlet weak var image6View: UIImageView!

    struct Photo{
        var startOrigin: CGPoint
        var endOrigin: CGPoint
        var startScale: CGFloat
        var endScale: CGFloat
        var startRotation: CGFloat
        var endRotation: CGFloat
    }
    
    
    var photo1 = Photo(startOrigin: CGPoint(x: -28, y: 465), endOrigin: CGPoint(x: 45, y: 745), startScale: 1, endScale: 1, startRotation: radian(-9), endRotation: 0)
    var photo2 = Photo(startOrigin: CGPoint(x: 235, y: 480), endOrigin: CGPoint(x: 199, y: 745), startScale: 1.69, endScale:1, startRotation: radian(-9), endRotation: 0)
    var photo3 = Photo(startOrigin: CGPoint(x: 209, y: 384), endOrigin: CGPoint(x: 199, y: 822), startScale: 1.69, endScale:1, startRotation: radian(9), endRotation: 0)
    var photo4 = Photo(startOrigin: CGPoint(x: 100, y: 392), endOrigin: CGPoint(x: 199, y: 899), startScale: 1.69, endScale: 1, startRotation: radian(-10), endRotation: 0)
    var photo5 = Photo(startOrigin: CGPoint(x: 6, y: 376), endOrigin: CGPoint(x: 119, y: 899), startScale: 1.69, endScale: 1, startRotation: radian(9), endRotation: 0)
    var photo6 = Photo(startOrigin: CGPoint(x: 131, y: 484), endOrigin: CGPoint(x: 45, y: 898), startScale: 1.69, endScale: 1, startRotation: radian(11), endRotation: 0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width:320, height:1136)
        
//        image1View.frame.origin = photo1.endOrigin
//        image2View.frame.origin = photo2.endOrigin
//        image3View.frame.origin = photo3.endOrigin
//        image4View.frame.origin = photo4.endOrigin
//        image5View.frame.origin = photo5.endOrigin
//        image6View.frame.origin = photo6.endOrigin
        
        //STEP 1
        let scaleTransform = CGAffineTransformMakeScale(1.69, 1.69)
        image1View.frame.origin = photo1.startOrigin
        image1View.transform = CGAffineTransformMakeRotation(photo1.startRotation)
        
        image2View.frame.origin = photo2.startOrigin
        image2View.transform = CGAffineTransformConcat(scaleTransform, CGAffineTransformMakeRotation(photo2.startRotation))
        
        image3View.frame.origin = photo3.startOrigin
        image3View.transform = CGAffineTransformConcat(scaleTransform, CGAffineTransformMakeRotation(photo3.startRotation))
        
        image4View.frame.origin = photo4.startOrigin
        image4View.transform = CGAffineTransformConcat(scaleTransform, CGAffineTransformMakeRotation(photo4.startRotation))
        
        image5View.frame.origin = photo5.startOrigin
        image5View.transform = CGAffineTransformConcat(scaleTransform, CGAffineTransformMakeRotation(photo5.startRotation))
        
        image6View.frame.origin = photo6.startOrigin
        image6View.transform = CGAffineTransformConcat(scaleTransform, CGAffineTransformMakeRotation(photo6.startRotation))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // Get the offset as scrollview scrolls in the y direction
        let currentOffset = scrollView.contentOffset.y + CGFloat(20)
        
        // Calculate the final offset when fully scrolled
        let finalOffset = scrollView.contentSize.height - scrollView.frame.height + CGFloat(20)
        
        print("A: Current Offset \(currentOffset) Final Offset \(finalOffset)")
        
        // Set the distance you want the item to move
        //let translation = CGFloat(200)
        
        // Calculate how far you have scrolled as a percent of the total scroll
        let percentScroll = currentOffset / finalOffset
        
        // Move the object based on the percentage you have scrolled
        // Note: Add the difference to the object's initial position (set up top as an instance variable
        // or the object will go zooming off the screen! :D
        //image1View.center.x = image1ViewCenter.x + percentScroll*translation
       
        print("PERCENTSCROLL: \(percentScroll)")
        
        //STEP 2
        let TX1 = (photo1.endOrigin.x - photo1.startOrigin.x) * percentScroll
        let TX2 = (photo2.endOrigin.x - photo2.startOrigin.x) * percentScroll
        let TX3 = (photo3.endOrigin.x - photo3.startOrigin.x) * percentScroll
        let TX4 = (photo4.endOrigin.x - photo4.startOrigin.x) * percentScroll
        let TX5 = (photo5.endOrigin.x - photo5.startOrigin.x) * percentScroll
        let TX6 = (photo6.endOrigin.x - photo6.startOrigin.x) * percentScroll
        
        
        print("TX1: \(TX1)")
        
        //STEP 3
        let TY1 = (photo1.endOrigin.y - photo1.startOrigin.y) * percentScroll
        let TY2 = (photo2.endOrigin.y - photo2.startOrigin.y) * percentScroll
        let TY3 = (photo3.endOrigin.y - photo3.startOrigin.y) * percentScroll
        let TY4 = (photo4.endOrigin.y - photo4.startOrigin.y) * percentScroll
        let TY5 = (photo5.endOrigin.y - photo5.startOrigin.y) * percentScroll
        let TY6 = (photo6.endOrigin.y - photo6.startOrigin.y) * percentScroll
        
        //image2View.transform = CGAffineTransformMakeTranslation(TX2, TY2)
        //image3View.transform = CGAffineTransformMakeTranslation(TX3, TX3)
        
        print("TY1: \(TY1)")
        
        //STEP 4
        let R1 = (photo1.endRotation - photo1.startRotation) * percentScroll
        let R2 = (photo2.endRotation - photo2.startRotation) * percentScroll
        let R3 = (photo3.endRotation - photo3.startRotation) * percentScroll
        let R4 = (photo4.endRotation - photo4.startRotation) * percentScroll
        let R5 = (photo5.endRotation - photo5.startRotation) * percentScroll
        let R6 = (photo6.endRotation - photo6.startRotation) * percentScroll
        
        print("R1: \(R1)")
        
        //image2View.transform = CGAffineTransformMakeRotation(photo2.startRotation + R2)
        
        //STEP 5
        let rotationTransform1 = CGAffineTransformMakeRotation(photo1.startRotation + R1)
        let rotationTransform2 = CGAffineTransformMakeRotation(photo2.startRotation + R2)
        let rotationTransform3 = CGAffineTransformMakeRotation(photo3.startRotation + R3)
        let rotationTransform4 = CGAffineTransformMakeRotation(photo4.startRotation + R4)
        let rotationTransform5 = CGAffineTransformMakeRotation(photo5.startRotation + R5)
        let rotationTransform6 = CGAffineTransformMakeRotation(photo6.startRotation + R6)

        //STEP 6
        let S1 = (photo1.endScale - photo1.startScale) * percentScroll
        //let S2 = (photo2.endScale - photo2.startScale) * percentScroll
        let S2 = 0.69 * percentScroll
        
        print("S1: \(S1)")
        print("S2: \(S2)")
       
        //STEP 7
        let scaleTransform1 = CGAffineTransformMakeScale(photo1.startScale + S1, photo1.startScale + S1)
        let scaleTransform2 = CGAffineTransformMakeScale(1.69-S2, 1.69-S2)
        let scaleTransform3 = CGAffineTransformMakeScale(1.69-S2, 1.69-S2)
        let scaleTransform4 = CGAffineTransformMakeScale(1.69-S2, 1.69-S2)
        let scaleTransform5 = CGAffineTransformMakeScale(1.69-S2, 1.69-S2)
        let scaleTransform6 = CGAffineTransformMakeScale(1.69-S2, 1.69-S2)
        
        //image3View.transform = scaleTransform3
        
        //STEP 8
        let transform1 = CGAffineTransformConcat(rotationTransform1, scaleTransform1)
        let transform2 = CGAffineTransformConcat(rotationTransform2, scaleTransform2)
        let transform3 = CGAffineTransformConcat(rotationTransform3, scaleTransform3)
        let transform4 = CGAffineTransformConcat(rotationTransform4, scaleTransform4)
        let transform5 = CGAffineTransformConcat(rotationTransform5, scaleTransform5)
        let transform6 = CGAffineTransformConcat(rotationTransform6, scaleTransform6)
    
        //STEP 9
        let translationTransform1 = CGAffineTransformTranslate(transform1, TX1, TY1)
        let translationTransform2 = CGAffineTransformTranslate(transform2, TX2, TY2)
        let translationTransform3 = CGAffineTransformTranslate(transform3, TX3, TY3)
        let translationTransform4 = CGAffineTransformTranslate(transform4, TX4, TY4)
        let translationTransform5 = CGAffineTransformTranslate(transform5, TX5, TY5)
        let translationTransform6 = CGAffineTransformTranslate(transform6, TX6, TY6)
        
        //STEP 10
        image1View.transform = translationTransform1
        image2View.transform = translationTransform2
        image3View.transform = translationTransform3
        image4View.transform = translationTransform4
        image5View.transform = translationTransform5
        image6View.transform = translationTransform6
        
    }
}


