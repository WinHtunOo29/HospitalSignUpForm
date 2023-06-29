//
//  LoginController+Request.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation
import CodyFire

extension LoginController {
    struct LoginData: Codable {
        let message: String
        let data: DataClass
    }

    // MARK: - DataClass
    struct DataClass: Codable {
        let accessToken: String
        let user: User

        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case user
        }
    }

    // MARK: - User
    struct User: Codable {
        let id: Int
        let name, email: String

        enum CodingKeys: String, CodingKey {
            case id, name, email
        }
    }
    
    // MARK: - Parameters
    
    struct LoginInfo: JSONPayload {
        let email, password: String
        
        enum CodingKeys: String, CodingKey {
            case email, password
        }
    }
    
    static func login(_ request: LoginInfo) -> APIRequest<LoginData> {
        return APIRequest("api/auth/login", payload: request).method(.post).serverURL(ServerURL(base: "https://codetest.onenex.pro"))
    }
}
