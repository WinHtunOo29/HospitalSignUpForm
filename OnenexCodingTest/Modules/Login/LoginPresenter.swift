//
//  LoginPresenter.swift
//  Login
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation

final class LoginPresenter: PresenterInterface {

    var router: LoginRouterPresenterInterface!
    var interactor: LoginInteractorPresenterInterface!
    weak var view: LoginViewPresenterInterface!

}

extension LoginPresenter: LoginPresenterRouterInterface {

}

extension LoginPresenter: LoginPresenterInteractorInterface {

}

extension LoginPresenter: LoginPresenterViewInterface {

    func start() {

    }

}
