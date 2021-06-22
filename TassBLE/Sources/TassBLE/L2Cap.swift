////
////  File.swift
////  
////
////  Created by hyeoktae kwon on 2021/06/22.
////
//
//import Foundation
//import Bluetooth
//import BluetoothGATT
//
///// Test L2CAP socket
//final class L2CAP: L2CAPSocketProtocol {
//    
//    // MARK: - Properties
//    
//    var log: ((String) -> ())?
//    
//    let name: String
//    
//    let address: BluetoothAddress
//    
//    /// The socket's security level.
//    private(set) var securityLevel: SecurityLevel = .sdp
//    
//    /// Attempts to change the socket's security level.
//    func setSecurityLevel(_ securityLevel: SecurityLevel) throws {
//        
//        self.securityLevel = securityLevel
//    }
//    
//    /// Target socket.
//    weak var target: L2CAP?
//    
//    private(set) var input = [Data]()
//    
//    private(set) var cache = [Data]()
//    
//    init(address: BluetoothAddress = .zero,
//         name: String = "") {
//        
//        self.address = address
//        self.name = name
//    }
//    
//    // MARK: - Methods
//    
//    /// Write to the socket.
//    func send(_ data: Data) throws {
//        
//        guard let target = self.target
//            else { throw POSIXError(.ECONNRESET) }
//        
//        target.input.append(data)
//    }
//    
//    /// Reads from the socket.
//    @discardableResult
//    func recieve(_ bufferSize: Int) throws -> Data? {
//        
//        guard let sentData = self.input.popFirst()
//            else { return nil }
//        
//        let readData = Data(sentData.prefix(bufferSize))
//        
//        cache.append(readData)
//        
//        return readData
//    }
//}
