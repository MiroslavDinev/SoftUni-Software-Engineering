﻿using System;
using System.Linq;

namespace _3MaximalSum
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] props = Console.ReadLine().Split().Select(int.Parse).ToArray();

            int rows = props[0];
            int cols = props[1];

            int[,] matrix = new int[rows, cols];

            for (int row = 0; row < rows; row++)
            {
                int[] currRow = Console.ReadLine().Split(" ",StringSplitOptions.RemoveEmptyEntries).Select(int.Parse).ToArray();

                for (int col = 0; col < cols; col++)
                {
                    matrix[row, col] = currRow[col];
                }
            }

            int bestSum = int.MinValue;
            int bestRow = -1;
            int bestCol = -1;

            for (int row = 0; row < matrix.GetLength(0)-2; row++)
            {
                for (int col = 0; col < matrix.GetLength(1)-2; col++)
                {
                    int currSum = matrix[row, col] + matrix[row, col + 1] + matrix[row, col + 2] + matrix[row + 1, col] +
                        matrix[row + 1, col + 1] + matrix[row + 1, col + 2] + matrix[row + 2, col] 
                        + matrix[row + 2, col + 1] + matrix[row + 2, col + 2];

                    if (currSum>bestSum)
                    {
                        bestSum = currSum;
                        bestRow = row;
                        bestCol = col;
                    }
                }
            }

            Console.WriteLine($"Sum = {bestSum}");

            for (int row = bestRow; row < bestRow+3; row++)
            {
                for (int col = bestCol; col < bestCol+3; col++)
                {
                    Console.Write(matrix[row,col] + " ");
                }

                Console.WriteLine();
            }
        }
    }
}
