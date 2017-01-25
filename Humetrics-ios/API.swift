//
//  APIConfiguration.swift
//  NetworkPoC
//
//  Created by Ricki Gregersen on 22/09/16.
//  Copyright © 2016 youandthegang.com. All rights reserved.
//

import Foundation

enum API {

	case postMetric(json: [String : Any])
	case metrics
	case metric(id: Int)

	var baseURL: URL {
//		return URL(string: "https://humetrics.herokuapp.com")!
		return URL(string: "localhost:8080/")!
	}

	var path: String {
		switch self {
		case .postMetric:
			return "metric"
		case .metrics:
			return "metrics"
		case .metric(let id):
			return "metric/\(id)"
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
		default:
			return nil
		}
	}

	var fixedHeaders: [String : String] {

		return [
			"app" : "v1"
//			"api-user-key"		: "87834zuhf8u20sah9904hfjashd828934twifhsd2398489295wfh",
//			"close"				: "Connection"
		]
	}
}
