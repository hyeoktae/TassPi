//
//  File.swift
//  
//
//  Created by hyeoktae kwon on 2021/06/21.
//

import Foundation

@discardableResult
func shell(command: String) -> Int32 {
  let task = Process()
  if #available(macOS 10.13, *) {
    task.executableURL = URL(string: "/usr/bin/env")
  } else {
    task.launchPath = "/usr/bin/env"
  }
  task.arguments = ["bash", "-c", command]
  if #available(macOS 10.13, *) {
    do {
      try task.run()
    } catch let err {
      print("err: ", err.localizedDescription)
    }
  } else {
    task.launch()
  }
  task.waitUntilExit()
  return task.terminationStatus
}

let state = shell(command: "raspistill -o tassImg.jpg")
print("state: ", state)
//~/TassPi/TassBLE/Sources/TassBLE
let fileManager = FileManager.default

let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]

print("url: ", documentURL.absoluteString)
//if #available(macOS 10.15, *) {
//  let camera = CameraManager()
//  camera.startCapture()
//} else {
//  // Fallback on earlier versions
//  print("no Module")
//}




