//
//  PhoneCell.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import UIKit

class PhoneCell: UITableViewCell, UITextFieldDelegate{

    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var uvView: UIView!
    @IBOutlet weak var txtPhoneField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtPhoneField.delegate = self
        uvView.layer.borderColor = UIColor.darkGray.cgColor
        uvView.layer.borderWidth = 1
        uvView.layer.cornerRadius = 10
        txtPhoneField.layer.borderColor = UIColor.white.cgColor
        txtPhoneField.layer.borderWidth = 0
        txtPhoneField.keyboardType = .numberPad
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (textField.text?.isEmpty)! {
            FormData.temporaryData.removeValue(forKey: self.lbPhone.text!)
        } else {
            FormData.temporaryData[self.lbPhone.text!] = textField.text
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.isEmpty)! {
            FormData.temporaryData.removeValue(forKey: self.lbPhone.text!)
        } else {
            FormData.temporaryData[self.lbPhone.text!] = textField.text
        }
    }
}
