import AppKit
import Foundation

let name = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "App"
let iconPath = "\(name)/Assets.xcassets/AppIcon.appiconset/AppIcon.png"
let image = NSImage(size: NSSize(width: 1024, height: 1024))
image.lockFocus()
let color = name == "Noillirk"
    ? NSColor(srgbRed: 0.16, green: 0.15, blue: 0.27, alpha: 1.0)
    : NSColor(srgbRed: 0.04, green: 0.28, blue: 0.40, alpha: 1.0)
color.setFill()
NSRect(x: 0, y: 0, width: 1024, height: 1024).fill()
let paragraph = NSMutableParagraphStyle()
paragraph.alignment = .center
let letter = String(name.prefix(1)) as NSString
letter.draw(in: NSRect(x: 0, y: 180, width: 1024, height: 720),
    withAttributes: [
        .font: NSFont.boldSystemFont(ofSize: 600),
        .foregroundColor: NSColor.white,
        .paragraphStyle: paragraph
    ])
image.unlockFocus()
guard let tiff = image.tiffRepresentation,
      let rep = NSBitmapImageRep(data: tiff),
      let png = rep.representation(using: .png, properties: [:]) else {
    fatalError("Could not generate app icon")
}
try png.write(to: URL(fileURLWithPath: iconPath))
print("Generated \(iconPath)")
