//
//  File.swift
//  
//
//  Created by hyeoktae kwon on 2021/06/21.
//

import Foundation

@discardableResult
//func shell(_ args: String...) -> Int32 {
//    let task = Process()
//    task.launchPath = "~/usr/bin/env"
//    task.arguments = args
//    task.launch()
//    task.waitUntilExit()
//    return task.terminationStatus
//}

//func shell(_ command: String) -> String {
//    let task = Process()
//    let pipe = Pipe()
//
//    task.standardOutput = pipe
//    task.standardError = pipe
//    task.arguments = ["-c", command]
//    task.launchPath = "/bin/env"
//    task.launch()
//
//    let data = pipe.fileHandleForReading.readDataToEndOfFile()
//    let output = String(data: data, encoding: .utf8)!
//
//    return output
//}

func shell(command: String) -> Int32 {
  let task = Process()
  task.launchPath = "/usr/bin/env"
  task.arguments = ["bash", "-c", command]
  task.launch()
  task.waitUntilExit()
  return task.terminationStatus
}

let state = shell(command: "raspistill -o tassImg.jpg")
print("state: ", state)
//if #available(macOS 10.15, *) {
//  let camera = CameraManager()
//  camera.startCapture()
//} else {
//  // Fallback on earlier versions
//  print("no Module")
//}




