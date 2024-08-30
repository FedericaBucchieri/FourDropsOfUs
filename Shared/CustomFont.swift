//
//  CustomFont.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import SwiftUI

/// Example of usage:
/// ```
/// Text("Hello, world!")
///   .font(CustomFont.seasonRegular(size: 36))
/// ```
struct CustomFont {
  static func seasonRegular(size: CGFloat) -> Font {
    Font.custom("FONTSPRINGDEMO-TheSeasonsRegular", size: size)
  }
  
  static func seasonBold(size: CGFloat) -> Font {
    Font.custom("FONTSPRINGDEMO-TheSeasonsBold", size: size)
  }
  
  static func seasonLight(size: CGFloat) -> Font {
    Font.custom("FONTSPRINGDEMO-TheSeasonsLightRegular", size: size)
  }
  
  static func reservationRegular(size: CGFloat) -> Font {
    Font.custom("ReservationWide-Regular", size: size)
  }
  
  static func reservationBold(size: CGFloat) -> Font {
    Font.custom("ReservationWide-Bold", size: size)
  }
  
  static func reservationBlack(size: CGFloat) -> Font {
    Font.custom("ReservationWide-Black", size: size)
  }
}

import UIKit

/// Example of usage:
/// ```
/// self.titleLabel.font = UIFont.seasonBold(size: 24)
/// ```
extension UIFont {
  static func seasonRegular(size: CGFloat) -> UIFont {
    return UIFont(name: "FONTSPRINGDEMO-TheSeasonsRegular", size: size) ?? UIFont.systemFont(ofSize: size)
  }

  static func seasonBold(size: CGFloat) -> UIFont {
    return UIFont(name: "FONTSPRINGDEMO-TheSeasonsBold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
  }

  static func seasonLight(size: CGFloat) -> UIFont {
    return UIFont(name: "FONTSPRINGDEMO-TheSeasonsLightRegular", size: size) ?? UIFont.systemFont(ofSize: size)
  }

  static func reservationRegular(size: CGFloat) -> UIFont {
    return UIFont(name: "ReservationWide-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
  }

  static func reservationBold(size: CGFloat) -> UIFont {
    return UIFont(name: "ReservationWide-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
  }
}
