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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUIView()
        // Do any additional setup after loading the view.
    }
    
    func setUpUIView() {
        self.imageView.delegate = self
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: DragImageZoneDelegate {
    
    func didFinishDragWithFile(_ filePath:String) {
        NSLog("filePath \(filePath)")
//        self.largeImagePath = filePath
//        self.exportPath = self.usrDocPath()
//        self.exportButton.isEnabled = true
    }
}
