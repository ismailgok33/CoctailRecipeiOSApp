//
//  DynamicTextViewSize.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 28.03.2022.
//

import UIKit

class DynamicTextViewSize {
    
    static func height(text: String?, font: UIFont, width: CGFloat) -> CGFloat {
        
        var currentHeight: CGFloat!
        
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        textView.text = text
        textView.font = font
        textView.sizeToFit()
        
        currentHeight = textView.frame.height
        
        return currentHeight
    }
}
