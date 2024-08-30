//
//  MainMenuFeature+Reducer.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 28/06/24.
//

import Foundation
import ComposableArchitecture

@Reducer 
public struct MainMenuFeature {
  public init() {}
  
  // MARK: - State
  
  @ObservableState
  public struct State: Equatable {
    var home: HomepageFeature.State
    var events: EventListFeature.State
    var currentTab: MenuTab
  
    public init() {
      self.home = HomepageFeature.State()
      self.events = EventListFeature.State(events: [.mock])
      self.currentTab = .event
    }
  }
  
  // MARK: - Actions
  
  public enum Action: Equatable {
    case home(HomepageFeature.Action)
    case events(EventListFeature.Action)
    case tabChanged(MenuTab)
  }
  
  // MARK: - Reducer Composition
  
  public var body: some ReducerOf<Self> {
    Scope(state: \.home, action: \.home) {
      HomepageFeature()
    }
    Scope(state: \.events, action: \.events) {
      EventListFeature()
    }
    Reduce { state, action in
      switch action {
      case .events, .home:
        return .none
        
      case .tabChanged(let selectedTab):
        state.currentTab = selectedTab
        return .none
      }
    }
  }
}

// MARK: - Menu Tab

public enum MenuTab: Int, CaseIterable, Identifiable {
  case home
  case event
  
  public var id: Int { self.rawValue }
  
  public var title: String {
    switch self {
    case .home:
      return "Home"
    case .event:
      return "Events"
    }
  }
  
  public var systemImage: String {
    switch self {
    case .home:
      return "text.redaction"
    case .event:
      return "calendar"
    }
  }
}

