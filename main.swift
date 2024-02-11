import Foundation
import Network

let ssidToMatch = "iPhone"
let ipManual = "172.20.10.2"
let subnetMask = "255.255.255.240"
let routerIP = "172.20.10.1"
let interfaceName = "Wi-Fi"

// 네트워크 설정 변경 함수
func setNetworkConfiguration(forSSID ssid: String) {
    let command: String
    if ssid.contains(ssidToMatch) {
        command = "networksetup -setmanual \(interfaceName) \(ipManual) \(subnetMask) \(routerIP)"
        print("Setting network to manual for SSID \(ssidToMatch)")
    } else {
        command = "networksetup -setdhcp \(interfaceName)"
        print("Setting network to DHCP")
    }
    
    let process = Process()
    process.launchPath = "/bin/sh"
    process.arguments = ["-c", command]
    process.launch()
    process.waitUntilExit()
    
    if process.terminationStatus == 0 {
        print("Network configuration updated successfully for \(ssid).")
    } else {
        print("Failed to update network configuration for \(ssid).")
    }
}

// SSID 확인 함수
func getCurrentSSID(completion: @escaping (String?) -> Void) {
    let process = Process()
    let pipe = Pipe()
    process.launchPath = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
    process.arguments = ["-I"]
    process.standardOutput = pipe
    process.launch()
    process.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    if let output = String(data: data, encoding: .utf8) {
        if let ssidLine = output.split(separator: "\n").first(where: { $0.contains(" SSID:") }) {
            let ssid = ssidLine.split(separator: ":").map(String.init)[1].trimmingCharacters(in: .whitespaces)
            completion(ssid)
        } else {
            completion(nil)
        }
    }
}

// NWPathMonitor 인스턴스 생성 및 시작
let monitor = NWPathMonitor()
monitor.start(queue: DispatchQueue.global(qos: .background))

monitor.pathUpdateHandler = { _ in
    getCurrentSSID { ssid in
        guard let ssid = ssid, !ssid.isEmpty else { return }
        print("Current SSID: \(ssid)")
        setNetworkConfiguration(forSSID: ssid)
    }
}

// 메인 스레드에서 대기
dispatchMain()
