//
//  InsteonAddress.swift
//  InsteonPackageDescription
//
//  Created by Eric Yanush on 2017-12-08.
//

import Foundation

struct InsteonAddress {
    
    var groupNumber: UInt8? {
        if address[0] == 0 && address[1] == 0 {
            return address[2]
        }
        return nil
    }
    
    var stringValue: String {
        return String(format: "%02X.%02X.%02X", address[0], address[1], address[2])
    }
    
    init(high: UInt8, mid: UInt8, low: UInt8) {
        address = [high, mid, low]
    }
    
    private let address: [UInt8]
}
