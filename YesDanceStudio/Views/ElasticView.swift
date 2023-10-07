//
//  ElasticView.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

final class ElasticView: UIView {
    
    private let topControlPointView = UIView()
    private let leftControlPointView = UIView()
    private let rightControlPointView = UIView()
    private let bottomControlPointView = UIView()
    
    private let elasticShape = CAShapeLayer()
    
    private lazy var displayLink: CADisplayLink = {
        let displayLink = CADisplayLink(
            target: self,
            selector: #selector(updateLoop)
        )
        
        displayLink.add(to: .current, forMode: .default)
        return displayLink
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        setupComponents()
        print(1)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        positionControlPoint()
    }
    
    func startAnimation() {
        displayLink.isPaused = false
        animateControlPoints()
    }
    
    private func setupComponents() {
        addSubviews(
            topControlPointView,
            leftControlPointView,
            rightControlPointView,
            bottomControlPointView
        )
        setupElasticShape()
    }
    
    private func setupElasticShape() {
        elasticShape.fillColor = UIColor.white.cgColor
        elasticShape.path = UIBezierPath(rect: bounds).cgPath
        layer.addSublayer(elasticShape)
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            addSubview(subview)
            subview.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
            subview.backgroundColor = .clear
        }
    }
    
    private func positionControlPoint() {
        topControlPointView.center = CGPoint(x: bounds.midX, y: 0)
        leftControlPointView.center = CGPoint(x: 0, y: bounds.midY)
        rightControlPointView.center = CGPoint(x: bounds.maxX, y: bounds.midY)
        bottomControlPointView.center = CGPoint(x: bounds.midX, y: bounds.maxY)
    }
    
    private func bezierPathForControlPoints() -> CGPath {
        let bezierPath = UIBezierPath()
        
        if let top = topControlPointView.layer.presentation()?.position,
           let left = leftControlPointView.layer.presentation()?.position,
           let rigth = rightControlPointView.layer.presentation()?.position,
           let bot = bottomControlPointView.layer.presentation()?.position {
            
            let width = frame.width
            let height = frame.height
            
            bezierPath.move(to: CGPointMake(0, 0))
            bezierPath.addQuadCurve(to:  CGPointMake(width, 0), controlPoint: top)
            bezierPath.addQuadCurve(to:  CGPointMake(0, 0), controlPoint: left)
            bezierPath.addQuadCurve(to:  CGPointMake(width, height), controlPoint: rigth)
            bezierPath.addQuadCurve(to:  CGPointMake(0, height), controlPoint: bot)
        }
        
        return bezierPath.cgPath
    }
    
    @objc private func updateLoop() {
        elasticShape.path = bezierPathForControlPoints()
    }
    
    private func animateControlPoints() {
        let overshootAmount: CGFloat = 15
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 3.5) {
            self.topControlPointView.center.y -= overshootAmount
            self.leftControlPointView.center.x -= overshootAmount
            self.bottomControlPointView.center.y +=  overshootAmount
            self.rightControlPointView.center.x += overshootAmount
        } completion: { _ in
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 4.5) {
                self.positionControlPoint()
            } completion: { _ in
                self.displayLink.isPaused = true
            }
        }
    }
}
