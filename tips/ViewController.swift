//
//  ViewController.swift
//  tips
//
//  Created by Brandon Souba on 4/8/15.
//  Copyright (c) 2015 Brandon Souba. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var fdsfasdfsd: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalLabel.text = "0.00"
        billField.becomeFirstResponder()
        self.background.backgroundColor = UIColor.grayColor()
        self.totalLabel.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        if billField.text != nil {
            UIView.animateWithDuration(0.4, animations: {
                self.totalLabel.alpha = 1
 
            })
        }
        
        if billField.text == "" || billField.text == nil {
            UIView.animateWithDuration(0.4, animations: {
                self.background.backgroundColor = UIColor.grayColor()
                self.totalLabel.alpha = 0
            })
        }
        
        if tipField.text == "" || billField.text == nil {
            UIView.animateWithDuration(0.4, animations: {
                self.background.backgroundColor = UIColor.grayColor()
        })
    }


        

    
        var billAmount = NSString(string: billField.text).doubleValue
        var tipAmount = NSString(string: tipField.text).doubleValue
        var tipDiscount = tipAmount * 0.01
        var tip = tipDiscount * billAmount
        var total = billAmount + tip

        totalLabel.text = "$\(total)"
        totalLabel.text = String(format: "$%.2f", total)
        
        if tipDiscount == 0  {
            UIView.animateWithDuration(0.4, animations: {
                self.background.backgroundColor = UIColor.grayColor()
            })
        }
        
        if tipAmount > 0  {
            UIView.animateWithDuration(0.4, animations: {
                self.background.backgroundColor = UIColor.redColor()
            })
        }
        
        if tipAmount >= 15 {
            UIView.animateWithDuration(0.4, animations: {
                self.background.backgroundColor = UIColor.orangeColor()
            })
        }
        
        if tipAmount >= 20 {
            UIView.animateWithDuration(0.4, animations: {
                self.background.backgroundColor = UIColor.greenColor()
            })
        }


    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

