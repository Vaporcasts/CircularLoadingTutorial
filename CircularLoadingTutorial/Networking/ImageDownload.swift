//
//  ImageDownload.swift
//  CircularLoadingTutorial
//
//  Created by Stephen Bodnar on 8/7/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import Foundation

class ImageDownload {
    var task: URLSessionDownloadTask?
    var url: String
    var progress: Float
    var indexPath: IndexPath
    
    init(url: String, indexPath: IndexPath) {
        self.url = url
        self.indexPath = indexPath
        progress = 0
    }
}
