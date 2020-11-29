//
//  InviteFriends.swift
//  Recex
//
//  Created by Pulkith Paruchuri on 11/27/20.
//

import SwiftUI
import MobileCoreServices

struct InviteFriends: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var model = InviteFriendsViewModel(user: User(PersonID: "000000", Firstname: "Pulkith", Lastname: "Paruchuri", Email: "email@example.com", Creation: "Dec 6, 2020", Role: "Developer", SuggestionModelData: "null", Posts: ["null"], Followers: ["null"], Following: ["null"], ShareIdentifier: "nA4Se3", PantryList: ["null"], Preferences: ["null"], Communities: [["null"]]))
    
    var body: some View {
            VStack{
                HStack{
                    
                    Image("BackIconBlue")
                        .resizable()
                        .frame(width: 40, height:40)
                        .padding(.trailing, 20)
                        .onTapGesture(count: 1){
                            print(self.mode.wrappedValue)
                            self.mode.wrappedValue.dismiss()
                        }
                    
                    Text("Invite Friends")
                        .font(.system(size: 32, weight: .bold))
                    Spacer()
                }
                .padding()
                .foregroundColor(.primary)
                .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3).edgesIgnoringSafeArea(.top))
                .padding(.bottom, -10)
                HStack{
                    Spacer()
                    ZStack {
                        Image("AbstractShape")
                            .resizable()
                            .frame(width:UIScreen.main.bounds.width / 1.75, height: UIScreen.main.bounds.width / 1.75)
                            .padding(.top, 0)
                    }
                }
                
                if(model.QRImage != nil){
                    Image(uiImage: model.QRImage!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.width / 1.5)
                    Divider()
                        .padding(.leading, 25)
                        .padding(.trailing, 25)
                    Text("Click Here  to Copy a Shareable Link ")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture (count: 1){
                            UIPasteboard.general.setValue(model.ShareableLink,
                                        forPasteboardType: kUTTypePlainText as String)
                            model.RemoveCopied()
                            model.copied = true
                        }
                        .padding(.bottom, 7)
                }
                else{
                    Image("RedXIcon")

                    Divider()
                        .padding(.leading, 25)
                        .padding(.trailing, 25)
                    Text("Uh Oh, We Failed to Generate a QR Code. You Can Still Click Here To Get A Shareable Link")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture (count: 1){
                            UIPasteboard.general.setValue(model.ShareableLink,
                                        forPasteboardType: kUTTypePlainText as String)
                            model.RemoveCopied()
                            model.copied = true
                        }
                        .padding(.bottom, 7)
                        .multilineTextAlignment(.center)
                    
                }
                
                if(model.copied){
                Text("Copied To Clipboard!")
                    .foregroundColor(.green)
                }
            
                Spacer()
                HStack{
                    ZStack {
                        Image("AbstractShape")
                            .resizable()
                            .frame(width:UIScreen.main.bounds.width / 1.75, height: UIScreen.main.bounds.width / 1.75)
                            .padding(.top, 0)
                            .rotationEffect(.degrees(180))
                    }
                    Spacer()
                }
            }.ignoresSafeArea(.all, edges: .bottom)
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
    }
}

struct InviteFriends_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InviteFriends()
        }
    }
}