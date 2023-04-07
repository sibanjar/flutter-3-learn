class Card{
  late String suit;
  late String rank;

  Card(this.suit,this.rank);

  printCard(){
    print('$suit $rank');
  }

  @override
  toString(){
    return '$rank of $suit';
  }
}

class Deck{
  List<Card> cards = [];

  Deck(){
    List<String> ranks = ['Ace','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten','Joker','Queen','King'];
    List<String> suits = ['Diamond','Hearts','Club','Spade'];

    for (String suit in suits){
      for(String rank in ranks){
        Card card = Card(suit,rank);
        cards.add(card);
      }
    }
  }

  @override
  toString(){
    return cards.toString();
  }

  shuffleCards(){
    cards.shuffle();
  }

  cardsWithSuit(String suit){
    return cards.where((card)=>card.suit == suit);
  }

  deal(int handSize){
    List hand = cards.sublist(0,handSize);
    cards = cards.sublist(handSize);
    return hand;
  }

  removeCard(String suit,String rank){
    return cards.removeWhere((card)=>(card.suit == suit && card.rank == rank));
  }

}

void main(){
  Deck deck = Deck();
//   deck.cards[0].printCard();

//   deck.shuffleCards();
//   print(deck.toString());

//   print(deck.cardsWithSuit('Diamond'));

//   print(deck.deal(5));
//   print(deck);

  deck.removeCard('Diamond','Ace');
  print(deck);

}