//
//  AddTodoController.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
class AddTodoController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var descriptionTV: UITextView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Todo's"
        applyStyles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    //MARK: Apply styles to UI
    func applyStyles() {
        titleLbl.textColor = AppConstants.APP_THEME_TEXT_COLOR
        titleLbl.font = FontLoader.mediumFont(with: 16)
        
        descriptionLbl.textColor = AppConstants.APP_THEME_TEXT_COLOR
        descriptionLbl.font = FontLoader.mediumFont(with: 16)
        
        titleTF.textColor = AppConstants.APP_THEME_TEXT_COLOR
        titleTF.font = FontLoader.mediumFont(with: 16)
        titleTF.placeholder = "Please Enter Title"
        titleTF.delegate = self
        
        descriptionTV.textColor = AppConstants.APP_THEME_TEXT_COLOR
        descriptionTV.font = FontLoader.mediumFont(with: 16)
        descriptionTV.layer.cornerRadius = 5.0
        descriptionTV.layer.borderWidth = 0.5
        descriptionTV.layer.borderColor = UIColor.lightGray.cgColor
        
        cancelBtn.applyStyles(text: "Cancel",
                              textColor: UIColor.white,
                              backgroundColor: AppConstants.APP_THEME_Cancel_COLOR,
                              font: FontLoader.mediumFont(with: 16))
        
        submitBtn.applyStyles(text: "Submit",
                              textColor: UIColor.white,
                              backgroundColor: AppConstants.APP_THEME_Submit_COLOR,
                              font: FontLoader.mediumFont(with: 16))
        cancelBtn.updateLayerProperties()
        submitBtn.updateLayerProperties()
        
    }
    
    //MARK: Cancel Button Handler
    @IBAction func cancelAction(_ sender: UIButton) {
        self.titleTF.text = ""
        self.descriptionTV.text = ""
    }
    
    //MARK: Submit Button Handler
    @IBAction func submitAction(_ sender: UIButton) {
        if validateFields() {
            // Here, Instead of saving in PList we can also save in core data, but for todo's as it's a small info I'm saving in PList
            let todoValue = ToDo(title: titleTF.text ?? "", description: descriptionTV.text)
            SharedResources.sharedResources.todoDetails.append(todoValue)
            do {
                try PropertyListEncoder().encode(SharedResources.sharedResources.todoDetails).write(to: AppConstants.plistURL)
                self.navigationController?.popViewController(animated: true)
            } catch {
                print(error)
                self.showAlert(with: error.localizedDescription)
            }
        }
   }
    
    //MARK: Validate Textfields and Filter
    func validateFields() -> Bool {
        guard let titleText = titleTF.text, !titleText.isEmpty else {
            self.showAlert(with: "Please enter title")
            return false
        }
        guard let descriptionText = descriptionTV.text, !descriptionText.isEmpty else {
            self.showAlert(with: "Please enter description")
            return false
        }
        
        let filterTitle = SharedResources.sharedResources.todoDetails.filter { (todo) -> Bool in
            return todo.title == titleText
        }
        
        if !filterTitle.isEmpty {
            self.showAlert(with: "Tilte already exists")
            return false
        }
        
        return true
    }
    
    
    //MARK: Show Alert
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension AddTodoController: UITextFieldDelegate {
    //MARK: TextField Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        if text.starts(with: " ") || (text.isEmpty && string.starts(with: " ")) {
            return false
        }
        return true
    }
}
