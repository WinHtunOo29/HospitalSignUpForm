//
//  RegisterInteractor.swift
//  Register
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation

final class RegisterInteractor: InteractorInterface {

    weak var presenter: RegisterPresenterInteractorInterface!
}

extension RegisterInteractor: RegisterInteractorPresenterInterface {

}
