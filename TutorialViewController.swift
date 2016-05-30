//
//  TutorialViewController.swift
//  myCarousel
//
//  Created by Kelly Bryant on 5/26/16.
//  Copyright © 2016 Kelly Bryant. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var spinButton: UIButton!
 
    @IBOutlet weak var buttonView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        //buttonView.hidden = true
        //buttonView.alpha = 0

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        buttonView.transform = transform
        // Set the alpha properties of the views to transparent
        buttonView.alpha = 0
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
    
        if page == 3{
            pageControl.hidden = true
            //buttonView.hidden = false
            UIView.animateWithDuration(0.3) { () -> Void in
                // Return the views transform properties to their default states.
                self.buttonView.transform = CGAffineTransformIdentity
                self.buttonView.alpha = 1
            }

            
        } else {
            pageControl.hidden = false
            //buttonView.hidden = true
        }
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page

    }
    
    @IBAction func didPressButton(sender: UIButton) {
        self.performSegueWithIdentifier("timelineSegue", sender: nil)
    }


}
