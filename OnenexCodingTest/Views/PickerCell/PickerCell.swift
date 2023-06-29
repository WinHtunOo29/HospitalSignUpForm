//
//  PickerCell.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import UIKit
import UIMultiPicker

class PickerCell: UITableViewCell {

    @IBOutlet weak var mtlPicker: UIMultiPicker!
    @IBOutlet weak var lbPicker: UILabel!
    
    var list = [String]()
    var multipleSelect: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func selected(_ sender: UIMultiPicker) {
        if mtlPicker.selectedIndexes.count > multipleSelect ?? 1 {
            mtlPicker.selectedIndexes.removeFirst()
        }
        
        if mtlPicker.selectedIndexes.isEmpty {
            FormData.temporaryData.removeValue(forKey: self.lbPicker.text!)
        } else {
            FormData.temporaryData[self.lbPicker.text!] = list[mtlPicker.selectedIndexes.first!]
        }
    }
    
    func setData(multipleSelect: Int) {
        mtlPicker.selectedIndexes = []
        self.multipleSelect = multipleSelect
        
        mtlPicker.options = list
        
        // Styling
        mtlPicker.color = .black
        mtlPicker.tintColor = .blue
        mtlPicker.font = .systemFont(ofSize: 18, weight: .regular)

        // Add selection listener
        mtlPicker.addTarget(self, action: #selector(selected(_:)), for: .valueChanged)
        mtlPicker.highlight(mtlPicker.selectedIndexes.last ?? 0, animated: true)
    }
    
}
