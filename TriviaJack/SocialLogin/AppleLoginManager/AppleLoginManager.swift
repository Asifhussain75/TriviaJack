//
//  AppleLoginManager.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 19/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import AuthenticationServices

protocol SocialSignDelegate: class {
    func userData(data: [String: String])
}

class AppleLoginManager: NSObject {
    override init() {}
    var delegate: SocialSignDelegate?
    @available(iOS 13.0, *)
    func startLogin(){
        let appleIDProvider = ASAuthorizationAppleIDProvider()
               let request = appleIDProvider.createRequest()
               request.requestedScopes = [.fullName, .email,]
               let authorizationController = ASAuthorizationController(authorizationRequests: [request])
               authorizationController.delegate = self
               authorizationController.performRequests()
    }
}
@available(iOS 13.0, *)
extension AppleLoginManager: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            var params = [String: String]()
            if let email = appleIDCredential.email {
                params[ServerKeys.email] = email
            }
            if let firstName = appleIDCredential.fullName?.givenName{
                params[ServerKeys.firstName] = firstName
            }
            if let lastName = appleIDCredential.fullName?.familyName{
                params[ServerKeys.lastName] = lastName
            }
            params["socialId"] = appleIDCredential.user
            params["requestType"] = "Apple"//Constants.RequestType.social
            delegate?.userData(data: params)
        }
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        DisplayBanner.show(message: error.localizedDescription)
    }
}

