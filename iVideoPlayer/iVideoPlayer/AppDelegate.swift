//
//  AppDelegate.swift
//  iVideoPlayer
//
//  Created by Angelos Staboulis on 3/8/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBAction func menuOpen(_ sender: Any) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = true
        openPanel.runModal()
        NotificationCenter.default.post(name: NSNotification.Name("menuOpen"), object: openPanel.url?.path)
    }
    @IBAction func menuOpenURL(_ sender: Any) {
        let storyboardMain = NSStoryboard(name: "Main", bundle: nil)
        let openVideo:OpenVideoURL = storyboardMain.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("OpenVideoURL")) as! OpenVideoURL
        openVideo.presentAsModalWindow(openVideo)
       
    }
    
  
    
    @IBAction func menuPlay(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuPlay"), object: "menuPlay")
    }
    
    @IBAction func menuPause(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuPause"), object: "menuPause")
    }
    @IBAction func menuMute(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuMute"), object: "menuMute")
    }
    @IBAction func menuForward(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuForward"), object: "menuForward")
    }
    @IBAction func menuBackward(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuBackward"), object: "menuBackward")
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

