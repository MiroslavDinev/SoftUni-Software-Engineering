﻿namespace _06BirthdayCelebrations
{
    public class Robot : IId
    {
        public Robot(string model, string id)
        {
            this.Model = model;
            this.ID = id;
        }

        public string ID { get; private set; }
        public string Model { get; private set; }
    }
}
