//
//  Constants.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import Foundation
import UIKit

struct AppUtilities {
    
    static let shared: AppUtilities = AppUtilities()
    
    func getUUID() -> String {
        return UUID().uuidString
    }
    
    func getVersionNumber() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    func getBuildNumber() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    }
    
    func getDeviceName() -> String {
        return UIDevice.current.name
    }
    
    func getSystemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
}
