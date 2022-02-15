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
            url: "https://sdk.ujet.co/ios/0.44.0/UJET.xcframework.zip",
            checksum: "cb023b50628c123441d3674cc017f819d86d42c3ecf06b2077f669e1a55ade4c"),

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
