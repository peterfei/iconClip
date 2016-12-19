//
//  NSImage+Ext.swift
//  iconFit
//
//  Created by peterfei on 2016/12/19.
//  Copyright © 2016年 peterfei. All rights reserved.
//
import Cocoa

extension NSImage {
    
    func saveAtPath(path:String) {
        let data = self.tiffRepresentation
        let imageRep = NSBitmapImageRep(data: data!)
        let imageData = imageRep?.representation(using: .PNG , properties: [NSImageCompressionFactor:1.0])
        try? imageData?.write(to: URL(fileURLWithPath: path))
    }
    
    func reSize(size:NSSize) ->NSImage {
        let resizeWidth = size.width / 2
        let resizeHeight = size.height / 2
        let resizedImage = NSImage(size: NSSize(width: resizeWidth, height: resizeHeight))
        let originalSize = self.size
        
        resizedImage.lockFocus()
        let inRect = NSRect(x: 0, y: 0, width: resizeWidth, height: resizeHeight)
        let fromRect = NSRect(x: 0, y: 0, width: originalSize.width, height: originalSize.height)
        
        self.draw(in: inRect , from: fromRect, operation: .sourceOver, fraction: 1.0)
        resizedImage.unlockFocus()
        return resizedImage
    }
    
}
