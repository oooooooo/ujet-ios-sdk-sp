// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "UJET",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(
      name: "UJET",
      targets: ["WrapperUJET"]),
    .library(
      name: "UJETCobrowse",
      targets: ["WrapperUJETCobrowse"]),
    .library(
      name: "UJETCobrowseExtension",
      targets: ["WrapperUJETCobrowseExtension"]),
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", .exact("2.2.2")),
    .package(url: "https://github.com/twilio/twilio-voice-ios", .exact("6.3.1")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .exact("2.18.0"))
  ],
  targets: [
    .binaryTarget(
      name: "UJETFoundation",
      url: "https://sdk.ujet.co/ios/0.46.0/UJETFoundation.xcframework.zip",
      checksum: "ab9ebefae0ac218bfbf4e5554e5c56bf5d6a0f999c3429426c599e1e76c0cbf6"
    ),

    .binaryTarget(
      name: "UJET",
      url: "https://sdk.ujet.co/ios/0.46.0/UJET.xcframework.zip",
      checksum: "4ece575e6aa50d171ab4e10f78c768bf59214faf8671b95327cc024fdbab9254"
    ),

    .binaryTarget(
      name: "UJETCobrowse",
      url: "https://sdk.ujet.co/ios/0.46.0/UJETCobrowse.xcframework.zip",
      checksum: "cda85a4d55d5758e27561685c49a4c3fd8d34d16bd507d18bde712a2a11a9f3f"
    ),

    .target(
      name: "WrapperUJET",
      dependencies: [
        "UJET",
        "UJETFoundation",
        .product(name: "TwilioConversationsClient", package: "conversations-ios"), 
        .product(name: "TwilioVoice", package: "twilio-voice-ios")
      ]
    ),

    .target(
      name: "WrapperUJETCobrowse",
      dependencies: [
        "UJETFoundation",
        "UJETCobrowse",
        .product(name: "CobrowseIO", package: "cobrowse-sdk-ios-binary")
      ]
    ),

    .target(
      name: "WrapperUJETCobrowseExtension",
      dependencies: [
        .product(name: "CobrowseIOAppExtension", package: "cobrowse-sdk-ios-binary")
      ]
    )
  ]
)
