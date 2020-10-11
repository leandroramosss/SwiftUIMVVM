//
//  ErrorView.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    
    let message: String
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.body)
                .foregroundColor(Color.white)
        }
        .padding()
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
    }
}
