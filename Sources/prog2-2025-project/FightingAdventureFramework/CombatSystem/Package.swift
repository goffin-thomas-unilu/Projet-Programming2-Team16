// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "CombatSystem",
	products: [
		.executable(name: "CombatSystem", targets: ["CombatSystem"]),
	],
	dependencies: [],
	targets: [
		.executableTarget(name: "CombatSystem", dependencies: [])
	]
)
