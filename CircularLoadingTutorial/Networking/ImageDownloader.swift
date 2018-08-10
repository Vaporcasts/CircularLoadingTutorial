//
//  ImageDownloader.swift
//  CircularLoadingTutorial
//
//  Created by Stephen Bodnar on 8/6/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

class ImageDownloader {
    var session: URLSession!
    var currentDownloads = [String: ImageDownload]()
    var finishedDownloads = [String: UIImage]()
    
    func downloadImage(with urlString: String, withIndexPath indexPath: IndexPath) {
        guard let url = URL(string: urlString) else { return }
        let download = ImageDownload(url: urlString, indexPath: indexPath)
        download.task = session.downloadTask(with: url)
        download.task?.resume()
        currentDownloads[urlString] = download
    }
    
    func downloadStarted(for url: String) -> Bool {
        return currentDownloads.keys.contains(url)
    }
    
    func downloadFinished(for url: String) -> Bool {
        return finishedDownloads.keys.contains(url)
    }
    
}

