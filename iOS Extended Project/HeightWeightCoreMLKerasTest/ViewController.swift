//
//  ViewController.swift
//  HeightWeightCoreMLKerasTest
//
//  Created by Jacopo Mangiavacchi on 9/1/17.
//  Copyright © 2017 JacopoMangia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var unitControl: UISegmentedControl!
    @IBOutlet weak var sexControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    internal func getSex() -> HeightWeightModelWrapper.Sex {
        return sexControl.selectedSegmentIndex == 0 ? .Male : .Female
    }
    
    @IBAction func calculateHeight(_ sender: Any) {
        if let input = Float(inputText.text!) {
            let modelWrapper = HeightWeightModelWrapper()

            var resultString = ""
            if unitControl.selectedSegmentIndex == 1 {
                let result = modelWrapper.predictHeight(cm: input, sex: getSex())
                resultString = "\(result) Kilos"
            }
            else {
                let result = modelWrapper.predictHeight(inches: input, sex: getSex())
                resultString = "\(result) Pounds"
            }

            resultLabel.text = "Your expected Weight should be \(resultString)"
            resultLabel.isHidden = false
        }
    }
    
}

