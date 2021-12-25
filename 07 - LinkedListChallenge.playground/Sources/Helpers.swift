// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

import Foundation

public func example(of description: String, action: () -> ()) {
    print("---Example of \(description)---")
    action()
    print()
}

public func duration(_ block: () -> ()) -> TimeInterval {
    let startTime = Date()
    block()
    return Date().timeIntervalSince(startTime)
}
