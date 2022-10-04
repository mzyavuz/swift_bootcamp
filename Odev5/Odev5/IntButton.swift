//
//  IntButton.swift
//  Odev5
//
//  Created by M.Zeynep Cakmakci on 3.10.2022.
//

import Foundation
import UIKit

@IBDesignable
final class IntButton: UIButton {
    
    //var borderWidth = 1.0
    //var borderColor = UIColor.lightGray.cgColor
    //var cornerRadius = 18.0
    //var masksToBounds = true
    
    @IBInspectable var borderColor: UIColor = UIColor.lightGray {
            didSet {
                layer.borderColor = borderColor.cgColor
            }
        }

        @IBInspectable var borderWidth: CGFloat = 1.0 {
            didSet {
                layer.borderWidth = borderWidth
            }
        }

        @IBInspectable var cornerRadius: CGFloat = 18.0 {
            didSet {
                layer.cornerRadius = cornerRadius
            }
        }
    
}
