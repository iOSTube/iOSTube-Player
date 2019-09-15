//
//  PlayerControl.swift
//  iOSTubePlayer
//
//  Created by HanSJin on 9/15/19.
//  Copyright © 2019 한승진. All rights reserved.
//

import Foundation

protocol PlayerControlDataSource: class {
    func isPlayerPlaying() -> Bool
}

protocol PlayerControlDelegate: class {
    func playerControlDidTapPlay(_ playerControlView: PlayerControlView)
    func playerControlDidTapPause(_ playerControlView: PlayerControlView)
    func playerControlDidTapPrevious(_ playerControlView: PlayerControlView)
    func playerControlDidTapNext(_ playerControlView: PlayerControlView)
}
