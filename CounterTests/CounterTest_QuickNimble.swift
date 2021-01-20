//
//  CounterTest_QuickNimble.swift
//  CounterTests
//
//  Created by Tony Tran on 2021-01-20.
//  Copyright © 2021 Point-Free. All rights reserved.
//

@testable import Counter
import SwiftUI
@testable import PrimeWidgetExtension
import Quick
import Nimble
import Nimble_Snapshots

class CounterTest_QuickNimble: QuickSpec {
    override func spec() {
        describe("an SwiftUIView") {
            it("should create a widget view") {
                let swiftUIView = SwiftUIView()
                let view = swiftUIView.frame(width: 155, height: 400)
                let vc = UIHostingController(rootView: view )
                vc.view.frame = CGRect(x: 0, y: 0, width: 155, height: 155)

                expect(vc.view) == recordSnapshot()
            }
        }
    }
}

