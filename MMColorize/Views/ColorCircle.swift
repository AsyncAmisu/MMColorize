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
    
    // MARK: - Body
    var body: some View {
        Circle()
            .fill(Color(red: rgb.red, green: rgb.green, blue: rgb.blue))
    }
}

// MARK: - Preview

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(rgb: RGB())
    }
}
