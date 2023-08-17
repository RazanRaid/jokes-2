//
//  ContentView.swift
//  jokes
//
//  Created by Razan Raid on 13/07/2023.
//

import SwiftUI


struct ContentView: View {
    
    @State var showpunchline = false
    @State var index = 0
    @State var alert = false
    @State var sheet = false
    @State var isPositive = false
    @State var punchlineSize = 0.1
    @State var punchlineRotation = Angle.zero
    @State var punchlineOpacity = 0.0
    @State var taptocontinueOffset = 100.0
    
    
    
    
    var jokes = [ Joke(setup: "what did the sea say to the beach?", punchline: "Nothing, it just waved!"),
                  
                  Joke(setup: "why couldnt the bike stand up?", punchline: "it was too tired!"),
                  
                  Joke (setup: "what do u call a can opener that doesnt work?", punchline: "a can't opener!"),
                  
                  Joke(setup: "did u hear of the italian chef that died?", punchline: "he pasta-way :( "),
                  Joke(setup: "have u heard of the french cheese factroy explosion?", punchline: "there was nothing left  but de-brie!")
    ]
    
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .onTapGesture {
                    if showpunchline == true {
                        index+=1
                        showpunchline=false
                        
                    }
                    
                    if index == jokes.count{
                        index=0
                    }
                    
                    alert=true
                    
                }
            
            
            VStack {
                Text(jokes[index].setup)
                    .padding()
                
                Button {
                    withAnimation{
                        showpunchline=true}
                }label: {
                    Text("view punchline")
                        .padding()
                        .foregroundColor(.white)
                        .background(.yellow)
                        .cornerRadius(10)
                }
                .padding()
                
                
                if showpunchline == true {
                    Text(jokes[index].punchline)
                        .scaleEffect(punchlineSize)
                        .rotationEffect(punchlineRotation)
                        .opacity(punchlineOpacity)
                    
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1)){
                                punchlineSize = 1
                                punchlineRotation = Angle(degrees: 360)
                                punchlineOpacity=1
                            }
                        }
                        .onDisappear {
                            punchlineSize=0.1
                            punchlineRotation=Angle.zero
                            punchlineOpacity=0
                        }
                      
                }
                
                Text("tap to continue")
                    .italic()
                    .padding()
                    .opacity(showpunchline ? 1:0)
                    .offset(y :taptocontinueOffset)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 3)){
                            taptocontinueOffset=0
                        }
                    }
                    .onDisappear {
                        taptocontinueOffset=100
                    }
                
            }
            
        }
        .padding()
        .alert( Text("did u like the last joke?"), isPresented: $alert){
            Button("👍"){
                print("good")
                sheet=true
                isPositive=true
                
            }
            Button("❌"){
                print("what is wrong with you.")
                sheet=true
                isPositive=false
            }
        }message: {
            Text("pls rate us")}
        
        .sheet(isPresented: $sheet ){
            FeedbackResponseView(ispositive: isPositive)
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            ContentView().preferredColorScheme(.dark)
        }
    }
}
