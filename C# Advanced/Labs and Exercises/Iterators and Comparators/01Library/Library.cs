﻿namespace IteratorsAndComparators
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    public class Library : IEnumerable<Book>
    {

        private List<Book> books;

        public Library(params Book[] books)
        {
            this.books = books.ToList();
        }

        public void Add (Book book)
        {
            this.books.Add(book);
        }
        public IEnumerator<Book> GetEnumerator()
        {
            foreach (var book in this.books)
            {
                yield return book;
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();
        }
    }
}
