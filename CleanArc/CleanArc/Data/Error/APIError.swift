//
//  APIError.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation


enum APIServiceError: Error{
    case badUrl, requestError, decodingError, statusNotOK
}
