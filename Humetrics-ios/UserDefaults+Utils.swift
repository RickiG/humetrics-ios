//
//  UserDefaults+Utils.swift
//  CoreMotionCoreDataPoC
//
//  Created by Ricki Gregersen on 12/01/2017.
//  Copyright © 2017 cinteo.com. All rights reserved.
//

import Foundation

extension UserDefaults {

	class func save(value: Any?, forKey key: String) {
		UserDefaults.defaults().set(value, forKey: UserDefaults.prefixedKey(forKey: key))
		UserDefaults.synchronize()
	}

	class func remove(valueForKey key: String) {
		UserDefaults.defaults().removeObject(forKey: UserDefaults.prefixedKey(forKey: key))
		UserDefaults.defaults().synchronize()
	}

	class func retrieve(forKey key: String) -> Any? {
		return UserDefaults.defaults().value(forKey: UserDefaults.prefixedKey(forKey: key))
	}

	fileprivate class func defaults() ->UserDefaults {
		return UserDefaults.standard
	}

	fileprivate class func synchronize() {
		UserDefaults.defaults().synchronize()
	}

	fileprivate class func prefix() -> String {
		if let identifier = Bundle.main.bundleIdentifier {
			return identifier
		}
		return "unique.random.com"
	}

	fileprivate class func prefixedKey(forKey key: String) ->String {
		return "\(UserDefaults.prefix()).\(key))"
	}

	open class func resetDefaults() {

		let prefix = UserDefaults.prefix()

		for (key, _) in UserDefaults.defaults().dictionaryRepresentation() {
			if key.hasPrefix(prefix) {
				UserDefaults.defaults().removeObject(forKey: key)
			}
		}

		UserDefaults.synchronize()
	}
}
