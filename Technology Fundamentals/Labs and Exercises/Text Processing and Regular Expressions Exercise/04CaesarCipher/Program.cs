﻿using System;

namespace _04CaesarCipher
{
    class Program
    {
        static void Main(string[] args)
        {
            string text = Console.ReadLine();
            string result = string.Empty;

            for (int i = 0; i < text.Length; i++)
            {
                char currSymbol = text[i];
                char encrypted =(char) (currSymbol + 3);
                result += encrypted;
            }

            Console.WriteLine(result);
        }
    }
}
