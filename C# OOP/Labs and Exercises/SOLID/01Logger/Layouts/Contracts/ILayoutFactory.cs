﻿namespace _01Logger.Layouts.Contracts
{
    public interface ILayoutFactory
    {
        ILayout CreateLayout(string layoutType);
    }
}
