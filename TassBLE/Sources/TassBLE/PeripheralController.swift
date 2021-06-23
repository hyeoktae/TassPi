////
////  File.swift
////  
////
////  Created by hyeoktae kwon on 2021/06/23.
////
//
//#if os(Linux)
//    import Glibc
//#elseif os(OSX)
//    import Darwin.C
//#endif
//import Foundation
//import GATT
//import Bluetooth
//
//struct Tcommand: HCICommand {
//  static var opcodeGroupField: HCIOpcodeGroupField = .lowEnergy
//  var rawValue: HCIOpcodeCommandField
//  var name: String = "test"
//  
//  init?(rawValue: HCIOpcodeCommandField) {
//    self.rawValue = rawValue
//  }
//  
//  init(name: String, rawValue: HCIOpcodeCommandField) {
//    self.name = name
//    self.rawValue = rawValue
//  }
//  
//  
//}
//
//final class HostCon: BluetoothHostControllerInterface {
//  static var controllers: [HostCon] = [HostCon()]
//  
//  func deviceRequest<CP, Return>(_ commandParameter: CP, _ commandReturnType: Return.Type, timeout: HCICommandTimeout) throws -> Return where CP : HCICommandParameter, Return : HCICommandReturnParameter {
//    return Tcommand(rawValue: .zero) as! Return
//  }
//  
//  func deviceCommand<CP>(_ commandParameter: CP) throws where CP : HCICommandParameter {
//    print(commandParameter.data)
//  }
//  
//  func deviceRequest<CP>(_ commandParameter: CP, timeout: HCICommandTimeout) throws where CP : HCICommandParameter {
//    print(commandParameter.data)
//  }
//  
//  func deviceRequest<CP, EP>(_ commandParameter: CP, _ eventParameterType: EP.Type, timeout: HCICommandTimeout) throws -> EP where CP : HCICommandParameter, EP : HCIEventParameter {
//    return EP(data: Data())!
//  }
//  
////  static var controllers: [HostCon]
//  
//  func deviceCommand<C>(_ command: C) throws where C : HCICommand {
//    print(command.name, command.description)
//  }
//  
//  func deviceRequest<C>(_ command: C, timeout: HCICommandTimeout) throws where C : HCICommand {
//    print(command.name, command.description)
//  }
//  
//  func deviceRequest<C, EP>(_ command: C, _ eventParameterType: EP.Type, timeout: HCICommandTimeout) throws -> EP where C : HCICommand, EP : HCIEventParameter {
//    print(command.name, command.description)
//    return EP(data: Data())!
//  }
//  
//  func deviceRequest<Return>(_ commandReturnType: Return.Type, timeout: HCICommandTimeout) throws -> Return where Return : HCICommandReturnParameter {
//    return Tcommand(rawValue: .zero) as! Return
//  }
//  
//  func pollEvent<EP>(_ eventParameterType: EP.Type, shouldContinue: () -> (Bool), event: (EP) throws -> ()) throws where EP : HCIEventParameter {
//    
//  }
//  
//  
//}
//
//class TassL2Cap: L2CAPSocketProtocol {
//  
//  func recieve(_ bufferSize: Int) throws -> Data? {
//    return Data()
//  }
//  
//  func send(_ data: Data) throws {
//    print(data)
//  }
//  
//  var securityLevel: SecurityLevel = .sdp
//  
//  func setSecurityLevel(_ securityLevel: SecurityLevel) throws {
//    self.securityLevel = securityLevel
//  }
//  
//  
//}
//
//@available(macOS 10.12, *)
//final class PeripheralController {
//  static let shared = PeripheralController()
//  
//  let gatt = GATTPeripheral<HostCon, TassL2Cap>(controller: HostCon())
//  
//  func test() {
//    gatt.add(service: <#T##GATTAttribute.Service#>)
//  }
//}
