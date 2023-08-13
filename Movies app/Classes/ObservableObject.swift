//
//  ObservableObject.swift
//  Movies app
//
//  Created by ZhZinekenov on 22.07.2023.
//

import Foundation

final class ObservableObject<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    private var listener: ((T) -> Void)?
    
    init(_ value: T ) {
        self.value = value
    }
    
    func bind(listener: @escaping(T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
