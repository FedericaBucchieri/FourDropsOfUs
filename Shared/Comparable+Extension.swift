//
//  Comparable+Extension.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import Foundation

extension Comparable {
  /// Constrains a given value within a specified range
  public func clamped(to limits: ClosedRange<Self>) -> Self {
    return Swift.max(Swift.min(self, limits.upperBound), limits.lowerBound)
  }
}
