//
//  OAuthService.swift
//  Twidere
//
//  Created by Mariotaku Lee on 16/7/10.
//  Copyright © 2016年 Mariotaku Dev. All rights reserved.
//

import Foundation

class OAuthService: RestClient {
    
    func getRequestToken(oauthCallback: String, callback: ((OAuthToken?, NSError?) -> Void)? = nil) -> OAuthToken? {
        let forms: [String: AnyObject] = ["oauth_callback": oauthCallback]
        return makeTypedRequest(.POST, path: "/oauth/request_token", forms: forms, converter: ModelConverter.oauthToken, callback: callback)
    }
    
    func getAccessToken(xauthUsername:String, xauthPassword: String, callback: ((OAuthToken?, NSError?) -> Void)? = nil) -> OAuthToken? {
        let forms: [String: AnyObject] = [
            "x_auth_mode": "client_auth",
            "x_auth_username": xauthUsername,
            "x_auth_password": xauthPassword
        ]
        return makeTypedRequest(.POST, path: "/oauth/access_token", forms: forms, converter: ModelConverter.oauthToken, callback: callback)
    }
    
    
    func getAccessToken(requestToken: OAuthToken, oauthVerifier: String? = nil, callback: ((OAuthToken?, NSError?) -> Void)? = nil) -> OAuthToken? {
        let forms: [String: AnyObject]
        if (oauthVerifier != nil) {
            forms = ["oauth_verifier": oauthVerifier!]
        } else {
            forms = [:]
        }
        var finalAuth = auth
        if (auth is OAuthAuthorization) {
            let oauth = auth as! OAuthAuthorization
            finalAuth = OAuthAuthorization(consumerKey: oauth.consumerKey, consumerSecret: oauth.consumerSecret, oauthToken: requestToken)
        }
        return makeTypedRequest(.POST, path: "/oauth/access_token", forms: forms, authOverride: finalAuth, converter: ModelConverter.oauthToken, callback: callback)
    }
    
}