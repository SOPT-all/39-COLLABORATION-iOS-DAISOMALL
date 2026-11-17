//
//  BaseService.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/15/26.
//

import Foundation

final class BaseService {
    static let shared = BaseService()
    private init() {}

    func request<Response: Decodable>(endPoint: EndPoint, body: Encodable? = nil) async throws -> Response {
        let data = try await send(endPoint: endPoint, body: body)
        let response = try decode(BaseResponseDTO<Response>.self, from: data)

        guard let responseData = response.data else {
            throw NetworkError.noData
        }

        return responseData
    }
}

extension BaseService {
    private func send(endPoint: EndPoint, body: Encodable?) async throws -> Data {
        let request = try makeRequest(endPoint: endPoint, body: body)
        NetworkLogger.requestLog(request: request)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        NetworkLogger.responseLog(response: httpResponse, data: data)

        guard (200...299).contains(httpResponse.statusCode) else {
            throw makeServerError(statusCode: httpResponse.statusCode, data: data)
        }

        return data
    }

    private func makeRequest(endPoint: EndPoint, body: Encodable?) throws -> URLRequest {
        guard let baseURLString = Bundle.main.infoDictionary?["BASE_URL"] as? String,
              var url = URL(string: baseURLString)
        else {
            throw NetworkError.invalidURL
        }

        url.append(path: endPoint.path)

        if !endPoint.queryItems.isEmpty {
            url.append(queryItems: endPoint.queryItems)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue

        endPoint.header.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        if let body {
            request.httpBody = try makeRequestBody(body)
        }

        return request
    }

    private func makeRequestBody(_ body: Encodable) throws -> Data {
        do {
            return try JSONEncoder().encode(body)
        } catch {
            throw NetworkError.requestEncodingFailed
        }
    }

    private func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.responseDecodingFailed
        }
    }

    private func makeServerError(statusCode: Int, data: Data) -> NetworkError {
        guard let errorResponse = try? JSONDecoder().decode(ErrorResponseDTO.self, from: data) else {
            return .invalidStatusCode(statusCode)
        }

        return .serverError(code: errorResponse.code, message: errorResponse.message)
    }
}
