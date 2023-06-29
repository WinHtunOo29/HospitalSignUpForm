//
//  BtnCell.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import UIKit

class BtnCell: UITableViewCell {
    @IBOutlet weak var btnSubmit: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
        let loginInfo = LoginController.LoginInfo(email: FormData.temporaryData["Email"] as! String, password: FormData.temporaryData["Password"] as! String)
        
        LoginController.login(loginInfo).onProgress { progress in
            print("---")
        }.onError { error in
            print("---Error---", error)
        }.onSuccess { loginDataInfo in
            print("---Success---", loginDataInfo)
        }.onNotAuthorized {
            print("---Somethin Wrong---")
        }
    }
}
