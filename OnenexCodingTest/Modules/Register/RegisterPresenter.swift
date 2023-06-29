//
//  RegisterPresenter.swift
//  Register
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation

final class RegisterPresenter: PresenterInterface {

    var router: RegisterRouterPresenterInterface!
    var interactor: RegisterInteractorPresenterInterface!
    weak var view: RegisterViewPresenterInterface!

}

extension RegisterPresenter: RegisterPresenterRouterInterface {

}

extension RegisterPresenter: RegisterPresenterInteractorInterface {

}

extension RegisterPresenter: RegisterPresenterViewInterface {

    func start() {

    }

}
