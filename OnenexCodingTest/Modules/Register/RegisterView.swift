//
//  RegisterView.swift
//  Register
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation
import UIKit

final class RegisterView: UIViewController, ViewInterface {
    
    @IBOutlet weak var tbFormField: UITableView!

    var presenter: RegisterPresenterViewInterface!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.start()
        configureUI()
    }

}

extension RegisterView: RegisterViewPresenterInterface {
    func configureUI() {
        tbFormField.delegate = self
        tbFormField.dataSource = self
        tbFormField.register(UINib.init(nibName: "EmailCell", bundle: nil), forCellReuseIdentifier: "EmailCell")
        tbFormField.register(UINib.init(nibName: "BirthDateCell", bundle: nil), forCellReuseIdentifier: "BirthDateCell")
        tbFormField.register(UINib.init(nibName: "PickerCell", bundle: nil), forCellReuseIdentifier: "PickerCell")
        tbFormField.register(UINib.init(nibName: "IdCell", bundle: nil), forCellReuseIdentifier: "IdCell")
        tbFormField.register(UINib.init(nibName: "BtnCell", bundle: nil), forCellReuseIdentifier: "BtnCell")
        tbFormField.register(UINib.init(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
        tbFormField.separatorStyle = .none
        tbFormField.reloadData()
    }
}

extension RegisterView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmailCell", for: indexPath) as! EmailCell
            cell.selectionStyle = .none
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BirthDateCell", for: indexPath) as! BirthDateCell
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as! PickerCell
            cell.lbPicker.text = "Gender"
            cell.list = ["Male", "Female"]
            cell.setData(multipleSelect: 1)
            cell.selectionStyle = .none
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as! PickerCell
            cell.lbPicker.text = "ID Type"
            cell.list = ["NRC", "Passport"]
            cell.setData(multipleSelect: 1)
            cell.selectionStyle = .none
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IdCell", for: indexPath) as! IdCell
            cell.selectionStyle = .none
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BtnCell", for: indexPath) as! BtnCell
            cell.btnSubmit.setTitle("Continue", for: .normal)
            cell.selectionStyle = .none
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
            cell.setData(loginText: StringConstants.logInText, login: StringConstants.login)
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
