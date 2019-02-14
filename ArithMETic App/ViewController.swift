//
//  ViewController.swift
//  ArithMETic App
//
//  Created by Crossen,Connor N on 2/13/19.
//  Copyright © 2019 Northwest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityTF: UITextField!
    
    @IBOutlet weak var weightTF: UITextField!
    
    @IBOutlet weak var timeTF: UITextField!
    
    
    @IBOutlet weak var energyLBL: UILabel!
    
    @IBOutlet weak var timeToLoseLBL: UILabel!
    
    
    @IBAction func calculate(_ sender: Any) {
        if activityTF.text != "" && weightTF.text != "" && timeTF.text != ""{
        
        let weightDoub:Double? = Double(weightTF.text!)
        let timeInt:Int? = Int(timeTF.text!)
        energyLBL.text = String(format: "%0.1f", ExerciseCoach.energyConsumed(during:activityTF.text!, weight:weightDoub!, time:timeInt!))

        timeToLoseLBL.text = String(format: "%0.1f", ExerciseCoach.timeToLose1(during:activityTF.text!, weight:weightDoub!))
        
    }
    }
    @IBAction func clear(_ sender: Any) {
        activityTF.text = ""
        weightTF.text = ""
        timeTF.text = ""
        energyLBL.text = ""
        timeToLoseLBL.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

struct ExerciseCoach{
        
static func energyConsumed(during:String, weight:Double, time:Int) -> Double{
switch during{
case "Bicycling": return 8.0 * 3.5 * weight/2.2 / 200 * Double(time)
case "Jumping rope": return 12.3 * 3.5 * weight/2.2 / 200 * Double(time)
case "Running – slow": return 9.8 * 3.5 * weight/2.2 / 200 * Double(time)
case "Running – fast": return 23.0 * 3.5 * weight/2.2 / 200 * Double(time)
case "Tennis": return 8.0 * 3.5 * weight/2.2 / 200 * Double(time)
case "Swimming": return 5.8 * 3.5 * weight/2.2 / 200 * Double(time)
    default: return 0
    }
}
            
static func timeToLose1(during:String, weight:Double) -> Double{
    return 3500 / energyConsumed(during:during, weight:weight, time:1)
}
            
}
        



