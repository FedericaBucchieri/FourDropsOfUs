//
//  EventPageFeature+Reducer.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct EventPageFeature {
  public init() {}
  
  // MARK: - State
  
  @ObservableState
  public struct State: Equatable {
    var eventModel: EventModel
    
    init(eventModel: EventModel) {
      self.eventModel = .mock
    }
  }
  
  // MARK: - Actions
  
  public enum Action: Equatable {
    case didTapReserveYourSpot
  }
  
  // MARK: - Reducer Composition
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .didTapReserveYourSpot:
        print("Reserve your spot")
        return .none
      }
    }
  }
}

public struct EventModel: Equatable {
  let title: String
  let shortDescription: String
  let description: String
  let day: String
  let month: String
  let time: String
  let image: String
  let tag: String
  let address: String
  let location: String


  static var mock: Self {
    .init(
      title: "Dinner for Four",
      shortDescription: "We invite you to Dinner for Four, an intimate dinner through the four phases of the menstrual cycle.",
      description: "For the first @fourdropsofus event, we invite you to Dinner for Four, an intimate dinner through the four phases of the menstrual cycle."
      + "  Opening up about our menstrual cycle can show a true, vulnerable and unexplored part of who we are. And yet, because of menstrual stigma we rarely talk about our experiences or relate to each other through it."
      + "  Dinner for Four creates space and a moment for you to reflect on your menstrual cycle. It will be an evening focused on sharing and connecting over our collective experiences - while enjoying some amazing food, cocktails and music. 🍋🍸",
      day: "23",
      month: "MAR",
      time: "starting from 19.00",
      image: "event_cover_dinner_for_four",
      tag: "Event",
      address: "C/ del Comte Borrell, 147, Barcelona",
      location: "Kaktos Botanical Society"
    )
  }
}
