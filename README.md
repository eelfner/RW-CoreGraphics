# Core Graphics Exploration in iOS and OS X

The code in this repo represents work done following the excellent RayW tutorial on Core Graphics, but has the twist of implementing for both iOS and OS X.

Original tutorial is [Core Graphics: Part 1](http://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1)

## General Notes

- Written in Swift 2 with xCode 7
- Motivated by my outside work on a shared iOS/OS X App.

## Discussion

Previous investigations into sharing code between iOS and OS X apps has led me to beleive that there is not a clear delineation on what you should try to share and not share. On one attempt, I went all the way to shared View Controller logic. This did not work out so well. I'm hopeful that all non-UI logic can be shared so it is really a matter of what UI code can be shared.

This project examines having share drawing code. As a first pass at this, 2 project groups have been created:

- SharedCore: General code that is not specific to this application but is added to make the shared code work for both iOS and OS X. This is NOT a complete implementation, but rather just what is needed for this project. Code like:

```swift
#if os(iOS)
    import UIKit
    public typealias IXImage = UIImage
    public typealias IXColor = UIColor
    public typealias IXBezierPath  = UIBezierPath
#elseif os(OSX)
    import AppKit
    public typealias IXImage = NSImage
    public typealias IXColor = NSColor
    public typealias IXBezierPath  = NSBezierPath
#endif

extension IXBezierPath {
...
    func ppLineToX(x:CGFloat, y:CGFloat) {
        #if os(iOS)
            addLineToPoint(ppPoint(x, y))
        #elseif os(OSX)
            lineToPoint(ppPoint(x, y))
        #endif
    }
...
```

- Shared: At the time of this writing, this group has a single class SharedDraw with static methods for drawing items that are specifically needed for this project that will work for both iOS and OS X. Code like:

```swift
class SharedDraw {
    static func developerYellowFill(rect:CGRect) {
        let path = IXBezierPath(rect:rect)
        IXColor.yellowColor().setFill()
        path.fill()
    }
```