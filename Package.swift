// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "UJET",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(
      name: "UJETKit",
      targets: ["WrapperUJET", "WrapperUJETTwilioChat"]),
    .library(
      name: "UJETCobrowseKit",
      targets: ["WrapperUJETCobrowse"]),
    .library(
      name: "UJETCobrowseExtensionKit",
      targets: ["WrapperUJETCobrowseExtension"]),
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", .exact("2.2.2")),
    .package(url: "https://github.com/twilio/twilio-voice-ios", .exact("6.4.1")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .exact("2.20.1"))
  ],
  targets: [
    .binaryTarget(
      name: "UJETFoundationKit",
      url: "https://sdk.ujet.co/ios/0.48.0/UJETFoundationKit.xcframework.zip",
      checksum: "2fd9c42f55db2053f66cd07802e04fb1501fafd86d0d2c3c92f8d6679e39694e"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios/0.48.0/UJETKit.xcframework.zip",
      checksum: "2da0e4c3a82d7168701ea48c73bd13413d637214653179061c047ccd7c5affbe"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios/0.48.0/UJETCobrowseKit.xcframework.zip",
      checksum: "649d560bd0ff197dfc505e19c7ec8408f00fc6d6adc38dc0cba169d46816dd2c"
    ),

    .binaryTarget(
      name: "UJETTwilioChatKit",
      url: "https://sdk.ujet.co/ios/0.48.0/UJETTwilioChatKit.xcframework.zip",
      checksum: "359630f5d2ecd0bba2f0818d6a94eae1e88bf9776622664f051c50fae359db33"
    ),

    .target(
      name: "WrapperUJET",
      dependencies: [
        "UJETKit",
        "UJETFoundationKit",
        .product(name: "TwilioVoice", package: "twilio-voice-ios")
      ]
    ),

    .target(
      name: "WrapperUJETCobrowse",
      dependencies: [
        "UJETFoundationKit",
        "UJETCobrowseKit",
        .product(name: "CobrowseIO", package: "cobrowse-sdk-ios-binary")
      ]
    ),

    .target(
      name: "WrapperUJETCobrowseExtension",
      dependencies: [
        .product(name: "CobrowseIOAppExtension", package: "cobrowse-sdk-ios-binary")
      ]
    ),

    .target(
      name: "WrapperUJETTwilioChat",
      dependencies: [
        "UJETFoundationKit",
        "UJETTwilioChatKit",
        .product(name: "TwilioConversationsClient", package: "conversations-ios"),
      ]
    )
  ]
)
