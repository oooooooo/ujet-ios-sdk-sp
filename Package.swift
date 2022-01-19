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
            url: "https://sdk.ujet.co/ios/0.43.0/UJET.xcframework.zip",
            checksum: "24df5d78c9f0a2410f323f7d74a6fb9e7e73d5765161d768a72e87b7568ba3b3"),

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
