//
//  ViewController.swift
//  iconFit
//
//  Created by peterfei on 2016/12/14.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var imageView: DragImageView!
    var imageScaleConfig: NSDictionary?
    @IBOutlet weak var makeScale: NSButton!
    var largeImagePath: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUIView()
        self.readImageScaleConfig()
        // Do any additional setup after loading the view.
    }
    @IBAction func makeAppIconAction(_ sender: NSButton) {
        self.makeAsserts()
    }
    
    func setUpUIView() {
        //        调用代理
        self.imageView.delegate = self
        
    }
    
    //plist文件读取
    func readImageScaleConfig() {
        let filePath = Bundle.main.path(forResource: "imageSize", ofType: "plist")
        let dataMap = NSDictionary(contentsOfFile: filePath!)
        self.imageScaleConfig = dataMap
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func makeAsserts() {
        
        if (self.largeImagePath==nil) {
            startLocalNotification(message: "Oop...",info: "请将上传文件拖入")
        }
        
    }
    
    

}

extension ViewController: DragImageZoneDelegate {
    
    func didFinishDragWithFile(_ filePath:String) {
        NSLog("filePath \(filePath)")
        self.largeImagePath = filePath
//        self.exportPath = self.usrDocPath()
//        self.exportButton.isEnabled = true
    }
}
