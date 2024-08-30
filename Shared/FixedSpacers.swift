//
//  FixedSpacers.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import SwiftUI

public struct FixedWidthSpacer: View {
  let width: CGFloat
  
  public init(_ width: CGFloat) {
    self.width = width
  }
  
  public var body: some View {
    Spacer().frame(width: self.width)
  }
}

public struct FixedHeightSpacer: View {
  let height: CGFloat
  
  public init(_ height: CGFloat) {
    self.height = height
  }
  
  public var body: some View {
    Spacer().frame(height: self.height)
  }
}
