import XCTest
@testable import Counter
import SnapshotTesting
import ComposableArchitecture
import SwiftUI
@testable import PrimeWidgetExtension


extension Snapshotting where Value: UIViewController, Format == UIImage {
  static var windowedImage: Snapshotting {
    return Snapshotting<UIImage, UIImage>.image.asyncPullback { vc in
      Async<UIImage> { callback in
        UIView.setAnimationsEnabled(false)
        let window = UIApplication.shared.windows.first!
        window.rootViewController = vc
        DispatchQueue.main.async {
          let image = UIGraphicsImageRenderer(bounds: window.bounds).image { ctx in
            window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
          }
          callback(image)
          UIView.setAnimationsEnabled(true)
        }
      }
    }
  }
}


class CounterTests: XCTestCase {
  override func setUp() {
    super.setUp()
    Current = .mock
  }

  func testSnapshots() {
    let swiftUIView = SwiftUIView()
    let view = swiftUIView.frame(width: 500, height: 100, alignment: .center)
    let vc = UIHostingController(rootView: view)
    vc.view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

    assertSnapshot(matching: vc, as: .windowedImage)
  }
}
