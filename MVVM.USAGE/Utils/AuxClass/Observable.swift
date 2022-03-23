//
//  Observable.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import Foundation

final class Observable<T> {

    typealias ObservableHandler = ((T) -> Void)

    var value: T { didSet { observer?(value) } }
    var observer: ObservableHandler?

    init(_ value: T) {
        self.value = value
    }

    func bind(observer: @escaping ObservableHandler) {
        self.observer = observer
    }
}
