//
//  ASMultiAppsView.swift
//  ASMultiAppsView
//
//  Created by Lakr Aream on 2019/5/18.
//  Copyright © 2019 Lakr Aream. All rights reserved.
//

import UIKit
import SnapKit

public class ASMultiAppsView: UIView {
    
    public struct ASMultiAppsViewConfig {
        public var imageGap             = CGFloat(12)
        public var imageSize            = CGSize(width: 66, height: 66)
        public var shouldAnimate        = true
        public var imageAngle           = CGFloat(-23.33)
        public var imageRadius          = CGFloat(8)
        public var cardWidth            = CGFloat(466)
        public var cardHeight           = CGFloat(233)
        
        public init() {}

    }
    
    // Sets
    private(set) var imageContainer       = [UIImage]()
    private(set) var contentView          = UIView()
    private(set) var angleWrapper         = UIView()
    private(set) var config: ASMultiAppsViewConfig
    
    public required init?(coder: NSCoder) {
        fatalError("ASMultiAppsView does not allow NSCoder init, use init(withCongif:) instead.")
    }
    
    public required init(with _config: ASMultiAppsViewConfig) {
        config = _config
        super.init(frame: CGRect())    
        NotificationCenter.default.addObserver(self, selector:#selector(bootStrap), name: .UIApplicationDidBecomeActive, object: nil)
        
        angleWrapper.clipsToBounds = true
        addSubview(angleWrapper)
        angleWrapper.snp.makeConstraints { (x) in
            x.edges.equalTo(self.snp.edges)
        }
        angleWrapper.addSubview(contentView)
        contentView.snp.makeConstraints { (x) in
            x.edges.equalTo(angleWrapper)
        }
        setRotation(angle: config.imageAngle)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func setImages(images: [UIImage]) {
        imageContainer = images
        bootStrap()
    }
    
    public func setRotation(angle: CGFloat) {
        contentView.transform = CGAffineTransform(rotationAngle: -90 + angle)
    }
    
    public func getConfig() -> ASMultiAppsViewConfig {
        return config
    }
    
    @objc
    func viewSaboteur() {
        for item in contentView.subviews {
            item.removeFromSuperview()
        }
    }
    
    @objc
    func bootStrap() {
        DispatchQueue.main.async {
            self.viewConstructor()
        }
    }
    
    private func viewConstructor() {
        
        viewSaboteur()
        
        if imageContainer.count < 1 {
            return
        }
        
        // 计算一行的View个数
        let itemPerLine = Int(bounds.width / (config.imageSize.width + config.imageGap)) + 3
        // 计算行数
        var lineMax = Int(bounds.height / (config.imageSize.height + config.imageGap)) + 1
        
        if config.imageAngle != 0 {
            lineMax += 3
            contentView.snp.remakeConstraints { (x) in
                x.top.equalTo(angleWrapper.snp.top).offset(-128)
                x.left.equalTo(angleWrapper.snp.left)
                x.right.equalTo(angleWrapper.snp.right)
                x.bottom.equalTo(angleWrapper.snp.bottom).offset(128)
            }
        } else {
            contentView.snp.remakeConstraints { (x) in
                x.edges.equalTo(angleWrapper)
            }
        }
        
        for locationY in 1...lineMax {
            // 计算一行有几个东西
            let numberOfItemsPerLine = CGFloat(locationY - 1)
                                        * (config.imageSize.height + config.imageGap)
                                        + config.imageSize.height / 2
            // 计算行尾部位置
            var bottomPositionOfLine = CGFloat(itemPerLine - 1)
                                        * (config.imageSize.width + config.imageGap)
                                        + config.imageSize.width / 2
            // 隔行处理
            if locationY % 2 == 1 {
                bottomPositionOfLine -= config.imageSize.width / 2
            }
            for itemIndex in 1...itemPerLine {
                // 获取图像，先计算index
                let index = Int((locationY * 2 + itemIndex) % imageContainer.count)
                let image = imageContainer[index]
                // 计算位置
                var locationX = CGFloat(itemIndex - 1)
                                * (config.imageSize.width + config.imageGap)
                                + config.imageSize.width / 2
                if locationY % 2 == 1 {
                    locationX -= config.imageSize.width / 2
                }
                let centerAnchor = CGPoint(x: locationX, y: numberOfItemsPerLine)
                let imageView = UIImageView()
                imageView.center = centerAnchor
                imageView.bounds.size = config.imageSize
                imageView.image = image
                imageView.contentMode = .scaleAspectFill
                imageView.layer.cornerRadius = config.imageRadius;
                imageView.layer.masksToBounds = true;
                contentView.addSubview(imageView)
                
                if config.shouldAnimate {
                    bootStrapAnimation(itemIndex: itemIndex, target: imageView, loopInfo: (bottomPositionOfLine, itemPerLine))
                }
            }
        }
        
    }
    
    private func bootStrapAnimation(itemIndex: Int, target: UIView, loopInfo: (CGFloat, Int)) {
        let opts: UIView.AnimationOptions = [.curveLinear]
        UIView.animate(withDuration: TimeInterval(Double(itemIndex) * 6.66), delay: 0, options: opts, animations: {
            target.center.x = target.center.x - CGFloat(itemIndex) * (self.config.imageSize.width + self.config.imageGap)
        }, completion: { _ in
            let endx = target.center.x
            target.center.x = loopInfo.0
            self.loopAnimationX(beginAt: loopInfo.0, endsAt: endx, target: target, offset: loopInfo.1)
        })
    }
    
    private func loopAnimationX(beginAt: CGFloat, endsAt: CGFloat, target: UIView, offset: Int) {
        let opts: UIView.AnimationOptions = [.curveLinear, .repeat, ]
        UIView.animate(withDuration: TimeInterval(Double(offset) * 6.66), delay: 0, options: opts, animations: {
            target.center.x = endsAt
        })
    }
    
}
