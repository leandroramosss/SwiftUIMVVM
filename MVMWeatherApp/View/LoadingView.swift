//
//  LoadingView.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation
import SwiftUI

struct LodingView: View {
    var body: some View {
        VStack {
            Text("Loading weather")
                .font(.body)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
    }
}
