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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateHeight(_ sender: Any) {
        if let input = Float(inputText.text!) {
            let modelWrapper = HeightWeightModelWrapper()

            var resultString = ""
            if unitControl.selectedSegmentIndex == 1 {
                let result = modelWrapper.predictHeight(cm: input)
                resultString = "\(result) Kilos"
            }
            else {
                let result = modelWrapper.predictHeight(inches: input)
                resultString = "\(result) Pounds"
            }

            resultLabel.text = "Your expected Height should be \(resultString)"
            resultLabel.isHidden = false
        }
    }
    
}

