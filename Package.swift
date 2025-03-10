// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "UUIDShortener",
    platforms: [
        .iOS(.v13),
        .tvOS(.v16)
    ],
    products: [
        .library(
            name: "UUIDShortener",
            targets: ["UUIDShortener"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UUIDShortener"
        ),
        .testTarget(
            name: "UUIDShortenerTests",
            dependencies: [
                .target(name: "UUIDShortener")
            ]
        )
    ]
)
