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
    task.launchPath = "~/TassPi/TassBLE/Sources/TassBLE"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

shell("raspistill -o tassImg.jpg")

//if #available(macOS 10.15, *) {
//  let camera = CameraManager()
//  camera.startCapture()
//} else {
//  // Fallback on earlier versions
//  print("no Module")
//}




