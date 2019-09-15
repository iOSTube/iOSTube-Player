//
//  ViewController.swift
//  iOSTubePlayer
//
//  Created by HanSJin on 9/15/19.
//  Copyright © 2019 한승진. All rights reserved.
//

import UIKit
import AVKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var playerView: iOSTubePlayerView!
    
    // MARK: - Variables
    private let sampleVideoUrl: String = "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_30mb.mp4"
    
    private var videoUrl: URL {
        return URL(string: sampleVideoUrl)!
    }
    
    private var playerViewCode: iOSTubePlayerView = {
        return iOSTubePlayerView(frame: .zero)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerView.delegate = self
        playerViewCode.delegate = self
        view.addSubview(playerViewCode)
        
        playerView.requestPlay(url: videoUrl)
        playerViewCode.requestPlay(url: videoUrl)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        playerViewCode.frame = playerView.bounds
        playerViewCode.frame.origin.y = 300
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - iOSTubePlayerDataSource
extension MainViewController: iOSTubePlayerDataSource {
    
}

// MARK: - iOSTubePlayerDelegate
extension MainViewController: iOSTubePlayerDelegate {
    
    func requestPrevious(_ playerView: iOSTubePlayerView, currentItem: AVPlayerItem?) {
        print("requestPrevious")
    }
    
    func requestNext(_ playerView: iOSTubePlayerView, currentItem: AVPlayerItem?) {
        print("requestNext")
    }
}
