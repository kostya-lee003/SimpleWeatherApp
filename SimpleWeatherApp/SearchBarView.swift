//
//  SearchBarView.swift
//  SimpleWeatherApp
//
//  Created by Kostya Lee on 11/02/22.
//

import SwiftUI

struct SearchBar: View {
    
    @State var query: Binding<String>
    
    init(text: Binding<String>) {
        query = text
    }
    
     var body: some View {
         ZStack {
             Rectangle()
                 .foregroundColor(Color.white)
             HStack {
                 Image(systemName: "magnifyingglass")
                 TextField("Search ..", text: query)
             }
             .scaleEffect(1.3)
             .foregroundColor(.black)
             .padding(.leading, 70)
         }
             .frame(height: 50)
             .cornerRadius(24)
             .padding()
     }
 }
