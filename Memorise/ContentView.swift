import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "💀", "🍸", "❄️", "✌️", "🍔", "♾️", "✨", "🇦🇺", "😅", "🫥", "🤯"]
    
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView{
                Cards
            }
            Spacer()
            CardCountAdjusters
        }
        .padding()
    }
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
        
    var CardCountAdjusters: some View {
        HStack{
            CardAdder
            Spacer()
            CardRemover
        }
            .imageScale(.large)
            .font(.largeTitle)
        }
    
    func cardCountAdjuster(by offset : Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var CardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var CardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
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
            
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
                .onTapGesture {
                    isFaceUp.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
