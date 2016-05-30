//
//  IntroViewController.swift
//  myCarousel
//
//  Created by Kelly Bryant on 5/24/16.
//  Copyright © 2016 Kelly Bryant. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var intro1: UIImageView!
    @IBOutlet weak var intro2: UIImageView!
    @IBOutlet weak var intro3: UIImageView!
    @IBOutlet weak var intro4: UIImageView!
    @IBOutlet weak var intro5: UIImageView!
    @IBOutlet weak var intro6: UIImageView!
    
    
    //var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    //var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    //var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    //var rotations : [Float] = [-10, -10, 10, 10, 10, -10]

    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view: UIView!, atIndex index : Int, offset : Float){
        
    }
    
    func updateViewTransformWithOffset(offset : Float){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = imageView.image!.size

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = CGFloat(scrollView.contentOffset.y)
        //content offset: 0 ->568
        //x offset: -30->0
        //y offset: -285->0
        
        
        let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -100, r2Max: 0)
        let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -265, r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        intro1.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        intro1.transform = CGAffineTransformScale(intro1.transform, CGFloat(scale), CGFloat(scale))
        intro1.transform = CGAffineTransformRotate(intro1.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        
        let tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 40, r2Max: 0)
        let ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        let scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        intro2.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        intro2.transform = CGAffineTransformScale(intro2.transform, CGFloat(scale2), CGFloat(scale2))
        intro2.transform = CGAffineTransformRotate(intro2.transform, CGFloat(Double(rotation2) * M_PI / 180))
        
        
        let tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: 0)
        let ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        let scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        let rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        intro3.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        intro3.transform = CGAffineTransformScale(intro3.transform, CGFloat(scale3), CGFloat(scale3))
        intro3.transform = CGAffineTransformRotate(intro3.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        
        let tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 60, r2Max: 0)
        let ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        let scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        let rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        intro4.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        intro4.transform = CGAffineTransformScale(intro4.transform, CGFloat(scale4), CGFloat(scale4))
        intro4.transform = CGAffineTransformRotate(intro4.transform, CGFloat(Double(rotation4) * M_PI / 180))

        
        let tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -140, r2Max: 0)
        let ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -480, r2Max: 0)
        let scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        intro5.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        intro5.transform = CGAffineTransformScale(intro5.transform, CGFloat(scale5), CGFloat(scale5))
        intro5.transform = CGAffineTransformRotate(intro5.transform, CGFloat(Double(rotation5) * M_PI / 180))
        
        
        let tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -85, r2Max: 0)
        let ty6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        let scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        intro6.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        intro6.transform = CGAffineTransformScale(intro6.transform, CGFloat(scale6), CGFloat(scale6))
        intro6.transform = CGAffineTransformRotate(intro6.transform, CGFloat(Double(rotation6) * M_PI / 180))

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }

}
