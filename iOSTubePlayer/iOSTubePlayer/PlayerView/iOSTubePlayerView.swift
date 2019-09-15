//
//  iOSTubePlayerView.swift
//  iOSTubePlayer
//
//  Created by HanSJin on 9/15/19.
//  Copyright © 2019 한승진. All rights reserved.
//

import UIKit
import AVKit

class iOSTubePlayerView: UIView {

    // MARK: - Outlets
    
    // MARK: - Layer Variables
    override public class var layerClass: Swift.AnyClass {
        return AVPlayerLayer.self
    }
    
    // MARK: - Player Variables
    private var player = AVQueuePlayer() {
        didSet {
            player.actionAtItemEnd = .none
        }
    }
    private var isPlaying: Bool {
        return player.rate != 0.0
    }
    
    // MARK: - Initial
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func commonInit() {
        backgroundColor = .black
        if let playerLayer = layer as? AVPlayerLayer {
            playerLayer.player = player
            playerLayer.videoGravity = .resizeAspectFill
        }
        initPlayerControlView()
    }
    
    private func initPlayerControlView() {
        let controlView = PlayerControlView(frame: bounds)
        addSubview(controlView)
    }
}

// MARK: - Public methods
extension iOSTubePlayerView {
    
    func requestPlay(url videoUrl: URL) {
        let asset = AVURLAsset(url: videoUrl)
        let playerItem = AVPlayerItem(asset: asset)
        
        if player.canInsert(playerItem, after: player.items().last) {
            player.insert(playerItem, after: nil)
            playerPlay()
        }
    }
}

// MARK: - Private methods
extension iOSTubePlayerView {

    func playerPlay() {
        if !isPlaying {
            player.play()
        }
    }
}
