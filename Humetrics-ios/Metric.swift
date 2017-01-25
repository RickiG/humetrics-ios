//
//  Metric.swift
//  Humetrics-ios
//
//  Created by Ricki Gregersen on 25/01/2017.
//  Copyright © 2017 rickigregersen.com. All rights reserved.
//

import Foundation

struct Metric {

	let sender: String
	let metric: String
	let value: Float
	let timestamp: Date
}

extension Metric {

	init?(json: JSONDictionary) {
		guard let sender = json["sender"] as? String else { return nil }
		guard let metric = json["metric"] as? String else { return nil }
		guard let value = json["value"] as? Float else { return nil }

		self.sender = sender
		self.metric = metric
		self.value = value
		self.timestamp = Date()
	}
}

extension Metric {

	func post() {

	}

}
