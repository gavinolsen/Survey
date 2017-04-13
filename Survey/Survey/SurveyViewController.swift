//
//  SurveyViewController.swift
//  Survey
//
//  Created by Gavin Olsen on 4/13/17.
//  Copyright © 2017 Gavin Olsen. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var langTextField: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        
        guard let name = nameTextfield.text, let language = langTextField.text, !name.isEmpty, !language.isEmpty else { return }
        SurveyController.putSurvey(name: name, language: language)
        nameTextfield.text = ""
        langTextField.text = ""
    }
}
