//
//  IntroFeature+Reducer.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 28/06/24.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct IntroFeature {
  public init() {}
  
  // MARK: - State
  
  @ObservableState
  public struct State: Equatable {
    
    init() {}
  }
  
  // MARK: - Actions
  
  public enum Action: Equatable {
    case onAppear
    case delegate(DelegateAction)
  }
  
  public enum DelegateAction: Equatable {
    case handleIntroSetupCompleted
  }
  
  // MARK: - Reducer Composition
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .onAppear:
        return .run { send in
          try await Task.sleep(nanoseconds: 3 * NSEC_PER_SEC)
          return await send(.delegate(.handleIntroSetupCompleted))
        }
        
      case .delegate:
        return .none
      }
    }
  }
}
