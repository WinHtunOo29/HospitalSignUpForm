//
//  LoginInteractor.swift
//  Login
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation

final class LoginInteractor: InteractorInterface {

    weak var presenter: LoginPresenterInteractorInterface!
}

extension LoginInteractor: LoginInteractorPresenterInterface {

}
