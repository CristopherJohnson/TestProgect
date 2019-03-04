//
//  CustomProgressBar.swift
//  testProgect
//
//  Created by Алексей Казаков on 04/03/2019.
//  Copyright © 2019 Алексей Казаков. All rights reserved.
//

import UIKit

 class CustomProgressBar: UIView {

    private weak var progressView: UIView?
    
    public var registrationProgress: CGFloat = 0.5  /*{
        willSet {
            if newValue > 1 {
                print("registrationProgress mast have values 0...1")
                newValue = self.registrationProgress
            }
        }
    } */
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
        self.setAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addSubviews()
        self.setAppearance()
    }
    
    // MARK: - Appearance
    
    private func setAppearance () {
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.blue.cgColor
        self.progressView?.backgroundColor = UIColor.blue
        
    }
    
    private func addSubviews () {
        if self.progressView != nil {
            return
        }
        let progressView = UIView()
        self.addSubview(progressView)
        self.progressView = progressView
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = true
        
        self.progressView?.frame = CGRect(x: 0,
                                          y: 0,
                                          width: (self.frame.size.width * self.registrationProgress),
                                          height: self.frame.size.height)
        self.progressView?.layer.cornerRadius = self.frame.size.height / 2
        self.progressView?.layer.masksToBounds = true
    }
}
