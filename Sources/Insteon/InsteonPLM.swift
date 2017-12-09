import Foundation
import AsyncSerial

public protocol PLMDelegate: class {
    func plmInfoRecieved(data: Data)
}

public class InsteonPLM {
    
    private var serialPort: SerialPort
    
    public weak var delegate: PLMDelegate?
    
    public init?(serialPath: String) {
        serialPort = SerialPort(path: serialPath)
        serialPort.delegate = self
        try! serialPort.openPort(.readWrite)
        serialPort.set(baudRate: .b19200,
                       parity: .none,
                       stopBits: .one,
                       dataBits: .eight)
    }

    public func getIMInfo() {
        let command: [PLMCommandCode] = [.start, .getIMInfo]
        let data = Data(commandBytes: command)
        try! serialPort.send(data)
    }
    
    public func sendAllLink() { }
    
    public func sendInsteonMessage() { }
    
    public func sendX10Message() { }
    
    public func startAllLinking() { }
    
    public func cancelAllLinking() { }
    
    public func setHostDeviceCategory() { }
    
    public func resetIM() { }
    
    public func setInsteonACK() { }
    
    public func getFirstAllLinkRecord() { }
    
    public func getNextAllLinkRecord() { }
    
    public func setIMConfig() { }
    
    public func getAllLinkRecordForSender() { }
    
    public func ledOn() { }
    
    public func ledOff() { }
    
    public func manageAllLinkRecord() { }
    
    public func setInsetonNACK() { }
    
    public func setInsteonTwoByteNACK() { }
    
    public func rfSleep() { }
    
    public func getIMConfig() { }
}

extension InsteonPLM: SerialPortReceiveDelegate {
    public func serialPort(_ serialPort: SerialPort, didReceive data: Data) {
        print("SerialPortDelegate Got data")
        delegate?.plmInfoRecieved(data: data)
    }
}
