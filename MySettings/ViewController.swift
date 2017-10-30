//
//  ViewController.swift
//  MySettings
//
//  Created by Terry McCart on 10/29/17.
//  Copyright © 2017 Terry McCart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var emailadd: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var savebtn: UIButton!
    
    @IBAction func savebtn(_sender: UIButton){
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.fullname.text, forKey: "fullname")
        defaults.set(self.emailadd.text, forKey: "email")
        defaults.set(self.phonenumber.text, forKey: "phonenumber")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from:birthday.date) //pass Date here
        defaults.set(newDate, forKey: "bdate")
        print(birthday.date.description)
        defaults.synchronize()
        clear()
        
    }
    
    func clear()
    {
        emailadd.resignFirstResponder()
       fullname.resignFirstResponder()
        phonenumber.resignFirstResponder()
    }
        
        
        override func viewDidLoad() {
        super.viewDidLoad()
            let defaults: UserDefaults = UserDefaults.standard
            if defaults.string(forKey: "fullname") != nil{
                fullname.text = defaults.string(forKey: "fullname")
            }
            if defaults.string(forKey: "email") != nil{
                emailadd.text = defaults.string(forKey: "email")
            }
            if defaults.string(forKey: "phonenumber") != nil{
                phonenumber.text = defaults.string(forKey: "phonenumber")
            
                if defaults.string(forKey: "bdate") != nil{
                let bdate  = defaults.string(forKey: "bdate")
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
                let date = dateFormatter.date(from: bdate!) //according to date format your date string
                birthday.setDate(date!, animated: true)
            }
    }
            
            
            
            
            // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

