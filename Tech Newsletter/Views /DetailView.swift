//
//  DetailView.swift
//  Tech Newsletter
//
//  Created by MAC on 02/01/2024.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}


