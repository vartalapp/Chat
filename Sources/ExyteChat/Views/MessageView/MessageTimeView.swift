//
//  Created by Alex.M on 08.07.2022.
//

import SwiftUI

struct MessageTimeView: View {

    let text: String
    let userType: UserType
    var chatTheme: ChatTheme

    var body: some View {
        Text(text)
            .font(.caption2)
            .foregroundColor(chatTheme.colors.messageTimeText(userType))
    }
}

struct MessageTimeWithCapsuleView: View {

    let text: String
    let isCurrentUser: Bool
    var chatTheme: ChatTheme

    var body: some View {
        Text(text)
            .font(.caption2)
            .foregroundColor(.white)
            .opacity(0.8)
            .padding(.top, 4)
            .padding(.bottom, 4)
            .padding(.horizontal, 8)
            .background {
                Capsule()
                    .foregroundColor(.black.opacity(0.4))
            }
    }
}

