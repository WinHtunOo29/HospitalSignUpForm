//
//  PasswordCell.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import UIKit

class PasswordCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var lbPassword: UILabel!
    @IBOutlet weak var txtPasswordField: UITextField!
    @IBOutlet weak var btnShowHidePassword: UIButton!
    
    var showHidePassword = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtPasswordField.delegate = self
        txtPasswordField.isSecureTextEntry = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnShowHidePassword(_ sender: Any) {
        if showHidePassword {
                txtPasswordField.isSecureTextEntry = false
            } else {
                txtPasswordField.isSecureTextEntry = true
            }
            showHidePassword = !showHidePassword
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (textField.text?.isEmpty)! {
            FormData.temporaryData.removeValue(forKey: self.lbPassword.text!)
        } else {
            FormData.temporaryData[self.lbPassword.text!] = textField.text
        }
    }
 
    func textFieldDidEndEditing(_ textField: UITextField) {
        passwordCheck(password: textField.text ?? "", textField: textField)
    }
    
    func passwordCheck(password: String, textField: UITextField) {
        let passwordCheck = Validator.passwordCheck(password: password)
        if passwordCheck.passed {
            FormData.temporaryData[self.lbPassword.text!] = textField.text
        } else {
            FormData.temporaryData.removeValue(forKey: self.lbPassword.text!)
            print(passwordCheck.reason)
        }
    }
}
