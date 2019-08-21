﻿using PlayersAndMonsters.Models.Cards.Contracts;
using PlayersAndMonsters.Repositories.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PlayersAndMonsters.Repositories
{
    public class CardRepository : ICardRepository
    {
        private List<ICard> cards;

        public CardRepository()
        {
            this.cards = new List<ICard>();
        }
        public int Count => this.cards.Count;

        public IReadOnlyCollection<ICard> Cards => this.cards.AsReadOnly();

        public void Add(ICard card)
        {
            if(card == null)
            {
                throw new ArgumentException("Card cannot be null!");
            }

            if(this.Cards.Any(x=>x.Name == card.Name))
            {
                throw new ArgumentException($"Card {card.Name} already exists!");
            }

            this.cards.Add(card);
        }

        public ICard Find(string name)
        {
            ICard card = this.cards.FirstOrDefault(x => x.Name == name);

            return card;
        }

        public bool Remove(ICard card)
        {
            if(card==null)
            {
                throw new ArgumentException("Card cannot be null!");
            }

            bool isRemoved = this.cards.Remove(card);

            return isRemoved;
        }
    }
}
