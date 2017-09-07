//
//  HeightWeightModelWrapper.swift
//  HeightWeightCoreMLKerasTest
//
//  Created by Jacopo Mangiavacchi on 9/4/17.
//  Copyright © 2017 JacopoMangia. All rights reserved.
//

import Foundation
import CoreML

class HeightWeightModelWrapper {
    
    let cmToInch = Float(0.393701)
    let poundToKilo = Float(0.453592)
    let model = HeightWeight_model()
    
    init() {
    }
    
    func predictHeight(inches: Float) -> Float {
        do {
            let mlMultiArrayInput = try? MLMultiArray(shape:[1], dataType:MLMultiArrayDataType.double)
            mlMultiArrayInput![0] = NSNumber(floatLiteral: Double(inches))
            
            let heightWeight_modelOutput = try model.prediction(input: HeightWeight_modelInput(height: mlMultiArrayInput!))
            
            return heightWeight_modelOutput.weight[0].floatValue
        }
        catch let error {
            print(error)
        }

        return -1
    }

    func predictHeight(cm: Float) -> Float {
        return predictHeight(inches: cm * cmToInch) * poundToKilo
    }
}
