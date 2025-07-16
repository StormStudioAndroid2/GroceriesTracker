//
//  Toolbar.swift
//  GroceriesTracker
//
//  Created by Sergey Kudinov on 08.06.2025.
//

import SwiftUICore
import UIKit

struct Toolbar : View {
    @EnvironmentObject private var router: Router
    @State var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        
        HStack {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .onTapGesture {
                        router.pop()
                    }
            }
            .foregroundColor(.blue)
            .frame(width: 60)
            
            Spacer()
            
            Text(title)
                .font(.system(size: 17, weight: .semibold))
            
            Spacer()
            
            // Empty view to balance the back button
            Color.clear
                .frame(width: 60)
        }
        .frame(height: 44)
        .padding(.horizontal, 16)
        .background(Color(UIColor.systemBackground))
    
    }
}
