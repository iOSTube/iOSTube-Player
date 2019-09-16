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
    @IBOutlet private weak var playerViewIB: iOSTubePlayerView!
    
    // MARK: - Variables
    private var playerViewCode: iOSTubePlayerView = {
        return iOSTubePlayerView(frame: .zero)
    }()
    
    private var sampleVideos = VideoData.Samples()
    private var currentIndexIB: Int = 0
    private var currentIndexCode: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerViewIB.delegate = self
        playerViewCode.delegate = self
        view.addSubview(playerViewCode)
        
        playerViewIB.requestPlay(url: sampleVideos[currentIndexIB].url)
        playerViewCode.requestPlay(url: sampleVideos[currentIndexCode].url)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        playerViewCode.frame = playerViewIB.bounds
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
        switch playerView {
        case playerViewIB:
            currentIndexIB -= 1
            requestPlay(playerView: playerView, index: currentIndexIB)
        case playerViewCode:
            currentIndexCode -= 1
            requestPlay(playerView: playerView, index: currentIndexCode)
        default:
            break
        }
    }
    
    func requestNext(_ playerView: iOSTubePlayerView, currentItem: AVPlayerItem?) {
        switch playerView {
        case playerViewIB:
            currentIndexIB += 1
            requestPlay(playerView: playerView, index: currentIndexIB)
        case playerViewCode:
            currentIndexCode += 1
            requestPlay(playerView: playerView, index: currentIndexCode)
        default:
            break
        }
    }
    
    private func requestPlay(playerView: iOSTubePlayerView, index: Int) {
        playerView.requestPlay(url: sampleVideos[index].url)
    }
}
