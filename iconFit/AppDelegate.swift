//
//  AppDelegate.swift
//  iconFit
//
//  Created by peterfei on 2016/12/14.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa
var statusItem: NSStatusItem!
var appDelegate: NSObject?

func startLocalNotification(message:String,info:String) {
    let notification = NSUserNotification()
    //消息标题
    notification.title = message
    //消息详细信息
    notification.informativeText = info
    
    //设置代理
    NSUserNotificationCenter.default.delegate = appDelegate as? NSUserNotificationCenterDelegate
    
    //注册本地推送
    NSUserNotificationCenter.default.scheduleNotification(notification)
}
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    @IBOutlet weak var shareMenu: NSMenu!

    @IBOutlet weak var exitsApp: NSMenuItem!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.createButtonStatusBar()
        appDelegate = self
    }
    
    func createButtonStatusBar(){
        //获取系统单例 NSStatusBar 对象
        let statusBar = NSStatusBar.system()
        let item = statusBar.statusItem(withLength: NSSquareStatusItemLength)
        let iconImage = NSImage(named: "StatusIcon")
        iconImage?.isTemplate = true
       
        item.button?.target = self
        
//        item.button?.action = #selector(AppDelegate.itemAction(_:))
        item.button?.image = iconImage

        item.menu = self.shareMenu
        statusItem = item
    }
    @IBAction func statusMenuClicked(sender: NSMenuItem) {
        switch sender.tag {
        case 1:
            return
        case 3:
            // 退出
            NSApp.terminate(nil)
        default:
            return
        }
    }
//    @IBAction func itemAction(_ sender: AnyObject){
//        //激活应用到前台(如果应用窗口处于非活动状态)
//        NSRunningApplication.current().activate(options: [.activateIgnoringOtherApps])
//        let window =  NSApp.windows[0]
//        window.orderFront(self)
//    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    

}

extension  AppDelegate: NSUserNotificationCenterDelegate{
    // 强行通知
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
}
