//
//  ViewController.swift
//  Profile Picture Example
//
//  Created by Dylan Jhaveri on 9/10/14.
//  Copyright (c) 2014 Dylan Jhaveri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        let myProfilePictureUrl = NSURL(string: "http://graph.facebook.com/bobdylan/picture?type=square&width=640&height=640")
        
        let activityIndictorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        activityIndictorView.center = self.view.center
        self.view.addSubview(activityIndictorView)
        activityIndictorView.startAnimating()

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            // Do some async stuff
            let imageData = NSData(contentsOfURL: myProfilePictureUrl)
            
            NSOperationQueue.mainQueue().addOperationWithBlock {
                // Do some main thread stuff
                self.imageView.image = UIImage(data: imageData)
                activityIndictorView.stopAnimating()
                
                UIView.animateWithDuration(1.0, animations: {
                    self.imageView.alpha = 1.0
                    }, completion: {
                        (value: Bool) in
                        println("Animation complete!")
                })
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

