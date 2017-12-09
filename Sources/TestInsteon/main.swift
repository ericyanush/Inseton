import Foundation
import Insteon


var plm = InsteonPLM(serialPath: "/dev/tty.usbserial-AL01OXV4")!
plm.getIMInfo()

var keepRunning = true
signal(SIGINT) { _ in
    DispatchQueue.main.async {
        keepRunning = false
    }
}

while keepRunning {
    RunLoop.current.run(until: Date(timeIntervalSinceNow: 2))
}
