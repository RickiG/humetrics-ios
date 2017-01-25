//
//  WebService.swift
//  NetworkPoC
//
//  Created by Ricki Gregersen on 16/09/16.
//  Copyright © 2016 youandthegang.com. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String : Any]
typealias JSONArray = [JSONDictionary]

//typealias JSONDictionary = [String : Any]
//
//enum HttpMethod<Body> {
//	case get
//	case post(Body)
//}
//
//extension HttpMethod {
//	var method: String? {
//		switch self {
//		case .get: return "GET"
//		case .post: return "POST"
//
//		}
//	}
//
//	func map<B>(f: (Body) -> B) -> HttpMethod<B> {
//		switch self {
//		case .get: return .get
//		case .post(let body):
//			return .post(f(body))
//		}
//
//	}
//}
//
//public enum HTTPStatus: Int {
//
//	case success
//	case reAuthenticate
//	case clientError
//	case serverError
//	case undefined
//}
//
//extension HTTPStatus {
//
//	public var range: Range<Int> {
//		switch self {
//		case .success:
//			return 200..<300
//		case .reAuthenticate:
//			return 401..<402
//		case .clientError:
//			return 400..<500
//		case .serverError:
//			return 500..<600
//		default:
//			return 0..<200
//		}
//	}
//}
//
//extension HTTPURLResponse {
//
//	var mime: ContentType {
//
//		guard let contentType = allHeaderFields["Content-Type"] as? String else {
//			return .undefined
//		}
//
//		switch contentType {
//		case "application/json":
//			return .json
//		case "application/html":
//			return .html
//		default:
//			return .undefined
//		}
//	}
//}
//
//public enum ContentType: String {
//
//	case json
//	case html
//	case undefined
//}
//
//extension ContentType {
//
//
//}
//
//public enum APIError: Error {
//	case httpError
//}



class Webservice {

	func load(request: URLRequest, completion: @escaping (Any?, URLResponse?, Error?) ->()) -> Int {

		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

			// Hey, if it works, just return.
			if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) {
				DispatchQueue.main.async {
					completion(json, response, error)
				}
				return
			}

			DispatchQueue.main.async { completion(data, response, error) }

//			if let http = response as? HTTPURLResponse {
//				switch http.statusCode {
//				case HTTPStatus.success.range:
//					completion(json, response, error)
//				case HTTPStatus.clientError.range:
//					completion(nil, response, error)
//				case HTTPStatus.serverError.range:
//					completion(nil, response, error)
//				case HTTPStatus.reAuthenticate.range:
//					// important
//					break
//				default:
//					completion(nil, response, error)
//				}
//			}
//
//			completion(data, response, error)
		}

		task.resume()

		return task.taskIdentifier

	}

	func cancel(taskWithIdentier id: Int) {

		URLSession.shared.getAllTasks { tasks in

			let results = tasks.filter { $0.taskIdentifier == id }
			let _ = results.map{
				print("cancelled a request")
				$0.cancel()
			}
		}
	}
}




