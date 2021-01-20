//
//  SwiftUIView.swift
//  PrimeWidgetExtension
//
//  Created by Tony Tran on 2021-01-20.
//  Copyright © 2021 Point-Free. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("Hello, World!").background(Color.green)
        }
        .padding(.all, 5)
        .background(Color.orange)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
