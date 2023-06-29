//
//  TextCell.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import UIKit

class TextCell: UITableViewCell {
    @IBOutlet weak var lbText: UILabel!
    
    var login: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(loginText: String, login: String) {
        lbText.text = loginText
        self.login = login
        
        labelTermsAndConditions()
    }
    
    func labelTermsAndConditions() {
        lbText.textColor = UIColor.black
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        if let loginText = lbText.text {
            let underlineString = NSMutableAttributedString(string: loginText)
            let rangeOne = (loginText as NSString).range(of: login ?? "")
            underlineString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeOne)
            underlineString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: rangeOne)
            underlineString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, underlineString.length))
            
            lbText.attributedText = underlineString
            lbText.isUserInteractionEnabled = true
            lbText.textAlignment = .center
            lbText.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLabel(gesture:))))
        }
    }
    
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        let termsRange = (lbText.text! as NSString).range(of: self.login ?? "")
        
        if gesture.didTapAttributedTextInLabel(label: lbText, inRange: termsRange) {
            if lbText.text == StringConstants.logInText {
                let view = LoginModule().build()
                view.modalPresentationStyle = .fullScreen
                parentViewController?.present(view, animated: true)
            } else {
                let view = RegisterModule().build()
                view.modalPresentationStyle = .fullScreen
                parentViewController?.present(view, animated: true)
            }
        }
    }
}
