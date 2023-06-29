//
//  LoginView.swift
//  Login
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation
import UIKit

final class LoginView: UIViewController, ViewInterface {

    @IBOutlet weak var uvGroupBtn: UIView!
    @IBOutlet weak var btnPhone: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var tbFormField: UITableView!
    
    var presenter: LoginPresenterViewInterface!
    
    var btnStatus = true

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.start()
        configureUI()
    }
    
    @IBAction func btnPhone(_ sender: Any) {
        btnStatus = true
        FormData.temporaryData = [:]
        btnState()
    }

    @IBAction func btnEmail(_ sender: Any) {
        btnStatus = false
        FormData.temporaryData = [:]
        btnState()
    }
    
    
}

extension LoginView: LoginViewPresenterInterface {
    func configureUI() {
        uvGroupBtn.layer.borderWidth = 1
        uvGroupBtn.layer.borderColor = UIColor.darkGray.cgColor
        uvGroupBtn.layer.cornerRadius = uvGroupBtn.frame.height/2
        btnPhone.layer.cornerRadius = btnPhone.frame.height/2
        btnEmail.layer.cornerRadius = btnEmail.frame.height/2
        btnState()
        
        tbFormField.delegate = self
        tbFormField.dataSource = self
        tbFormField.register(UINib.init(nibName: "PhoneCell", bundle: nil), forCellReuseIdentifier: "PhoneCell")
        tbFormField.register(UINib.init(nibName: "PasswordCell", bundle: nil), forCellReuseIdentifier: "PasswordCell")
        tbFormField.register(UINib.init(nibName: "EmailCell", bundle: nil), forCellReuseIdentifier: "EmailCell")
        tbFormField.register(UINib.init(nibName: "IdCell", bundle: nil), forCellReuseIdentifier: "IdCell")
        tbFormField.register(UINib.init(nibName: "BtnCell", bundle: nil), forCellReuseIdentifier: "BtnCell")
        tbFormField.register(UINib.init(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
        tbFormField.separatorStyle = .none
        tbFormField.reloadData()
    }
    
    func btnState() {
        if btnStatus {
            btnEmail.backgroundColor = UIColor.white
            btnEmail.titleLabel?.textColor = UIColor.darkGray
            
            btnPhone.backgroundColor = UIColor.link
            btnPhone.titleLabel?.textColor = UIColor.white
            
            tbFormField.reloadData()
        } else {
            btnPhone.backgroundColor = UIColor.white
            btnPhone.titleLabel?.textColor = UIColor.darkGray
            
            btnEmail.backgroundColor = UIColor.link
            btnEmail.titleLabel?.textColor = UIColor.white
            
            tbFormField.reloadData()
        }
    }
}

extension LoginView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.row {
            case 0:
                if btnStatus {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as! PhoneCell
                    cell.selectionStyle = .none
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "EmailCell", for: indexPath) as! EmailCell
                    cell.selectionStyle = .none
                    return cell
                }
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PasswordCell", for: indexPath) as! PasswordCell
                cell.selectionStyle = .none
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BtnCell", for: indexPath) as! BtnCell
                cell.btnSubmit.setTitle("Login", for: .normal)
                cell.selectionStyle = .none
                return cell
                
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
                cell.setData(loginText: StringConstants.registerText, login: StringConstants.register)
                cell.selectionStyle = .none
                return cell
                
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmailCell", for: indexPath) as! EmailCell
                cell.selectionStyle = .none
                return cell
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
