//
//  Quotes.swift
//  AppLovin Mediation Waterfall Demo
//
//  Created by José Jacobo Contreras Trejo on 26.10.22.
//

import Foundation


struct Quote {
    
    let quoteText: String
    let quoteAuthor: String
    
    func getQuotes() -> [Quote] {
        return [Quote(quoteText:"Our world is built on biology and once we begin to understand it, it then becomes a technology" ,quoteAuthor:"Ryan Bethencourt"),
                Quote(quoteText:"Happiness is not an ideal of reason but of imagination" ,quoteAuthor:"Immanuel Kant"),
                Quote(quoteText:"Science and technology revolutionize our lives, but memory, tradition and myth frame our response." ,quoteAuthor:"Arthur M. Schlesinger"),
                Quote(quoteText:"It's not a faith in technology. It's faith in people" ,quoteAuthor:"Steve Jobs"),
                Quote(quoteText:"We can't blame the technology when we make mistakes." ,quoteAuthor:"Tim Berners-Lee"),
                Quote(quoteText:"Life must be understood backward. But it must be lived forward." ,quoteAuthor:"Søren Kierkegaard"),
                Quote(quoteText:"Happiness can be found, even in the darkest of times, if one only remembers to turn on the light." ,quoteAuthor:"Albus Dumbledore"),
                Quote(quoteText:"To live a creative life, we must lose our fear of being wrong." ,quoteAuthor:"Joseph Chilton Pearce"),
                Quote(quoteText:"It is undesirable to believe a proposition when there is no ground whatever for supposing it true." ,quoteAuthor:"Bertrand Russell"),
                Quote(quoteText:"There's always a bigger fish." ,quoteAuthor:"Qui-Gon Jinn"),
                Quote(quoteText:"A wizard is never late. Nor is he early. He arrives precisely when he means to." ,quoteAuthor:"Gandalf"),
                Quote(quoteText:"Moonlight drowns out all but the brightest stars." ,quoteAuthor:"J. R. R. Tolkien, The Lord of the Rings"),
                Quote(quoteText:"A hunted man sometimes wearies of distrust and longs for friendship." ,quoteAuthor:"J. R. R. Tolkien, The Lord of the Rings"),
                Quote(quoteText: "", quoteAuthor: "")]
    }
}
