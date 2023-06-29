//
//  Loginname.swift
//  Login
//
//  Created by Win Htun Oo on 29/06/2023.
//
import Foundation
import UIKit

// MARK: - router

protocol LoginRouterPresenterInterface: RouterPresenterInterface {

}

// MARK: - presenter

protocol LoginPresenterRouterInterface: PresenterRouterInterface {

}

protocol LoginPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol LoginPresenterViewInterface: PresenterViewInterface {
    func start()
}

// MARK: - interactor

protocol LoginInteractorPresenterInterface: InteractorPresenterInterface {

}

// MARK: - view

protocol LoginViewPresenterInterface: ViewPresenterInterface {

}


// MARK: - name builder

final class LoginModule: ModuleInterface {

    typealias View = LoginView
    typealias Presenter = LoginPresenter
    typealias Router = LoginRouter
    typealias Interactor = LoginInteractor

    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        // swiftlint:disable force_cast
        let view = storyboard.instantiateViewController(withIdentifier: "LoginView") as! LoginView
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
