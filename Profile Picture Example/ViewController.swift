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
        let imageData = NSData(contentsOfURL: myProfilePictureUrl)
        self.imageView.image = UIImage(data: imageData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

