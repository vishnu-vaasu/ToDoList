//
//  ListShowCell.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit
protocol SelectCheckBoxDetails {
    func checkboxList(at position: Int)
}

class ListShowCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    var delegate: SelectCheckBoxDetails?
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyles()
    }
    
    //MARK: Apply styles UI
    func applyStyles() {
        titleLbl.textColor = AppConstants.APP_THEME_TEXT_COLOR
        titleLbl.font = FontLoader.boldFont(with: 16.0)
        
        descriptionLbl.textColor = AppConstants.APP_THEME_TEXT_COLOR
        descriptionLbl.font = FontLoader.regularFont(with: 14.0)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Configure Cell with TODO Details
    func configureCell(details: ToDo?) {
        if let todoDetails = details {
            titleLbl.text = todoDetails.title
            descriptionLbl.text = todoDetails.description
            contentView.backgroundColor = todoDetails.selected ? UIColor.lightGray : UIColor.white
            let imageName = todoDetails.selected ? "check" : "unCheck"
            checkBtn.setImage(UIImage.init(named: imageName), for: .normal)
            let userInteraction = todoDetails.selected ? false : true
            checkBtn.isUserInteractionEnabled = userInteraction
        }
    }
    
    //MARK: Select Checkbox
    @IBAction func selectListCheck(_ sender: UIButton) {
        self.delegate?.checkboxList(at: tag)
    }
}
