//
//  CameraManager.swift
//  WebRTCTutorial
//
//  Created by Eric on 2020/03/05.
//  Copyright © 2020 Eric. All rights reserved.
//

import Foundation
import AVFoundation
//import WebRTC

@objc
protocol CameraCaptureDelegate: AnyObject {
  func captureVideoOutput(sampleBuffer: CMSampleBuffer)
}

@available(macOS 10.15, *)
class CameraManager: NSObject {
  var videoCaptureDevice: AVCaptureDevice?
  let captureSession = AVCaptureSession()
  let videoDataOutput = AVCaptureVideoDataOutput()
  let audioDataOutput = AVCaptureAudioDataOutput()
  let dataOutputQueue = DispatchQueue(label: "VideoDataQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
  weak var delegate: CameraCaptureDelegate?
  
  var isCapturing = false
  
  func setupCamera(_ isFront: Bool = true) {
    var device: AVCaptureDevice?
    let deviceTypes: [AVCaptureDevice.DeviceType] = [.externalUnknown]
    
//    deviceTypes = [.builtInWideAngleCamera, .builtInMicrophone, .builtInTelephotoCamera]
    
//    if #available(iOS 11.1, *) {
//      if #available(iOS 13.0, *) {
//        deviceTypes = [.builtInTrueDepthCamera, .builtInDualCamera, .builtInTripleCamera, .builtInWideAngleCamera, .builtInMicrophone]
//      } else {
//        deviceTypes = [.builtInTrueDepthCamera, .builtInDualCamera, .builtInWideAngleCamera, .builtInMicrophone]
//      }
//    } else {
//      deviceTypes = [.builtInDualCamera, .builtInWideAngleCamera, .builtInMicrophone]
//    }
    
    let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: deviceTypes, mediaType: AVMediaType.video, position: AVCaptureDevice.Position.init(rawValue: isFront ? 2 : 1) ?? .back)

    for captureDevice in deviceDiscoverySession.devices {
        if captureDevice.position == AVCaptureDevice.Position.init(rawValue: isFront ? 2 : 1) ?? .back {
            device = captureDevice
            break
        }
    }
    
//    device = RTCCameraVideoCapturer.captureDevices().first { $0.position == AVCaptureDevice.Position.init(rawValue: isFront ? 2 : 1) ?? .back }
    
    guard let videoCaptureDevice = device,
      let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else { return }
    
    self.videoCaptureDevice = videoCaptureDevice
  
    captureSession.inputs.forEach {
      captureSession.removeInput($0)
    }
    
    captureSession.outputs.forEach {
      captureSession.removeOutput($0)
    }
    
    if captureSession.canAddInput(videoInput) {
      captureSession.addInput(videoInput)
    }
    
    
    // Add a video data output
    if captureSession.canAddOutput(videoDataOutput) {
      captureSession.addOutput(videoDataOutput)
      videoDataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
      videoDataOutput.setSampleBufferDelegate(self, queue: dataOutputQueue)
      videoDataOutput.connection(with: .video)?.videoOrientation = .portrait
      videoDataOutput.connection(with: .video)?.automaticallyAdjustsVideoMirroring = false
      videoDataOutput.connection(with: .video)?.isVideoMirrored = !isFront
    } else {
      print("Could not add video data output to the session")
      captureSession.commitConfiguration()
    }
  }
  
  func startCapture() {
    print("Capture Start!!")
    
    guard isCapturing == false else { return }
    isCapturing = true
    
    captureSession.startRunning()
  }
  
  func stopCapture() {
    print("Capture Ended!!")
    guard isCapturing == true else { return }
    isCapturing = false
    
    captureSession.stopRunning()
  }
}

@available(macOS 10.15, *)
extension CameraManager: AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureAudioDataOutputSampleBufferDelegate {
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    if connection == videoDataOutput.connection(with: .video) {
      print("able Video")
      delegate?.captureVideoOutput(sampleBuffer: sampleBuffer)
    }
  }
  func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
  }
}
