import AppKit
import Foundation

guard CommandLine.arguments.count > 1 else {
    fputs("Usage: swift scripts/make-icon.swift Noillirk\n", stderr)
    exit(2)
}

let appName = CommandLine.arguments[1]
let assetDirectory = URL(fileURLWithPath: "\(appName)/Assets.xcassets/AppIcon.appiconset", isDirectory: true)
let outputURL = assetDirectory.appendingPathComponent("AppIcon.png")
let size = 1024
let image = NSImage(size: NSSize(width: size, height: size))
image.lockFocus()

let bounds = NSRect(x: 0, y: 0, width: size, height: size)
NSGradient(colors: [
    NSColor(srgbRed: 0.04, green: 0.61, blue: 0.57, alpha: 1),
    NSColor(srgbRed: 0.04, green: 0.29, blue: 0.42, alpha: 1)
])!.draw(in: bounds, angle: -40)

let glyph = "И"
let attributes: [NSAttributedString.Key: Any] = [
    .font: NSFont.systemFont(ofSize: 610, weight: .black),
    .foregroundColor: NSColor.white
]
let glyphSize = glyph.size(withAttributes: attributes)
glyph.draw(at: NSPoint(x: (CGFloat(size) - glyphSize.width) / 2 - 10,
                       y: (CGFloat(size) - glyphSize.height) / 2 - 18),
           withAttributes: attributes)

NSColor(srgbRed: 0.40, green: 0.96, blue: 0.84, alpha: 1).setFill()
NSBezierPath(ovalIn: NSRect(x: 730, y: 742, width: 82, height: 82)).fill()
NSColor.white.withAlphaComponent(0.9).setFill()
NSBezierPath(ovalIn: NSRect(x: 208, y: 218, width: 30, height: 30)).fill()
NSBezierPath(ovalIn: NSRect(x: 782, y: 235, width: 22, height: 22)).fill()

image.unlockFocus()
guard let tiff = image.tiffRepresentation,
      let bitmap = NSBitmapImageRep(data: tiff),
      let png = bitmap.representation(using: .png, properties: [:]) else {
    fputs("Could not render icon\n", stderr)
    exit(1)
}
try FileManager.default.createDirectory(at: assetDirectory, withIntermediateDirectories: true)
try png.write(to: outputURL)
let webDirectory = URL(fileURLWithPath: "Web", isDirectory: true)
try FileManager.default.createDirectory(at: webDirectory, withIntermediateDirectories: true)
try png.write(to: webDirectory.appendingPathComponent("icon-1024.png"))
print("Wrote \(outputURL.path)")
