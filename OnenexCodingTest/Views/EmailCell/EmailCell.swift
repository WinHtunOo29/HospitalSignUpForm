//
//  EmailCell.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import UIKit

class EmailCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var lbLabel: UILabel!
    @IBOutlet weak var txtEmailField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtEmailField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (textField.text?.isEmpty)! {
            FormData.temporaryData.removeValue(forKey: self.lbLabel.text!)
        } else {
            FormData.temporaryData[self.lbLabel.text!] = textField.text
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        emailCheck(email: textField.text ?? "", textField: textField)
    }
    
    func emailCheck(email: String, textField: UITextField) {
        let emailCheck = Validator.emailCheck(email: email)
        if emailCheck.passed {
            FormData.temporaryData[self.lbLabel.text!] = textField.text
        } else {
            FormData.temporaryData.removeValue(forKey: self.lbLabel.text!)
            print(emailCheck.reason)
        }
    }
}
