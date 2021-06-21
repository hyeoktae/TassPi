//
//  File.swift
//  
//
//  Created by hyeoktae kwon on 2021/06/21.
//

import Foundation

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "~/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

let state = shell("raspistill -o tassImg.jpg")
print("state: ", state)
//if #available(macOS 10.15, *) {
//  let camera = CameraManager()
//  camera.startCapture()
//} else {
//  // Fallback on earlier versions
//  print("no Module")
//}




