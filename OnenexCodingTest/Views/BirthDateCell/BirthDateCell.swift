//
//  BirthDateCell.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import UIKit
import DatePicker

class BirthDateCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var lbBirthDate: UILabel!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var btnCalendar: UIButton!
    
    let calendar = Calendar(identifier: .gregorian)
    var components = DateComponents()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        txtBirthDate.delegate = self
        
        let birthDateText = UITapGestureRecognizer(target: self, action: #selector(self.selectDate))
        let birthDateBtn = UITapGestureRecognizer(target: self, action: #selector(self.selectDate))
        btnCalendar.addGestureRecognizer(birthDateText)
        txtBirthDate.addGestureRecognizer(birthDateBtn)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func selectDate(textField: UITextField) {
        let today = Date()
        components.calendar = calendar
        let calculateMaxDate = Calendar.current.date(byAdding: .year, value: -18, to: today)
        let calculateMinDate = Calendar.current.date(byAdding: .year, value: -99, to: today)
        let minDate = calculateMinDate ?? today
        let maxDate = calculateMaxDate ?? today

        // Create picker object
        let datePicker = DatePicker()
        // Setup
        datePicker.setup(beginWith: maxDate, min: minDate, max: maxDate) { (selected, date) in
            if selected, let selectedDate = date {
                let selected = selectedDate.string().split(separator: " ")
                let day = selected[1].trimmingCharacters(in: NSCharacterSet(charactersIn: ",") as CharacterSet)
                
                self.txtBirthDate.text = String(selected[2]) + "-" + String(selected[0]) + "-" + day
            }
        }
        // Display
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            datePicker.show(in: parentViewController!, on: txtBirthDate)
        default:
            break
        }
        datePicker.show(in: parentViewController!)
    }
}
