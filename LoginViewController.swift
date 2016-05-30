//
//  LoginViewController.swift
//  myCarousel
//
//  Created by Kelly Bryant on 5/24/16.
//  Copyright © 2016 Kelly Bryant. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var fieldParentView: UIView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginNavBar: UIImageView!
    
    let emailController = UIAlertController(title: "Email required", message: "Please enter your email", preferredStyle: .Alert)
    let emailokAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        // handle response here.
    }

    
    
    
    
    let alertController = UIAlertController(title: "Oopsies", message: "Check your email or password", preferredStyle: .Alert)
    // create a cancel action
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        // handle response here.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self

        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)

        //initialY = fieldParentView.frame.origin.y
        //offset = -100
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120

        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView){
        //This method is called as the uer scrolls
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    func scrollViewDidBeginDragging(scrollView: UIScrollView){
    
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool){
        //called after user lifts finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //called when scrollview family stops scrolling
    }
    
    func keyboardWillShow(notification: NSNotification!){
       // fieldParentView.frame.origin.y = initialY + offset
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!){
        //fieldParentView.frame.origin.y = initialY
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }

    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    @IBAction func didPressLogin(sender: AnyObject) {
        
        if emailField.text!.isEmpty && passwordField.text!.isEmpty{
            //self.emailController.addAction(self.OKAction)
            self.emailController.addAction(self.emailokAction)
            self.presentViewController(self.emailController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        } else {
 
        loginIndicator.startAnimating()
        // Set the Button state to "Selected"
        loginButton.selected = true
        // If both the email and password fields match what we are looking for...
        if emailField.text == "test" && passwordField.text == "test" {
            // Delay for 2 second.
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // perform the Segue to the next screen.
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            })
            // Otherwise, email or password are incorrect so...
        } else {
            // Delay for 2 second
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
                // add the cancel action to the alertController
                self.alertController.addAction(self.cancelAction)
                // add the OK action to the alert controller
                self.alertController.addAction(self.OKAction)
                self.presentViewController(self.alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            })
        }
    }

    }



}
