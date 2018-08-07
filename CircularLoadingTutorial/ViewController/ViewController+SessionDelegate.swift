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
        do {
            let data = try Data(contentsOf: location)
            guard let originalUrl = downloadTask.originalRequest?.url?.absoluteString else { return }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                if let imageDownload =  self.imageDownloader.currentDownloads[originalUrl], let cell = self.tableView.cellForRow(at: imageDownload.indexPath) as? ImageCell {
                    cell.postImageView.image = image
                    cell.circularProgress.alpha = 0
                }
                self.imageDownloader.finishedDownloads[originalUrl] = image
            }
        } catch { print("could not convert to data from url") }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let originalImageUrl = downloadTask.originalRequest!.url!.absoluteString
        if let imageDownload = imageDownloader.currentDownloads[originalImageUrl] {
            let totalProgress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            imageDownload.progress = totalProgress
            DispatchQueue.main.async {
                if let cell = self.tableView.cellForRow(at: imageDownload.indexPath) as? ImageCell {
                    cell.updateProgressBar(with: totalProgress)
                }
            }
        }
    }
    
}
