﻿namespace Animals.Animals
{
    public class Kitten : Cat
    {

        private const string kittenGender = "Female";
        public Kitten(string name, int age, string gender)
            : base(name,age,kittenGender)
        {
        }

        public override string ProduceSound()
        {
            return "Meow";
        }
    }
}
