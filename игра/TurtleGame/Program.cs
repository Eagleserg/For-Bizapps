using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SmallBasic.Library;


namespace TurtleGame
{
    class Program
    {
        static void Main(string[] args)
        {
            GraphicsWindow.KeyDown += GraphicsWindow_KeyDown;
            Turtle.PenUp();

            var eat = Shapes.AddRectangle(10, 10);
            var eatX = 200;
            var eatY = 200;
            Shapes.Move(eat, eatX, eatY);

            Random rand = new Random();

            while (true)
            {
                Turtle.Move(10);
                if (Turtle.X >= eatX && Turtle.X <= eatX + 10 && Turtle.Y >= eatY && Turtle.Y <= eatY + 10)
                {
                    eatX = rand.Next(GraphicsWindow.Width);
                    eatY = rand.Next(GraphicsWindow.Height);
                    Shapes.Move(eat, eatX, eatY);
                    Turtle.Speed++;
                }

                

            }
        }

        private static void GraphicsWindow_KeyDown()
        {
            if (GraphicsWindow.LastKey == "Up")
            {
                Turtle.Angle = 0;
            }
            else if (GraphicsWindow.LastKey == "Right")
            {
                Turtle.Angle = 90;
            }
            else if (GraphicsWindow.LastKey == "Down")
            {
                Turtle.Angle = 180;
            }
            else if (GraphicsWindow.LastKey == "Left")
            {
                Turtle.Angle = 270;
            }
            
        }
    }
}
