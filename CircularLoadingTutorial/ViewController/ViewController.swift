//
//  ViewController.swift
//  CircularLoadingTutorial
//
//  Created by Stephen Bodnar on 8/6/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView = UITableView()
    var photoUrls = ["https://images.pexels.com/photos/641038/pexels-photo-641038.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=1000&w=1440",  "https://images.pexels.com/photos/92658/pexels-photo-92658.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=500&w=720",  "https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=500&w=720", "https://ucarecdn.com/fb19c504-914d-4b67-bae0-3d082d8ae3d2/beautifulbangkok.jpg",  "https://ucarecdn.com/50ae393e-7707-4d86-acda-b009c5bfcab7/rooftopbars.jpg", "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=500&w=720", "https://images.pexels.com/photos/674268/pexels-photo-674268.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=2000&w=2892"]
    
    var imageDownloader = ImageDownloader()

    override func viewDidLoad() {
        super.viewDidLoad()
        imageDownloader.session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
  //      imageDownloader.session = URLSession(configuration: URLSessionConfiguration.background(withIdentifier: "backgroundSession"), delegate: self, delegateQueue: nil)
        layout()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as? ImageCell {
            cell.configure(with: imageDownloader, andUrl: photoUrls[indexPath.row], forIndexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }
}



