//
//  ViewModel.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import Foundation

final class ViewModel {
    var users: Observable<[Model?]> = .init([])
    private let service: ServiceProtocol

    init(_ service: ServiceProtocol = Service()) {
        self.service = service
        self.requestData()
    }

    private func requestData() {
        service.getData { self.users.value = $0 }
    }
}
