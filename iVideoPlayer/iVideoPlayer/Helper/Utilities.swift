//
//  Utilities.swift
//  iVideoPlayer
//
//  Created by Angelos Staboulis on 4/9/21.
//

import Foundation
import AVKit
import AVFoundation
class Utilities{
    var player:AVPlayer!
    var playerItem:AVPlayerItem!
    var asset:AVAsset!
    var image:NSImage!
    var imageView:NSImageView!
    static let shared = Utilities()
    private init(){}
    func addLogo(parent:NSView,playerView:AVPlayerView){
        let path = Bundle.main.path(forResource: "mediaplayer", ofType: "png")
        image = NSImage(contentsOfFile: path!)
        imageView = NSImageView(image: image!)
        playerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: parent.centerYAnchor,constant: 0).isActive = true
       
    }
    func openVideo(currentPath:String,playerView:AVPlayerView){
        let url = URL(fileURLWithPath:currentPath)
        asset = AVAsset(url: url)
        playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        playerView.player = player
        imageView.removeFromSuperview()
    }
    func muteVideo(playerView:AVPlayerView){
        if  playerView.player?.isMuted == true {
            playerView.player?.isMuted = false
        }
        else{
            playerView.player?.isMuted = true
        }
    }
    func playVideo(playerView:AVPlayerView){
        if ((playerView.player?.play) != nil){
            playerView.player?.pause()
        }
        else{
            playerView.player?.play()
        }
    }
    func pauseVideo(playerView:AVPlayerView){
        if ((playerView.player?.pause) != nil){
            playerView.player?.play()
        }
        else{
            playerView.player?.pause()
        }
    }
    func forward(playerView:AVPlayerView,rate:Float){
        playerView.player?.playImmediately(atRate: rate)
    }
    func backward(playerView:AVPlayerView,rate:Float){
        playerView.player?.playImmediately(atRate: rate)
    }
}
