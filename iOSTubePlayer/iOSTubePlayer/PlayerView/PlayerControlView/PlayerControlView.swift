//
//  PlayControlView.swift
//  iOSTubePlayer
//
//  Created by HanSJin on 9/15/19.
//  Copyright © 2019 한승진. All rights reserved.
//

import UIKit

class PlayerControlView: UIView, Nib {

    // MAKR: - Header Outlets
    @IBOutlet weak var controlHeaderView: UIView!
    
    // MAKR: - Body Outlets
    @IBOutlet weak var controlBodyView: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MAKR: - Footer Outlets
    @IBOutlet weak var controlFooterView: UIView!
    
    // MARK: - Variables
    weak var delegate: PlayerControlDelegate?
    weak var dataSource: PlayerControlDataSource?
    
    // MARK: - Initial
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        loadNib()
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
}

// MARK: -
extension PlayerControlView {
    
    func appearControlView() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1.0
        }
    }
    
    func disappearControlerView() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0.0
        }
    }
}

// MARK: - UITouch Events
extension PlayerControlView {
    
    @IBAction func tappedPlayPauseButton(_ sender: UIButton) {
        guard let dataSource = dataSource else {
            return
        }
        if dataSource.isPlayerPlaying() {
            delegate?.playerControlDidTapPause(self)
            playPauseButton.setImage(UIImage(named: "pause-button"), for: .normal)
        } else {
            delegate?.playerControlDidTapPlay(self)
            playPauseButton.setImage(UIImage(named: "play-button"), for: .normal)
        }
    }
    
    @IBAction func tappedPreviousButton(_ sender: UIButton) {
        delegate?.playerControlDidTapPrevious(self)
    }
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
        delegate?.playerControlDidTapNext(self)
    }
}
