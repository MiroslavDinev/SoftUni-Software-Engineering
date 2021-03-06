﻿using System;
using System.Xml.Serialization;

namespace CarDealer.Dtos.Import
{
    [XmlType("Customer")]
    public class CustomerDto
    {
        [XmlElement("name")]
        public string Name { get; set; }

        [XmlElement("birthDate")]
        public DateTime BirthDate { get; set; }

        [XmlElement("isYoungDriver")]
        public bool isYoungDriver { get; set; }
    }
}
