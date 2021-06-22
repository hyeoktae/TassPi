//
//  File.swift
//
//
//  Created by hyeoktae kwon on 2021/06/22.
//

import Foundation
import BluetoothGATT



let ble = BleModule.shared

class BleModule {
  static let shared = BleModule()

  var bleUUID: BluetoothUUID? = nil

  func setup(uuidStr: String) {
    let add = BluetoothAddress(rawValue: "B8:27:EB:06:1F:C2") ?? BluetoothAddress()
    let l2Cap = L2CAP(address: add, name: "TassPi")
    let server = GATTServer(socket: l2Cap)
    try? server.read()
//    server.writeValue(<#T##value: Data##Data#>, forCharacteristic: <#T##BluetoothUUID#>)

    let uuid128bit = BluetoothUUID(rawValue: "0000110e-0000-1000-8000-00805f9b34fb")
    let uuid = UUID(uuidString: "0000110e-0000-1000-8000-00805f9b34fb") ?? UUID()
    self.bleUUID = BluetoothUUID(uuid: uuid)
    let temp = Bluetooth.AppleBeacon.init(uuid: uuid, major: 1, minor: 2, rssi: 3)

  }
}
