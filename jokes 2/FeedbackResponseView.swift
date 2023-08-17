//
//  FeedbackResponseView.swift
//  jokes 2
//
//  Created by Razan Raid on 14/07/2023.
//

import SwiftUI

struct FeedbackResponseView: View {
    var ispositive :  Bool
    
    var body: some View {
        Image(ispositive ? "happy" : "sad")
            .resizable()
            .scaledToFit()
        Text(ispositive ? "thamks :)" : "i will tell my therapist about you.")
    }
}

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView(ispositive: true)
        FeedbackResponseView(ispositive: false)
    }
}
