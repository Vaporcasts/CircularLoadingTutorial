//
//  ImageCell.swift
//  CircularLoadingTutorial
//
//  Created by Stephen Bodnar on 8/6/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    var postImageView = UIImageView()
    let circularProgress = CircularProgressView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        postImageView.backgroundColor = UIColor(red: 253 / 255, green: 253 / 255, blue: 253 / 255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        circularProgress.alpha = 1
    }
    
    func configure(with downloader: ImageDownloader, andUrl url: String, forIndexPath indexPath: IndexPath) {
        if downloader.downloadFinished(for: url) {
            if let image = downloader.finishedDownloads[url] { setImageView(with: image) }
            circularProgress.alpha = 0
        } else if downloader.downloadStarted(for: url) {
            if let currentProgress = downloader.currentDownloads[url]?.progress {
                circularProgress.setProgress(with: currentProgress)
            }
        }
        else { downloader.downloadImage(with: url, withIndexPath: indexPath)  }
    }
    
    func setImageView(with image: UIImage) {
        DispatchQueue.main.async {
            self.postImageView.image = image
        }
    }
    
    func updateProgressBar(with progress: Float) {
        circularProgress.setProgress(with: progress)
    }
}

extension ImageCell {
    func layout() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(postImageView)
        postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        postImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        postImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        circularProgress.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(circularProgress)
        circularProgress.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        circularProgress.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        circularProgress.heightAnchor.constraint(equalToConstant: 150).isActive = true
        circularProgress.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

