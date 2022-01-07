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
            targets: ["UJETSDK"])
    ],
    dependencies: [
         .package(url: "https://github.com/twilio/conversations-ios", from: "1.3.1"),
         .package(url: "https://github.com/twilio/twilio-voice-ios", from: "6.3.0")
    ],
    targets: [
        .binaryTarget(
            name: "UJET",
            url: "https://sdk.ujet.co/ios/0.43.0/UJET.xcframework.zip",
            checksum: "a5af47d42c0ae534e246e6c2d6c1821d1547c53a70b68ed7679c761989f7db35"),

        .target(
            name: "UJETSDK",
            dependencies: [
                "UJET", 
                .product(name: "TwilioConversationsClient", package: "conversations-ios"), 
                .product(name: "TwilioVoice", package: "twilio-voice-ios")
            ]
        )
    ]
)
