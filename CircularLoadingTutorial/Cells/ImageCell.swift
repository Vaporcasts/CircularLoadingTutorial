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
    }
    
    func configure(with downloader: ImageDownloader, andUrl url: String, forIndexPath indexPath: IndexPath) {
        if let url = URL(string: url) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let unwrappedData = data, let image = UIImage(data: unwrappedData) {
                    self.setImageView(with: image)
                }
            }
            task.resume()
        }
    }
    
    func setImageView(with image: UIImage) {
        DispatchQueue.main.async {
            self.postImageView.image = image
        }
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
    }
}

