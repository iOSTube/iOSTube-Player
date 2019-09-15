//
//  iOSTubePlayer.swift
//  iOSTubePlayer
//
//  Created by HanSJin on 9/15/19.
//  Copyright © 2019 한승진. All rights reserved.
//

import Foundation
import AVKit

protocol iOSTubePlayerDataSource: class {
    
}

protocol iOSTubePlayerDelegate: class {
    func requestPrevious(_ playerView: iOSTubePlayerView, currentItem: AVPlayerItem?)
    func requestNext(_ playerView: iOSTubePlayerView, currentItem: AVPlayerItem?)
}
