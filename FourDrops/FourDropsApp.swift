//
//  FourDropsApp.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct FourDropsApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(store: .init(initialState: AppFeature.State()) {
        AppFeature()
      })
      .preferredColorScheme(.dark)
    }
  }
}
