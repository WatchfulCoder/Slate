//
//  Priority.swift
//  Slate
//
//  Created by Mathias Setterblad on 04/05/2026.
//

enum Priority: String {
    case high = "Haute"
    case normal = "Normale"
    case low = "Basse"
    
    var icon: String {
            switch self {
            case .high:   return "exclamationmark.circle.fill"
            case .normal: return "circle.fill"
            case .low:    return "minus.circle.fill"
            }
        }
}
