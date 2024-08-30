//
//  MainMenuFeatureView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 28/06/24.
//

import SwiftUI
import ComposableArchitecture

struct MainMenuFeatureView: View {
  @Bindable var store: StoreOf<MainMenuFeature>
  
  public var body: some View {
    TabView(selection: $store.currentTab.sending(\.tabChanged)) {
      // MARK: - Home Page
      NavigationStack {
        HomepageView(store: store.scope(state: \.home, action: \.home))
      }
      .tabItem {
        Label(MenuTab.home.title, systemImage: MenuTab.home.systemImage)
      }
      .tag(MenuTab.home)
      
      // MARK: - Event List Page
      
      NavigationStack {
        EventListView(store: store.scope(state: \.events, action: \.events))
      }
      .tabItem {
        Label(MenuTab.event.title, systemImage: MenuTab.event.systemImage)
      }
      .tag(MenuTab.event)
    }
    .onAppear {
      let tabBarAppearance = UITabBarAppearance()
      tabBarAppearance.configureWithDefaultBackground()
      UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
  }
}


#Preview {
  MainMenuFeatureView(store: .init(initialState: MainMenuFeature.State()) {
    MainMenuFeature()
  })
}
