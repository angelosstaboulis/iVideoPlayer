//
//  ViewController.swift
//  iVideoPlayer
//
//  Created by Angelos Staboulis on 3/8/21.
//

import Cocoa
import AVKit
import AVFoundation
class ViewController: NSViewController {
  
    @IBOutlet var playerView: AVPlayerView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        initialValues()
        Utilities.shared.addLogo(parent: view, playerView: playerView)
       
        // Do any additional setup after loading the view.
    }
    override func viewDidLayout() {
        super.viewDidLayout()
        playerView.frame = view.frame
    }
    @objc func menuOpen(sender:Notification){
        let currentPath = sender.object as? String
        Utilities.shared.openVideo(currentPath: currentPath!, playerView: playerView)
    }
    @objc func menuOpenURL(sender:Notification){
        let currentPath = sender.object as? String
        Utilities.shared.openVideo(currentPath: currentPath! , playerView: playerView)

       
    }
    @objc func menuPlay(sender:Notification){
        Utilities.shared.playVideo(playerView: playerView)
    }
    @objc func menuPause(sender:Notification){
        Utilities.shared.playVideo(playerView: playerView)
     
    }
    @objc func menuMute(sender:Notification){
        Utilities.shared.muteVideo(playerView: playerView)
    }
    @objc func menuForward(sender:Notification){
        Utilities.shared.forward(playerView: playerView, rate: 10.0)
    }
    @objc func menuBackward(sender:Notification){
        Utilities.shared.backward(playerView: playerView, rate: -10.0)
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
extension ViewController {
    func initialValues(){
        NotificationCenter.default.addObserver(self, selector: #selector(menuOpen), name: NSNotification.Name("menuOpen"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(menuOpenURL), name: NSNotification.Name("menuOpenURL"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(menuPlay), name: NSNotification.Name("menuPlay"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(menuPause), name: NSNotification.Name("menuPause"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(menuMute), name: NSNotification.Name("menuMute"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(menuBackward), name: NSNotification.Name("menuBackward"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(menuForward), name: NSNotification.Name("menuForward"), object: nil)
    }
 
  
}
