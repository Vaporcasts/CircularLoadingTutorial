//
//  ViewController+SessionDelegate.swift
//  CircularLoadingTutorial
//
//  Created by Stephen Bodnar on 8/6/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

extension ViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("finished downloding to location: \(location)")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard let originalImageUrl = downloadTask.originalRequest?.url?.absoluteString else { return }
        if let imageDownload = imageDownloader.currentDownloads[originalImageUrl] {
            let totalProgress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            imageDownload.progress = totalProgress
            DispatchQueue.main.async {
                if let cell = self.tableView.cellForRow(at: imageDownload.indexPath) as? ImageCell {
                   // need to update cell progress here
                }
            }
        }
    }
}

