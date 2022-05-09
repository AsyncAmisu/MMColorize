//
//  ColorCircle.swift
//  MMColorize
//
//  Created by Alexander Snitko on 5.05.22.
//

import SwiftUI

struct ColorCircle: View {
    // MARK: Properties
    
    var rgb: RGB
    var size: CGFloat
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.element)
                .northWestShadow()
            Circle()
                .fill(Color(red: rgb.red, green: rgb.green, blue: rgb.blue))
                .padding(20)
        }
        .frame(width: size, height: size)
    }
}

// MARK: - Preview

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.element
            ColorCircle(rgb: RGB(), size: 200)
        }
        .frame(width: 300, height: 300)
        .previewLayout(.sizeThatFits)
    }
}
