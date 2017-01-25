//
//  MetricViewController.swift
//  Humetrics-ios
//
//  Created by Ricki Gregersen on 25/01/2017.
//  Copyright © 2017 rickigregersen.com. All rights reserved.
//

import UIKit

class MetricViewController: UIViewController {

	var userName: String = "unknown"

	@IBOutlet weak private var labelOne: UILabel!
	@IBOutlet weak private var labelTwo: UILabel!
	@IBOutlet weak private var labelThree: UILabel!
	@IBOutlet weak private var labelFour: UILabel!

	@IBOutlet weak var sliderOne: UISlider!
	@IBOutlet weak var sliderTwo: UISlider!
	@IBOutlet weak var sliderThree: UISlider!
	@IBOutlet weak var sliderFour: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
		setupViews()
    }

	func setupViews() {
		labelOne.text = "General Feeling"
		labelTwo.text = "Colleagues"
		labelThree.text = "Customers"
		labelFour.text = "Boss"

		sliderOne.value = 1.0
		sliderTwo.value = 0.0
		sliderThree.value = 1.0
		sliderFour.value = 0.0

		sliderOne.tag = 1
		sliderTwo.tag = 2
		sliderThree.tag = 3
		sliderFour.tag = 4
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		sliderOne.setValue(0.5, animated: true)
		sliderTwo.setValue(0.5, animated: true)
		sliderThree.setValue(0.5, animated: true)
		sliderFour.setValue(0.5, animated: true)
	}

	@IBAction func sliderChangedHandler(_ sender: UISlider) {
		switch sender.tag {
		case 1:
			()
		case 2:
			()
		case 3:
			()
		case 4:
			()
		default:
			()
		}

		print("slider: \(sender.tag) value: \(sender.value)")
	}
}
