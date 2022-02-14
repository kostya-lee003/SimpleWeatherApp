//
//  CustomLabelStyle.swift
//  SimpleWeatherApp
//
//  Created by Kostya Lee on 09/02/22.
//

import SwiftUI

struct CustomLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}
