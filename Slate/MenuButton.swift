//
//  MenuButton.swift
//  Slate
//
//  Created by Mathias Setterblad on 05/05/2026.
//

import SwiftUI

struct MenuButton: View {
    @State private var isHovered = false
    var text: String
    var isDisabled: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(isHovered ? .white : .primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 13)
                .padding(.vertical, 3)
                .background(isHovered && !isDisabled ? Color.accentColor : Color.clear)
                .cornerRadius(6)
                
        }
        .buttonStyle(.plain)
        .onHover { isHovering in
            self.isHovered = isHovering
        }
        .disabled(isDisabled)
    }
}
