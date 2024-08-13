//
// SecurityAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class SecurityAPI {

    /**

     - parameter apiSecuritySignInRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func apiSecuritySignIn(apiSecuritySignInRequest: ApiSecuritySignInRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: ApiSecuritySignIn200Response?, _ error: Error?) -> Void)) -> RequestTask {
        return apiSecuritySignInWithRequestBuilder(apiSecuritySignInRequest: apiSecuritySignInRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - POST /security/sign-in
     - parameter apiSecuritySignInRequest: (body)  (optional)
     - returns: RequestBuilder<ApiSecuritySignIn200Response> 
     */
    open class func apiSecuritySignInWithRequestBuilder(apiSecuritySignInRequest: ApiSecuritySignInRequest? = nil) -> RequestBuilder<ApiSecuritySignIn200Response> {
        let localVariablePath = "/security/sign-in"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: apiSecuritySignInRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "application/json",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ApiSecuritySignIn200Response>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**

     - parameter apiSecuritySignUpRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func apiSecuritySignUp(apiSecuritySignUpRequest: ApiSecuritySignUpRequest? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) -> RequestTask {
        return apiSecuritySignUpWithRequestBuilder(apiSecuritySignUpRequest: apiSecuritySignUpRequest).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - POST /security/sign-up
     - parameter apiSecuritySignUpRequest: (body)  (optional)
     - returns: RequestBuilder<Void> 
     */
    open class func apiSecuritySignUpWithRequestBuilder(apiSecuritySignUpRequest: ApiSecuritySignUpRequest? = nil) -> RequestBuilder<Void> {
        let localVariablePath = "/security/sign-up"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: apiSecuritySignUpRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "application/json",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = OpenAPIClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
