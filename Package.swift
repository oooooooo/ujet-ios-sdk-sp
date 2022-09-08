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
      targets: ["WrapperUJET", "WrapperUJETChatRed"]),
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
    .package(url: "https://github.com/twilio/conversations-ios", .exact("2.2.4")),
    .package(url: "https://github.com/twilio/twilio-voice-ios", .exact("6.4.2")),
    .package(url: "https://github.com/cobrowseio/cobrowse-sdk-ios-binary", .exact("2.20.1")),
  ],
  targets: [
    .binaryTarget(
      name: "UJETFoundationKit",
      url: "https://sdk.ujet.co/ios/0.49.0/UJETFoundationKit.xcframework.zip",
      checksum: "1999a7c1d0bea52918f824c72dce4696aa19b4e613bb9fda9acb43111edbc499"
    ),

    .binaryTarget(
      name: "UJETKit",
      url: "https://sdk.ujet.co/ios/0.49.0/UJETKit.xcframework.zip",
      checksum: "4d704fd3201607de747b4c962d830b9faededb1749111d89970fc11c2a129612"
    ),

    .binaryTarget(
      name: "UJETCobrowseKit",
      url: "https://sdk.ujet.co/ios/0.49.0/UJETCobrowseKit.xcframework.zip",
      checksum: "1b9880f7b85dbb7347518f93e1cf01cbf8a0360dab29cec6e1784ec7fb9c1d7e"
    ),

    .binaryTarget(
      name: "UJETChatRedKit",
      url: "https://sdk.ujet.co/ios/0.49.0/UJETChatRedKit.xcframework.zip",
      checksum: "0a578443f9a4c7cbafaa660c82ed177879aca6b9e513b261ff73d7ab39a4b5db"
    ),

    .binaryTarget(
      name: "UJETChatBlueKit",
      url: "https://sdk.ujet.co/ios/0.49.0/UJETChatBlueKit.xcframework.zip",
      checksum: "95b0e98bdfdb83127300373c64722ac41fb5b6937b2d901e60b09febe81e9920"
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
    )
  ]
)
