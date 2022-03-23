//
//  Service.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import Foundation

protocol ServiceProtocol {
    func getData(completion: @escaping ([Model]) -> Void)
}

final class Service: ServiceProtocol {
    func getData(completion: @escaping ([Model]) -> Void) {
        let mock = [Model(name: "Tester", id: 01),
                    Model(name: "Tester2", id: 02),
                    Model(name: "Tester3", id: 03),
                    Model(name: "Tester4", id: 04),
                    Model(name: "Tester5", id: 05),
                    Model(name: "Tester6", id: 06),
                    Model(name: "Tester7", id: 07),
                    Model(name: "Tester8", id: 08),
                    Model(name: "Tester9", id: 09),
                    Model(name: "Tester10", id: 10),
                    Model(name: "Tester11", id: 11),
                    Model(name: "Tester12", id: 12),
                    Model(name: "Tester13", id: 13),
                    Model(name: "Tester14", id: 14),
                    Model(name: "Tester15", id: 15),
                    Model(name: "Tester16", id: 16)]

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(mock)
        }
    }
}
