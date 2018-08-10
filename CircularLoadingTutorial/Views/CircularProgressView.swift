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
    
    var circlePath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 150, height: 150).insetBy(dx: lineWidth / 2, dy: lineWidth / 2))
    }
    
    var lineWidth: CGFloat { return 5 }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRedCirlce()
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let greyPath = UIBezierPath(ovalIn: circlePath.bounds)
        UIColor.lightGray.setStroke()
        UIColor.clear.setFill()
        greyPath.lineWidth = lineWidth
        
        greyPath.stroke()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupRedCirlce() {
        progressCircleLayer.path = circlePath.cgPath
        layer.addSublayer(progressCircleLayer)
        
        progressCircleLayer.strokeColor = UIColor.red.cgColor
        progressCircleLayer.fillColor = UIColor.clear.cgColor
        progressCircleLayer.strokeEnd = 0
        progressCircleLayer.lineCap = kCALineCapRound
        progressCircleLayer.lineWidth = lineWidth
    }
    
    func setProgress(with newValue: Float) {
        progressCircleLayer.strokeEnd = CGFloat(newValue)
    }
    
}
