//
//  Double+Ext.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 30.04.2023.
//

import Foundation

extension Double {
    
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
