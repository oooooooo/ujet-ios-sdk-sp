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
      url: "https://sdk.ujet.co/ios/0.50.0/UJETFoundationKit.xcframework.zip",
      checksum: "9cbe846959f041532447321e4688ef328851058890e2cb4e2f16b699efcbad31"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios/0.50.0/UJETKit.xcframework.zip",
      checksum: "6c55cd06ccfcd99056979a2bfcfebf1547eda83cbee0eccbdf032c1361b8b5d0"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios/0.50.0/UJETCobrowseKit.xcframework.zip",
      checksum: "97b84407ff02ab6dc81917a5cf0c97a6e207e352387a22aeae98c49ab12d1a98"
    ),

    .binaryTarget(
      name: "UJETChatRedKit",
      url: "https://sdk.ujet.co/ios/0.50.0/UJETChatRedKit.xcframework.zip",
      checksum: "3faeb785281abeecad368373642b217f2307ed0daceaf6f2ecfb8de21bed4c56"
    ),

    .binaryTarget(
      name: "UJETChatBlueKit",
      url: "https://sdk.ujet.co/ios/0.50.0/UJETChatBlueKit.xcframework.zip",
      checksum: "be46c879e0f474a86054260dbc40a688bbb2461b081a80e743e10e578c54671c"
    ),

    .binaryTarget(
      name: "UJETCallRedKit",
      url: "https://sdk.ujet.co/ios/0.50.0/UJETCallRedKit.xcframework.zip",
      checksum: "02575763c04d060b4bd27ef6eebd0b4ea90a5294781597677b9eb7fabf852558"
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
