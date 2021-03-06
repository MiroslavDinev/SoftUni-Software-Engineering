﻿using System;

namespace _08MilitaryElite.Models.Privates.SpecialisedSoldiers
{
    public class Mission
    {
        private string state;
        public Mission(string codeName, string state)
        {
            this.CodeName = codeName;
            this.State = state;
        }

        public string CodeName { get;private set; }

        public string State
        {
            get
            {
                return this.state;
            }
            set
            {
                if(value!= "inProgress" && value!= "Finished")
                {
                    throw new ArgumentException();
                }

                this.state = value;
            }
        }

        public override string ToString()
        {
            return $"Code Name: {this.CodeName} State: {this.State}";
        }
    }
}
