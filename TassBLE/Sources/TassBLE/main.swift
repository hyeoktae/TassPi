//
//  File.swift
//  
//
//  Created by hyeoktae kwon on 2021/06/21.
//

import Foundation
import Bluetooth
import BluetoothLinux

let camera = CameraManager()

let data = camera.photoData()

switch data {
case .success(let data):
  print("data: ", data.count)
  
  guard let hostController = BluetoothLinux.HostController.default
      else { fatalError("No Bluetooth adapters found") }
  let uuid = UUID(rawValue: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
  let beacon = AppleBeacon(uuid: uuid, major: 1, minor: 1, rssi: -29)
  do { try hostController.iBeacon(beacon) }
  catch { print("Error enabling iBeacon: \(error)") }
  
case .failure(let err):
  print(err.localizedDescription)
}
