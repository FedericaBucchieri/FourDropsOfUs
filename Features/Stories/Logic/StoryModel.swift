//
//  StoryModel.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 26/06/24.
//

import Foundation

struct StoryModel {
  let title: String
  let cover: String
  let storyComponents: [StoryComponent]
  
  static var mock: Self {
    .init(title: "Did you know?",
          cover: "event_cover_dinner_for_four",
          storyComponents: [
            .init(type: .text, content: EventModel.mock.description),
            .init(type: .image, content: "event_cover_dinner_for_four"),
            .init(type: .text, content: EventModel.mock.description)
          ])
  }
}

struct StoryComponent: Hashable {
  let type: StoryComponentType
  let content: String
}

enum StoryComponentType {
  case text
  case image
}
