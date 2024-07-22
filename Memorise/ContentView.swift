import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = []
    let expressionEmojis = ["😅", "🤯", "🤓", "😝", "🙂‍↔️", "😅", "🤯", "🤓", "😝", "🙂‍↔️"]
    let halloweenEmojis = ["🧛‍♀️", "🧟‍♀️", "🦇", "🕸️", "🧛‍♀️", "🧟‍♀️", "🦇", "🕸️"]
    let foodEmojis = ["🍔", "🍕", "🍉", "🍗", "🥨", "🍧", "🍪", "🍔", "🍕", "🍉", "🍗", "🥨", "🍧", "🍪"]

    var body: some View {
        VStack {
            title
            ScrollView{
                cards
            }
            themeSelectorButtons
        }
        .padding()
    }
    
    var title: some View{
        Text("Memorize!")
            .font(.title)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func getThemeSelectorButton(themeEmojis: [String], symbol: String, text: String) -> some View {
        return Button(action: {
            emojis = themeEmojis.shuffled()
        }, label: {
            VStack{
                Image(systemName: symbol)
                Text(text)
            }
        })
    }
    
    var themeSelectorButtons: some View {
        HStack{
            selectExpressionsThemeButton
            Spacer()
            selectHalloweenThemeButton
            Spacer()
            selectFoodThemeButton
        }
        .padding()

    }
    
    var selectExpressionsThemeButton: some View{
        return getThemeSelectorButton(themeEmojis: expressionEmojis, symbol: "face.smiling", text: "Expressions")
    }

    var selectHalloweenThemeButton: some View{
        return getThemeSelectorButton(themeEmojis: halloweenEmojis, symbol: "moon.fill", text: "Halloween")
    }

    var selectFoodThemeButton: some View{
        return getThemeSelectorButton(themeEmojis: foodEmojis, symbol: "fork.knife", text: "Food")
    }
}
    struct CardView: View {
        let content: String
        @State var isFaceUp = false
        
        var body: some View {
            let base = RoundedRectangle(cornerRadius: 12)
            ZStack(alignment: .center) {
                Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                
                base.fill().opacity(isFaceUp ? 0 : 1)
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


