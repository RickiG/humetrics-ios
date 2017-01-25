//
//  LoginViewController.swift
//  Humetrics-ios
//
//  Created by Ricki Gregersen on 25/01/2017.
//  Copyright © 2017 rickigregersen.com. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	var onLoginComplete: (String) -> () = { _ in }

	@IBOutlet weak private var inputField: UITextField!
	@IBOutlet weak var okButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
		okButton.isEnabled = false
    }

	@IBAction func inputFieldHandler(_ sender: UITextField) {
		guard let text = sender.text else { return }
		okButton.isEnabled = text.characters.count > 0
	}

	@IBAction func okButtonHandler(_ sender: Any) {
		guard let text = inputField.text else { return }
		UserDefaults.save(value: text, forKey: "user_name")
		onLoginComplete(text)
	}
}
