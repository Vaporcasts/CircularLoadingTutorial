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
    
    func downloadImage(with url: String, withIndexPath indexPath: IndexPath) {
        print("starting download now")
        let download = ImageDownload(url: url, indexPath: indexPath)
        download.task = session.downloadTask(with: URL(string: url)!)
        download.task?.resume()
        currentDownloads[url] = download
    }
    
    func downloadStarted(for url: String) -> Bool {
        return currentDownloads.keys.contains(url)
    }
    
    func downloadFinished(for url: String) -> Bool {
        return finishedDownloads.keys.contains(url)
    }
    
}

