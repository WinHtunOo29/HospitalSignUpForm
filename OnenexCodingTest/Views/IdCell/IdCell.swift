//
//  IdCell.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import UIKit

class IdCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var lbId: UILabel!
    @IBOutlet weak var txtNrcNo: UITextField!
    @IBOutlet weak var pikNrcRegion: UIPickerView!
    @IBOutlet weak var pikNrcTownship: UIPickerView!
    @IBOutlet weak var pikNrcType: UIPickerView!

    var nrcNum: String!
    var state: String!
    var township: String!
    var nrcType: String!
    var stateCode: Int!
    var townshipRow = 0
    var regionData: [String] = [String]()
    var stateData: [String] = [String]()
    var stateKey: [Int] = [Int]()
    var townshipData: [String] = [String]()
    var townshipDictionary: [Int: [String]] = NrcData.townshipData
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtNrcNo.delegate = self

        self.pikNrcRegion.delegate = self
        self.pikNrcRegion.dataSource = self
        
        self.pikNrcTownship.delegate = self
        self.pikNrcTownship.dataSource = self
        
        self.pikNrcType.delegate = self
        self.pikNrcType.dataSource = self
        
        regionData = NrcData.citizenData
        
        stateKey = Array(townshipDictionary.keys)
        stateCode = 0
        townshipData = townshipDictionary[stateCode]!
        
        stateData = NrcData.stateData
        
        state = stateData[0]
        nrcType = regionData[0]
        township = townshipData[0]
        txtNrcNo.keyboardType = .numberPad
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nrcCheck(id: textField.text ?? "", textField: textField)
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        switch pickerView.tag {
        case 0: count = stateData.count
        case 1: count = townshipData.count
        case 2: count = regionData.count
        default: break
        }
        return count
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var nrc: String!
        switch pickerView.tag {
        case 0: nrc = stateData[row]
        case 1: nrc = townshipData[row]
        case 2: nrc = regionData[row]
        default: break
        }
        return nrc
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 0:
            townshipRow = row
            townshipData = townshipDictionary[townshipRow]!
            pikNrcTownship.selectRow(0, inComponent: 0, animated: true)
            self.pikNrcTownship.reloadAllComponents()
            state = stateData[row]
        case 1:
            township = townshipData[row]
        case 2:
            nrcType = regionData[row]
        default:
            break
        }
        let data = "\(state ?? "")/\(township ?? "")(\(nrcType ?? ""))\(txtNrcNo.text ?? "")"
        FormData.temporaryData[self.lbId.text!] = data
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        if let view = view as? UILabel { label = view } else { label = UILabel() }
        
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        switch pickerView.tag {
        case 0:
            label.text = stateData[row]
        case 1:
            label.text = townshipData[row]
        case 2:
            label.text = regionData[row]
        default:
            break
        }
        return label
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
            let maxLength = 6
            let currentString: NSString = txtNrcNo.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
    }
    
    func nrcCheck(id: String, textField: UITextField) {
        let nrcCheck = Validator.nrcCheck(id: id)
        if nrcCheck.passed {
            let data = "\(state ?? "")/\(township ?? "")(\(nrcType ?? ""))\(textField.text ?? "")"
            FormData.temporaryData[self.lbId.text!] = data
        } else {
            FormData.temporaryData.removeValue(forKey: self.lbId.text!)
            print(nrcCheck.reason)
        }
    }
}
