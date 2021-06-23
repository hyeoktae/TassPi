// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TassBLE",
  products: [
    //          .library(
    //              name: "TassBLE",
    //              targets: ["TassBLE"]),
    //        .library(name: "TassBLE", type: .static, targets: ["TassBLE"])
    .executable(name: "TassBLE", targets: ["TassBLE"])
  ],
  dependencies: [
    // 6e99685bb22b532536dac6187faa3287671c83ae BluetoothLinux
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    //      .package(url: "https://github.com/PureSwift/GATT", .upToNextMajor(from: "2.0.0")),
    .package(url: "https://github.com/uraimo/SwiftyGPIO.git", .upToNextMajor(from: "1.0.0")),
    
//    .package(url: "https://github.com/PureSwift/GATT.git", .branch("master")),
    .package(url: "https://github.com/PureSwift/BluetoothLinux.git", .branch("master")),
    .package(url: "https://github.com/PureSwift/Bluetooth.git", .branch("master"))
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "TassBLE",
      dependencies: ["SwiftyGPIO", "BluetoothLinux", "Bluetooth"])
  ]
)
