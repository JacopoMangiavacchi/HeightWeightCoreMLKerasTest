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
    
    enum Sex {
        case Female
        case Male
    }
    
    let cmToInch = Float(0.393701)
    let poundToKilo = Float(0.453592)
    let model = HeightWeightExtended_model()
    
    init() {
    }
    
    func predictHeight(inches: Float, sex: Sex) -> Float {
        do {
            let mlMultiArrayInput = try? MLMultiArray(shape:[3], dataType:MLMultiArrayDataType.double)
            mlMultiArrayInput![0] = NSNumber(floatLiteral: Double(inches))
            switch sex {
            case .Female:
                mlMultiArrayInput![1] = NSNumber(floatLiteral: Double(1))
                mlMultiArrayInput![2] = NSNumber(floatLiteral: Double(0))
            case .Male:
                mlMultiArrayInput![1] = NSNumber(floatLiteral: Double(0))
                mlMultiArrayInput![2] = NSNumber(floatLiteral: Double(1))
            }
            
            let heightWeightExtended_modelOutput = try model.prediction(input: HeightWeightExtended_modelInput(matrixHeightFemaleMale: mlMultiArrayInput!))
            
            return heightWeightExtended_modelOutput.weight[0].floatValue
        }
        catch let error {
            print(error)
        }

        return -1
    }

    func predictHeight(cm: Float, sex: Sex) -> Float {
        return predictHeight(inches: cm * cmToInch, sex: sex) * poundToKilo
    }
}
