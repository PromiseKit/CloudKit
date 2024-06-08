// swift-tools-version:4.2
import PackageDescription

let name = "PMKCloudKit"

let pkg = Package(name: name)
pkg.products = [
    .library(name: name, targets: [name]),
]
pkg.swiftLanguageVersions = [.v3, .v4, .v4_2]
pkg.dependencies = [
	.package(url: "https://github.com/mxcl/PromiseKit.git", from: "8.1.2")
]

let target: Target = .target(name: name)
target.path = "Sources"
target.exclude = [
	"CKContainer+AnyPromise.h",
	"CKDatabase+AnyPromise.h",
	"\(name).h",
	"CKContainer+AnyPromise.m",
	"CKDatabase+AnyPromise.m"
]
target.dependencies = ["PromiseKit"]

pkg.targets = [target]
