//
//  UIResponder+Ext.swift
//  tip-calculator
//
//  Created by Rahul Nimje on 19/03/23.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
