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
      targets: ["WrapperUJET", "WrapperUJETChatRed", "WrapperUJETCallRed"]),
    .library(
      name: "UJETCobrowseKit",
      targets: ["WrapperUJETCobrowse"]),
    .library(
      name: "UJETCobrowseExtensionKit",
      targets: ["WrapperUJETCobrowseExtension"]),
    .library(
      name: "UJETChatBlueKit",
      targets: ["WrapperUJETChatBlue"]),
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", .exact("2.2.5")),
    .package(url: "https://github.com/twilio/twilio-voice-ios", .exact("6.4.2")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .exact("2.21.2")),
  ],
  targets: [
    .binaryTarget(
      name: "UJETFoundationKit",
      url: "https://sdk.ujet.co/ios/0.50.1/UJETFoundationKit.xcframework.zip",
      checksum: "bbd7e43494fc5af722f774dcb0e3e95bc00a235937ba6bcc9d77d4c373b7c381"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios/0.50.1/UJETKit.xcframework.zip",
      checksum: "872713abcc37c11350f4b17a6712065dfa5bd51af26b442f7df0c6c7301ad467"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios/0.50.1/UJETCobrowseKit.xcframework.zip",
      checksum: "aa465677ff5b2e593c87d8896790cdc6618cb0e8c71e737796de69f4f6864fe3"
    ),

    .binaryTarget(
      name: "UJETChatRedKit",
      url: "https://sdk.ujet.co/ios/0.50.1/UJETChatRedKit.xcframework.zip",
      checksum: "131ee909172aee40fa4aef8b22ec5939d17a4ee2c2ebc564519e4ca38f69ce9b"
    ),

    .binaryTarget(
      name: "UJETChatBlueKit",
      url: "https://sdk.ujet.co/ios/0.50.1/UJETChatBlueKit.xcframework.zip",
      checksum: "1e65398d950f3c3b204578922d40b129e9d0e05ac8716ab73819130028bbd869"
    ),

    .binaryTarget(
      name: "UJETCallRedKit",
      url: "https://sdk.ujet.co/ios/0.50.1/UJETCallRedKit.xcframework.zip",
      checksum: "8bac7bb5737fec9e11e9b6f22f37c1f7d24562e60f59ce086779f2f7ce0a0871"
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
      name: "WrapperUJETChatRed",
      dependencies: [
        "UJETFoundationKit",
        "UJETChatRedKit",
        .product(name: "TwilioConversationsClient", package: "conversations-ios"),
      ]
    ),

    .target(
      name: "WrapperUJETChatBlue",
      dependencies: [
        "UJETFoundationKit",
        "UJETChatBlueKit",
      ]
    ),

    .target(
      name: "WrapperUJETCallRed",
      dependencies: [
        "UJETFoundationKit",
        "UJETCallRedKit",
        .product(name: "TwilioVoice", package: "twilio-voice-ios")
      ]
    )
  ]
)
