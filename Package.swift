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
            targets: ["WrapperUJET"])
    ],
    dependencies: [
         .package(url: "https://github.com/twilio/conversations-ios", from: "2.2.1"),
         .package(url: "https://github.com/twilio/twilio-voice-ios", from: "6.3.1")
    ],
    targets: [
        .binaryTarget(
            name: "UJET",
            url: "https://sdk.ujet.co/ios/0.45.1/UJET.xcframework.zip",
            checksum: "d627d03cbc79e9d276752e2e35b88f81191d3bdebe07d062b9ac7e5bc8dc67ac"),

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
