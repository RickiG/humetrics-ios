//
//  ViewController.swift
//  Humetrics-ios
//
//  Created by Ricki Gregersen on 25/01/2017.
//  Copyright © 2017 rickigregersen.com. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		evaluateState()
	}

	func evaluateState() {
		if let userName = UserDefaults.retrieve(forKey: "user_name") as? String {
			performSegue(withIdentifier: "MetricSegue", sender: userName)
		} else {
			performSegue(withIdentifier: "LoginSegue", sender: nil)
		}
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.destination {
		case let vc as LoginViewController:
			vc.onLoginComplete = { [weak self] userName in
				guard let s = self else { return }
				s.dismiss(animated: true) {
					s.performSegue(withIdentifier: "MetricSegue", sender: userName)
				}
			}
			
		case let vc as MetricViewController:
			guard let userName = sender as? String else { return }
			vc.userName = userName

		default:
			()
		}
	}
}

