//
//  APIConfiguration.swift
//  NetworkPoC
//
//  Created by Ricki Gregersen on 22/09/16.
//  Copyright © 2016 youandthegang.com. All rights reserved.
//

import Foundation

enum PETAAPI {

	case feed
	case categories
	case itemsFromQuery(query: String)
	case itemsFromTag(tag: String)

	var baseURL: URL {
		return URL(string: "https://petazwei.herokuapp.com/api/")!
//		return URL(string: "https://peta2-yatg-staging.herokuapp.com/api/")!
	}

	var path: String {
		switch self {
		case .feed:
			return "feed"
		case .categories:
			return "categories"
		case .itemsFromTag, .itemsFromQuery:
			return "search"
		}
	}

	var request: URLRequest {

		let endpointURL = baseURL.appendingPathComponent(path)

		// Quite a few '!' in here... is it a problem? can it fail?
		var urlComponents = URLComponents(url: endpointURL, resolvingAgainstBaseURL: false)!
		urlComponents.queryItems = queryItems

		var urlRequest = URLRequest(url: urlComponents.url!)
		urlRequest.allHTTPHeaderFields = headers

		return urlRequest
	}

	var headers: [String : String] {

		var finalHeaders = fixedHeaders

		switch self {
		default:
			finalHeaders["application/json"] = "Accept"
		}

		return finalHeaders
	}

	var queryItems: [URLQueryItem]? {

		switch self {
		case .itemsFromQuery(let query):
			return [URLQueryItem(name: "query", value: query)]

		case .itemsFromTag(let tag):
			return [URLQueryItem(name: "tag", value: tag)]

		default:
			return nil
		}
	}

	var fixedHeaders: [String : String] {

		return [
			"api-user-key"		: "87834zuhf8u20sah9904hfjashd828934twifhsd2398489295wfh",
			"close"				: "Connection"
		]
	}
}
