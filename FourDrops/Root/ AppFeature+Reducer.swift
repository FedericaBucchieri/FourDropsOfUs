//
//  AppFeature.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 28/06/24.
//

import Foundation
import ComposableArchitecture


@Reducer struct AppFeature {
  // MARK: - State
  
  @ObservableState
  public struct State: Equatable {
    var root: RootFeature.State
    
    public init() {
      self.root = .introSetup(IntroFeature.State())
    }
  }
  
  // MARK: - Actions
  
  public enum Action: Equatable {
    case root(RootFeature.Action)
  }
  
  // MARK: - Reducer Composition
  public var body: some ReducerOf<Self> {
    Scope(state: \AppFeature.State.root, action: /AppFeature.Action.root) {
      RootFeature()
    }
    Reduce<Self.State, Self.Action> { state, action in
      switch action {
      case .root(.introSetup(.delegate(.handleIntroSetupCompleted))):
        state.root = .mainMenu(MainMenuFeature.State())
        return .none
        
      case .root:
        return .none
      }
    }
  }
}

@Reducer
public struct RootFeature {
  public init() {}
  
  // MARK: - State
  
  @ObservableState
  public enum State: Equatable {
    case introSetup(IntroFeature.State)
    case mainMenu(MainMenuFeature.State)
  }
  
  // MARK: - Actions
  
  public enum Action: Equatable {
    case introSetup(IntroFeature.Action)
    case mainMenu(MainMenuFeature.Action)
  }
  
  // MARK: - Reducer Composition
  
  public var body: some ReducerOf<Self> {
    Scope(state: \.introSetup, action: \.introSetup) {
      IntroFeature()
    }
    Scope(state: \.mainMenu, action: \.mainMenu) {
      MainMenuFeature()
    }
  }
}

