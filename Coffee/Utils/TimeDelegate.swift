//
//  TimeDelegate.swift
//  Coffee
//
//  Created by Alley Pereira on 30/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

protocol TimeDelegate: class {
    func start(with time: Int)
    func pause()
    func resume()
    func cancel()
}
