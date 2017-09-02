//
//  ViewController.swift
//  HeightWeightCoreMLKerasTest
//
//  Created by Jacopo Mangiavacchi on 9/1/17.
//  Copyright © 2017 JacopoMangia. All rights reserved.
//

import UIKit
import CoreML

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
        if var inchesInput = Double(inputText.text!) {
            if unitControl.selectedSegmentIndex == 1 {
                inchesInput *= 0.393701
            }
            
            let model = HeightWeight_model()
            
            do {
                let mlMultiArrayInput = try? MLMultiArray(shape:[1,1], dataType:MLMultiArrayDataType.double)
                mlMultiArrayInput![0] = NSNumber(floatLiteral: inchesInput)
                
                let heightWeight_modelOutput = try model.prediction(input: HeightWeight_modelInput(height: mlMultiArrayInput!))
                
                var expectedWeigth = heightWeight_modelOutput.weight[0].doubleValue
                
                var resultString = ""
                if unitControl.selectedSegmentIndex == 1 {
                    expectedWeigth *= 0.453592
                    resultString = "\(expectedWeigth) Kilos"
                }
                else {
                    resultString = "\(expectedWeigth) Pounds"
                }
                
                resultLabel.text = "Your expected Height should be \(resultString)"
                resultLabel.isHidden = false
            }
            catch let error {
                print(error)
            }
        }
    }
    
}

