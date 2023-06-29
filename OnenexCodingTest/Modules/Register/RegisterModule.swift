//
//  Registername.swift
//  Register
//
//  Created by Win Htun Oo on 29/06/2023.
//
import Foundation
import UIKit

// MARK: - router

protocol RegisterRouterPresenterInterface: RouterPresenterInterface {

}

// MARK: - presenter

protocol RegisterPresenterRouterInterface: PresenterRouterInterface {

}

protocol RegisterPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol RegisterPresenterViewInterface: PresenterViewInterface {
    func start()
}

// MARK: - interactor

protocol RegisterInteractorPresenterInterface: InteractorPresenterInterface {

}

// MARK: - view

protocol RegisterViewPresenterInterface: ViewPresenterInterface {

}


// MARK: - name builder

final class RegisterModule: ModuleInterface {

    typealias View = RegisterView
    typealias Presenter = RegisterPresenter
    typealias Router = RegisterRouter
    typealias Interactor = RegisterInteractor

    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        // swiftlint:disable force_cast
        let view = storyboard.instantiateViewController(withIdentifier: "RegisterView") as! RegisterView
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
