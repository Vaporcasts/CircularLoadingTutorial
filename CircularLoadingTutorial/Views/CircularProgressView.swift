//
//  CircularProgressView.swift
//  CircularLoadingTutorial
//
//  Created by Stephen Bodnar on 8/7/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {
    let progressCircleLayer = CAShapeLayer()
    let greyCircleLayer = CAShapeLayer()
    
    let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 150, height: 150)).cgPath
    let lineWidth: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGreyCircleLayer()
        setupCircleLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupCircleLayer() {
        progressCircleLayer.path = circlePath
        layer.addSublayer(progressCircleLayer)
        
        progressCircleLayer.strokeColor = UIColor.red.cgColor;
        progressCircleLayer.fillColor = UIColor.clear.cgColor;
        progressCircleLayer.strokeEnd = 0
        progressCircleLayer.lineCap = kCALineCapRound
        progressCircleLayer.lineWidth = lineWidth
    }
    
    fileprivate func setupGreyCircleLayer() {
        greyCircleLayer.path = circlePath
        layer.addSublayer(greyCircleLayer)
        
        greyCircleLayer.strokeColor = UIColor.lightGray.cgColor
        greyCircleLayer.fillColor = UIColor.clear.cgColor;
        greyCircleLayer.strokeEnd = 1
        greyCircleLayer.lineWidth = lineWidth
    }
    
    func setProgress(with newValue: Float) {
        progressCircleLayer.strokeEnd = CGFloat(newValue)
    }
    
}
