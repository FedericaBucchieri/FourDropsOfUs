//
//  CustomColors.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import SwiftUI

struct CustomColor {
  static var beige200 = Color("Beige200")
  static var red800 = Color("Red800")
  static var red500 = Color("Red500")
}

import UIKit

extension UIColor {
  static var customBeige200: UIColor {
    return UIColor(named: "Beige200") ?? UIColor.systemGray
  }

  static var customRed800: UIColor {
    return UIColor(named: "Red800") ?? UIColor.systemRed
  }

  static var customRed500: UIColor {
    return UIColor(named: "Red500") ?? UIColor.systemRed
  }
}
