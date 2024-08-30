//
//  Divider.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 27/07/24.
//

import SwiftUI

/// Helper that allows to get an easy access to the safe area insets from any view.
/// You should use it this way:
///
/// ```
/// struct MyFavouriteView: View {
///   @Environment(\.safeAreaInsets) safeAreaInsets
///
///   var body: some View {
///     ...
///     FixedHeightSpacer(self.safeAreaInsets.top)
///     ...
///   }
/// }
/// ```
extension EnvironmentValues {
  public var safeAreaInsets: EdgeInsets {
    self[SafeAreaInsetsKey.self]
  }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
  static var defaultValue: EdgeInsets {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let safeAreaInsets = windowScene.windows.first?.safeAreaInsets.swiftUiInsets
    else { return EdgeInsets() }
    return safeAreaInsets
  }
}

extension UIEdgeInsets {
  fileprivate var swiftUiInsets: EdgeInsets {
    EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
  }
}
