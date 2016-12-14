//
//  DragImageView.swift
//  iconFit
//
//  Created by peterfei on 2016/12/14.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa

public protocol DragImageZoneDelegate: class{
    func didFinishDragWithFile(_ filePath:String)
}
class DragImageView: NSImageView {
    weak var delegate: DragImageZoneDelegate?
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    func dropAreaFadeIn() {
        self.alphaValue = 1.0
    }
    
    func dropAreaFadeOut() {
        self.alphaValue = 0.2
    }

}
//实现 NSDraggingDestination 代理协议接口

extension DragImageView{
   
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        let sourceDragMask = sender.draggingSourceOperationMask()
        let pboard = sender.draggingPasteboard()
        if (pboard.types?.contains(NSFilenamesPboardType))! {
            
            if sourceDragMask == .copy {
                return .copy
            }
            
            if sourceDragMask == .link {
                return .link
            }
            
        }
        return .every
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        self.dropAreaFadeOut()
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let pboard = sender.draggingPasteboard()
        self.dropAreaFadeOut()
        
        if (pboard.types?.contains(NSFilenamesPboardType))! {
            let files = pboard.propertyList(forType: NSFilenamesPboardType) as! [String]
            if files.count > 0 {
                let filePath = files[0]
                if let dragDelegate = delegate {
                    dragDelegate.didFinishDragWithFile(filePath)
                }
            }
        }
        return true
    }

}
