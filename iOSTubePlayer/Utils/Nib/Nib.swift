//
//  Vib.swift
//  iOSTubePlayer
//
//  Created by HanSJin on 9/15/19.
//  Copyright © 2019 한승진. All rights reserved.
//

import UIKit

protocol Nib {
    func loadNib()
}

extension Nib where Self: UIView {
    
    func loadNib() {
        guard let nibName = type(of: self).description().components(separatedBy: ".").last else {
            return
        }
        print(nibName)
        #if !TARGET_INTERFACE_BUILDER
        let bundle = Bundle(for: type(of: self))
        guard let _ = bundle.path(forResource: nibName, ofType: "nib") else {
            fatalError("can't find \(nibName) xib resource in current bundle")
        }
        #endif
        
        guard let view = Bundle(for: type(of: self)).loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {
            return
        }
        frame = view.bounds
        addSubview(view)
    }
}
