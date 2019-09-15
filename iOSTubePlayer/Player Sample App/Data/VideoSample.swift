//
//  VideoSample.swift
//  iOSTubePlayer
//
//  Created by HanSJin on 9/16/19.
//  Copyright © 2019 한승진. All rights reserved.
//

import Foundation

struct VideoData {
    let url: URL
    
    struct Samples {
        
        func makeSampleData() -> [VideoData] {
            let video1 = VideoData(url: URL(string: "https://line-objects-dev.com/abc/video/test_video.mp4")!)
            let video2 = VideoData(url: URL(string: "https://line-objects-dev.com/abc/video/sana2.mp4")!)
            let video3 = VideoData(url: URL(string: "https://line-objects-dev.com/abc/video/nayeon.mp4")!)
            return [video1, video2, video3]
        }
        
        subscript (_ index: Int) -> VideoData {
            let videos = makeSampleData()
            let modularIndex = index % videos.count
            return videos[modularIndex]
        }
    }
}
