//
//  File.swift
//  
//
//  Created by hyeoktae kwon on 2021/06/21.
//

import Foundation

let camera = CameraManager()

let data = camera.photoData()

switch data {
case .success(let data):
  print("data: ", data.count)
case .failure(let err):
  print(err.localizedDescription)
}
