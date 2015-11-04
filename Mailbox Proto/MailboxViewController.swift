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

    let grayColor = UIColor(red: 234/255, green: 235/255, blue: 236/255, alpha: 1)
    let greenColor = UIColor(red: 103/255, green: 216/255, blue: 105/255, alpha: 1)
    let redColor = UIColor(red: 236/255, green: 85/255, blue: 35/255, alpha: 1)
    let yellowColor = UIColor(red: 255/255, green: 222/255, blue: 86/255, alpha: 1)
    let brownColor = UIColor(red: 213/255, green: 163/255, blue: 118/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageListScrollView.contentSize = CGSize(width:320,height:1438)
        mailboxSegmentedControl.selectedSegmentIndex = 1
        
        // Add initial left icon
        leftIcon.frame = CGRect(x:20,y:30,width:25,height:25)
        leftIcon.image = UIImage(named: "archive_icon")
        messageListBackgroundView.addSubview(leftIcon)
        
        // Add initial right icon
        rightIcon.frame = CGRect(x:view.frame.size.width-45,y:30,width:25,height:25)
        rightIcon.image = UIImage(named: "later_icon")
        messageListBackgroundView.addSubview(rightIcon)
        
        messageListBackgroundView.backgroundColor = grayColor
        //messageListItemView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func didPanMessageListItem(sender: UIPanGestureRecognizer) {
        
        //let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        //let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
        } else if sender.state == UIGestureRecognizerState.Changed {
            print(messageListItemView.frame.origin.x)
            messageListItemView.frame.origin.x = translation.x
            
            // Change list item background color and action icons
            switch messageListItemView.frame.origin.x {
            case -320 ... -240:
                messageListBackgroundView.backgroundColor = brownColor
                rightIcon.image = UIImage(named: "list_icon")
                rightIcon.frame.origin.x = messageListItemView.frame.origin.x + messageListItemView.frame.size.width + 20
            case -239 ... -60:
                messageListBackgroundView.backgroundColor = yellowColor
                rightIcon.image = UIImage(named: "later_icon")
                rightIcon.frame.origin.x = messageListItemView.frame.origin.x + messageListItemView.frame.size.width + 20
            case -59 ... 59:
                messageListBackgroundView.backgroundColor = grayColor
                leftIcon.frame.origin.x = 20
                rightIcon.frame.origin.x = view.frame.size.width-45
            case 60 ... 239:
                messageListBackgroundView.backgroundColor = greenColor
                leftIcon.image = UIImage(named: "archive_icon")
                leftIcon.frame.origin.x = messageListItemView.frame.origin.x - 40
            case 240 ... 320:
                messageListBackgroundView.backgroundColor = redColor
                leftIcon.image = UIImage(named: "delete_icon")
                leftIcon.frame.origin.x = messageListItemView.frame.origin.x - 40
            default:
                print(messageListItemView.frame.origin.x)
            }
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            // Decide were to snap list item
            switch messageListItemView.frame.origin.x {
            case -320 ... -240:
                // List
                UIView.animateWithDuration(0.2, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseInOut], animations: { () -> Void in
                    self.messageListItemView.frame.origin.x = -320
                    }, completion: { (Bool) -> Void in
                })
            case -239 ... -60:
                // Later
                UIView.animateWithDuration(0.2, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseInOut], animations: { () -> Void in
                    self.messageListItemView.frame.origin.x = -320
                    }, completion: { (Bool) -> Void in
                })
            case -59 ... 59:
                // Return
                UIView.animateWithDuration(0.15, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseInOut], animations: { () -> Void in
                    self.messageListItemView.frame.origin.x = 0
                    }, completion: { (Bool) -> Void in
                })
            case 60 ... 239:
                // Archive
                UIView.animateWithDuration(0.2, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseInOut], animations: { () -> Void in
                    self.messageListItemView.frame.origin.x = 320
                    }, completion: { (Bool) -> Void in
                })
            case 240 ... 320:
                // Delete
                UIView.animateWithDuration(0.2, delay: 0.0, options: [UIViewAnimationOptions.CurveEaseInOut], animations: { () -> Void in
                    self.messageListItemView.frame.origin.x = 320
                    }, completion: { (Bool) -> Void in
                })
            default:
                print(messageListItemView.frame.origin.x)
            }
        }
    }

}

