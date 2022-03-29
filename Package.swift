// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "UJET",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "UJET",
            targets: ["WrapperUJET"])
    ],
    dependencies: [
         .package(url: "https://github.com/twilio/conversations-ios", from: "1.3.1"),
         .package(url: "https://github.com/twilio/twilio-voice-ios", from: "6.3.0")
    ],
    targets: [
        .binaryTarget(
            name: "UJET",
            url: "https://sdk.ujet.co/ios/0.45.0/UJET.xcframework.zip",
            checksum: "cc866a20da191a7c72499bfa7f31f53073a25b76f92cdfde5d24234a34a8f812"),

        .target(
            name: "WrapperUJET",
            dependencies: [
                "UJET", 
                .product(name: "TwilioConversationsClient", package: "conversations-ios"), 
                .product(name: "TwilioVoice", package: "twilio-voice-ios")
            ]
        )
    ]
)
