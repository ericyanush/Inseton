//
//  CommandCodes.swift
//  InsteonPackageDescription
//
//  Created by Eric Yanush on 2017-12-09.
//

import Foundation

internal enum PLMCommandCode: UInt8 {
    
    case start = 0x02
    case ack   = 0x06
    case nack  = 0x15
    
    // From IM to Host
    case standardMessageRecieve     = 0x50
    case extendedMessageRecieve     = 0x51
    case x10Recieve                 = 0x52
    case allLinkingComplete         = 0x53
    case buttonEventReport          = 0x54
    case userResetDetected          = 0x55
    case allLinkCleanupFailed       = 0x56
    case allLinkRecordResponse      = 0x57
    case allLinkCleanupStatus       = 0x58
    
    // From Host to IM
    case getIMInfo                  = 0x60
    case sendAllLink                = 0x61
    case sendInsteonMessage         = 0x62
    case sendX10Message             = 0x63
    case startAllLinking            = 0x64
    case cancelAllLinking           = 0x65
    case setHostDeviceCategory      = 0x66
    case resetIM                    = 0x67
    case setInsteonACKByte          = 0x68
    case getFirstAllLinkRecord      = 0x69
    case getNextAllLinkRecord       = 0x6A
    case setIMConfiguration         = 0x6B
    case getAllLinkRecordForSender  = 0x6C
    case ledOn                      = 0x6D
    case ledOff                     = 0x6E
    case manageAllLinkRecord        = 0x6F
    case setInsteonNACKByte         = 0x70
    case setInsteonACKTwoByte       = 0x71
    case rfSleep                    = 0x72
    case getIMConfig                = 0x73
}

internal extension Data {
    init(commandBytes: [PLMCommandCode]) {
        self.init(bytes: commandBytes.map { $0.rawValue })
    }
}
