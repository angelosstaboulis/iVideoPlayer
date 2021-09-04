//
//  OpenVideoURL.swift
//  iVideoPlayer
//
//  Created by Angelos Staboulis on 3/8/21.
//

import Cocoa

class OpenVideoURL: NSViewController {
    var url:URL!
    @IBOutlet var txtFieldURL: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func btnOpenURL(_ sender: Any) {
        url = URL(string:txtFieldURL.stringValue)
        NotificationCenter.default.post(name: NSNotification.Name("menuOpenURL"), object: url)
        dismiss(self)
    }
    
}
