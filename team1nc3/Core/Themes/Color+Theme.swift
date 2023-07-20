//
//  Color+Theme.swift
//  team1nc3
//
//  Created by Joshua on 18/07/23.
//

import Foundation
import SwiftUI

extension Color {
    struct Neutral {
        /// Used in Neutral background and white text
        static let s10 = Color("neutral-10")
        
        /// Used in item background Hover and secondary background
        static let s20 = Color("neutral-20")
        
        // Used when an item background pressed
        static let s30 = Color("neutral-30")
        
        /// Used when an item background is selected
        static let s40 = Color("neutral-40")
        
        /// Used in borders and dividers
        static let s50 = Color("neutral-50")
        
        /// Used when a text is disabled
        static let s60 = Color("neutral-60")
        
        /// Used in placeholder text
        static let s70 = Color("neutral-70")
        
        /// Used in caption text and secondary text
        static let s80 = Color("neutral-80")
        
        /// Used in body text and inactive text
        static let s90 = Color("neutral-90")
        
        /// Used in headings and active text
        static let s100 = Color("neutral-100")
    }
    struct Semantic {
        
        struct Success {
            static let main = Color("success-main")
        }
        
        struct Info {
            static let main = Color("info-main")
        }
        
        struct Warning {
            static let main = Color("warning-main")
        }
        
        struct Danger {
            static let main = Color("danger-main")
        }
    }
}
