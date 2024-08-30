//
//  AppView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 28/06/24.
//

import SwiftUI
import ComposableArchitecture

public struct AppView: View {
  @Bindable var store: StoreOf<AppFeature>
  
  public var body: some View {
    WithPerceptionTracking {
      Group {
        switch self.store.root {
        case .introSetup:
          if let store = store.scope(state: \.root.introSetup, action: \.root.introSetup) {
            NavigationStack {
              IntroView(store: store)
            }
          }
        case .mainMenu:
          if let store = store.scope(state: \.root.mainMenu, action: \.root.mainMenu) {
            NavigationStack {
              MainMenuFeatureView(store: store)
            }
          }
        }
      }
    }
  }
}
