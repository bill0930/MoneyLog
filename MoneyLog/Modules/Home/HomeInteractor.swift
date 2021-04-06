//
//  HomeInteractor.swift
//  MoneyLog
//
//  Created by Billy Chan on 7/4/2021.
//

import Foundation
import FirebaseAuth

protocol HomeInteractorInterface: InteractorInterface {

}

final class HomeInteractor: HomeInteractorInterface {

    weak var presenter: HomePresenterInteractorInterface!
}

extension HomeInteractor: HomeInteractorPresenterInterface {
    func logout(completion: (Bool, Error?) -> Void) {
        if Auth.auth().currentUser != nil {
            do {
                let reuslt = try Auth.auth().signOut()
                completion(true, nil)
            } catch {
                completion(false, error)
            }
        }
    }
}
