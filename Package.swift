// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "UJET",
  platforms: [
    .iOS(.v13)
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
  ],
  dependencies: [
    .package(url: "https://github.com/twilio/conversations-ios", .exact("4.0.2")),
    .package(url: "https://github.com/twilio/twilio-voice-ios", .exact("6.10.2")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .exact("2.29.6")),
  ],
  targets: [
    .binaryTarget(
      name: "UJETFoundationKit",
      url: "https://sdk.ujet.co/ios/2.6.0/UJETFoundationKit.xcframework.zip",
      checksum: "0965e50d22d94883d3d11eef8485bdcdd77b8238050dc5b9939ddcfc86787956"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios/2.6.0/UJETKit.xcframework.zip",
      checksum: "361df5f77c3f6aa700b9e838ebc5403930d2a63c4bf8f7cb1742b23daf915319"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios/2.6.0/UJETCobrowseKit.xcframework.zip",
      checksum: "e72d3d2de67e060bccb784edc271f0017e8dba75719ff8322092cb2487313e4b"
    ),

    .binaryTarget(
      name: "UJETChatRedKit",
      url: "https://sdk.ujet.co/ios/2.6.0/UJETChatRedKit.xcframework.zip",
      checksum: "5101aca357b6e5c07685fa1a98d4d1c5273ee2ecfaeb32e17732e591fa298465"
    ),
    .binaryTarget(
      name: "UJETCallRedKit",
      url: "https://sdk.ujet.co/ios/2.6.0/UJETCallRedKit.xcframework.zip",
      checksum: "d887e0fb7fe472fdb8a575cb143bb29d77301e87ebe125ecded4c423a6d74231"
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
      name: "WrapperUJETCallRed",
      dependencies: [
        "UJETFoundationKit",
        "UJETCallRedKit",
        .product(name: "TwilioVoice", package: "twilio-voice-ios")
      ]
    )
  ]
)
