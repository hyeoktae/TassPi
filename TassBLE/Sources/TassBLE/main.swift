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
  task.launchPath = "/usr/bin/env"
  task.arguments = ["bash", "-c", command]
  task.launch()
  task.waitUntilExit()
  return task.terminationStatus
}

let state = shell(command: "raspistill - tassImg.jpg")
print("state: ", state)
//if #available(macOS 10.15, *) {
//  let camera = CameraManager()
//  camera.startCapture()
//} else {
//  // Fallback on earlier versions
//  print("no Module")
//}




