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
    
    let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 150, height: 150))
    let lineWidth: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircle(withLayer: greyCircleLayer, andColor: UIColor.lightGray)
        setupCircle(withLayer: progressCircleLayer, andColor: UIColor.red)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupCircle(withLayer layer: CAShapeLayer, andColor strokeColor: UIColor) {
        layer.path = circlePath.cgPath
        layer.addSublayer(progressCircleLayer)
        
        layer.strokeColor = strokeColor.cgColor;
        layer.fillColor = UIColor.clear.cgColor;
        layer.strokeEnd = 0
        layer.lineCap = kCALineCapRound
        layer.lineWidth = lineWidth
    }
    
    func setProgress(with newValue: Float) {
        progressCircleLayer.strokeEnd = CGFloat(newValue)
    }

}
