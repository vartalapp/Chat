//
//  Created by Alex.M on 07.07.2022.
//

import SwiftUI

struct MessageStatusView: View {

    @Environment(\.chatTheme) private var theme

    let status: Message.Status
    let onRetry: () -> Void

    var body: some View {
        Group {
            switch status {
            case .sending:
                
                theme.images.message.sending
                    .resizable()
                    .rotationEffect(.degrees(90))
                    .foregroundColor(getTheme().colors.statusGray)
            case .sent:
                theme.images.message.checkmarks
                    .resizable()
                    .foregroundColor(theme.colors.statusGray)
            case .read:
                theme.images.message.checkmarks
                    .resizable()
                    .foregroundColor(theme.colors.messageMyBG)
            case .error:
                Button {
                    onRetry()
                } label: {
                    theme.images.message.error
                        .resizable()
                }
                .foregroundColor(theme.colors.statusError)
            }
        }
        .viewSize(MessageView.statusViewSize)
        .padding(.trailing, MessageView.horizontalStatusPadding)
    }

    @MainActor
        private func getTheme() -> ChatTheme {
            return theme
        }
}
////                Text("Seen").font(.caption).foregroundStyle(.gray)

struct MessageStatusViewNew: View {

    @Environment(\.chatTheme) private var theme

    let status: Message.Status
    let onRetry: () -> Void

    var body: some View {
        Group {
            switch status {
            case .sending:
                Text("Sending").font(.caption).foregroundStyle(.gray)
                    .frame(alignment: .trailing)
            case .sent:
                VStack(alignment:.trailing){
                  
                    Text("Sent").font(.caption).foregroundStyle(.gray)
                }
            case .read:
                HStack{
                    Spacer()
                    Text("Seen").font(.caption).foregroundStyle(.gray)
                }
              
                  
            case .error:
                Button {
                    onRetry()
                } label: {
                    Text("Retry").font(.caption).foregroundStyle(.gray)
                        .frame(alignment: .trailing)
                }
                .foregroundColor(theme.colors.statusError)
            }
        }
       
        .padding(.trailing, MessageView.horizontalStatusPadding)
    }

    @MainActor
        private func getTheme() -> ChatTheme {
            return theme
        }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MessageStatusView(status: .sending, onRetry: {})
            MessageStatusView(status: .sent, onRetry: {})
            MessageStatusView(status: .read, onRetry: {})
        }
    }
}
