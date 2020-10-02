//
//  StatusTime.swift
//  Coffee
//
//  Created by Alley Pereira on 30/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation
import UIKit
//swiftlint:disable switch_case_alignmen superfluous_disable_command
enum StatusTimer {
    case start
    case pause
    case resume

    var color: UIColor {
        switch self {
            case .pause:
                return UIColor.amareloEscuroCustomized!
            case .start, .resume:
                return UIColor.amareloEscuroCustomized!
        }
    }

    var tappedColor: UIColor {
        switch self {
            case .pause:
                return UIColor(red: 0.89, green: 0.71, blue: 0.00, alpha: 1.00)
            case .start, .resume:
                return UIColor(red: 0.27, green: 0.75, blue: 0.35, alpha: 1.00)
        }
    }

    var name: String {
        switch self {
            case .pause:
                return "II"
            case .resume:
                return "▶︎"
            case .start:
                return "▶︎"
        }
    }
}
