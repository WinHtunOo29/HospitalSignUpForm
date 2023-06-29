//
//  LoginRouter.swift
//  Login
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation
import UIKit

final class LoginRouter: RouterInterface {

    weak var presenter: LoginPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension LoginRouter: LoginRouterPresenterInterface {

}