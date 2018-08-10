//
//  ViewController+Layout.swift
//  CircularLoadingTutorial
//
//  Created by Stephen Bodnar on 8/10/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

extension ViewController {
    func layout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
    }
}
