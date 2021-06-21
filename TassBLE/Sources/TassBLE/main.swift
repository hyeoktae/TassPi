//
//  File.swift
//  
//
//  Created by hyeoktae kwon on 2021/06/21.
//

import Foundation


if #available(macOS 10.15, *) {
  let camera = CameraManager()
  camera.startCapture()
} else {
  // Fallback on earlier versions
  print("no Module")
}




