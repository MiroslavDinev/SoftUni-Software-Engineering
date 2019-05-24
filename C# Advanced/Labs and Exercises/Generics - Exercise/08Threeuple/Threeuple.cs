﻿namespace _08Threeuple
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    public class Threeuple<T,K,V>
    {
        private T item1;

        private K item2;

        private V item3;

        public Threeuple(T item1, K item2, V item3)
        {
            this.item1 = item1;
            this.item2 = item2;
            this.item3 = item3;
        }

        public override string ToString()
        {
            return $"{item1} -> {item2} -> {item3}";
        }
    }
}
