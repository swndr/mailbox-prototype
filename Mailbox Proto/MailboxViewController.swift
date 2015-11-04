//
//  MailboxViewController.swift
//  Mailbox Proto
//
//  Created by Sam Wander on 11/3/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var mailboxSegmentedControl: UISegmentedControl!
    @IBOutlet weak var messageListItemView: UIImageView!
    @IBOutlet weak var messageListBackgroundView: UIView!
    @IBOutlet weak var messageListScrollView: UIScrollView!
    var leftIcon: UIImageView = UIImageView()
    var rightIcon: UIImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageListScrollView.contentSize = CGSize(width:320,height:1438)
        mailboxSegmentedControl.selectedSegmentIndex = 1
        
        // Add initial left icon
        leftIcon.frame = CGRect(x:10,y:30,width:25,height:25)
        leftIcon.image = UIImage(named: "archive_icon")
        messageListBackgroundView.addSubview(leftIcon)
        
        // Add initial right icon
        rightIcon.frame = CGRect(x:view.frame.size.width-35,y:30,width:25,height:25)
        rightIcon.image = UIImage(named: "later_icon")
        messageListBackgroundView.addSubview(rightIcon)
        
        //messageListItemView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func didPanMessageListItem(sender: UIPanGestureRecognizer) {
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("started")
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("changed")
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("ended")
        }
        
    }

}

