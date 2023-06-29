//
//  RegisterRouter.swift
//  Register
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation
import UIKit

final class RegisterRouter: RouterInterface {

    weak var presenter: RegisterPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension RegisterRouter: RegisterRouterPresenterInterface {

}