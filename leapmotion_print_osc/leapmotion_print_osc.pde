//Created by Lise Ho
//adapted from examples from https://github.com/heuermh/leap-motion-processing

/*

    Leap Motion library for Processing.
    Copyright (c) 2012-2015 held jointly by the individual authors.

    This file is part of Leap Motion library for Processing.

    Leap Motion library for Processing is free software: you can redistribute it and/or
    modify it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Leap Motion library for Processing is distributed in the hope that it will be
    useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Leap Motion library for Processing.  If not, see
    <http://www.gnu.org/licenses/>.

*/

//adapted from examples from https://github.com/heuermh/leap-motion-processing


import com.leapmotion.leap.Controller;
import com.leapmotion.leap.Finger;
import com.leapmotion.leap.Frame;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.HandList;
import com.leapmotion.leap.Controller;
import com.leapmotion.leap.processing.LeapMotion;

LeapMotion leapMotion;

void setup()
{
  size(800,450);
  background(20);

  leapMotion = new LeapMotion(this);
}

void draw()
{
  background(0);
}

void onFrame(final Controller controller)
{
  Frame frame = controller.frame();
  HandList hands = frame.hands();
  if (!hands.isEmpty())
  {
    Hand leftHand = hands.leftmost();
    //sendHand("/hand0", leftHand);
    print ("Leftmost Hand:--------------\n");
    printHand("/hand0", leftHand);
    
    for (int i = 0, size = leftHand.fingers().count(); i < size; i++)
    {
      printFinger("/finger0-" + i, leftHand.fingers().get(i));
      //sendFinger("/finger0-" + i, leftHand.fingers().get(i));
    }

    if (hands.count() > 1)
    {
      Hand rightHand = hands.rightmost();
      //sendHand("/hand1", rightHand);
      print ("Rightmost hand");
      printHand("/hand1", rightHand);
       
      for (int i = 0, size = rightHand.fingers().count(); i < size; i++)
      {
       
        printFinger("/finger1-" + i, rightHand.fingers().get(i));
        //sendFinger("/finger1-" + i, rightHand.fingers().get(i));
      }
      print("--------------\n");//separator print statement
    }
  }
}

void printHand(String addr, final Hand hand){
  print (hand.stabilizedPalmPosition().getX());
  print (", ");
  print (hand.stabilizedPalmPosition().getY());
  print (", ");
  print (hand.stabilizedPalmPosition().getZ());
  print ("\n");
}
void printFinger(String addr, final Finger finger){
  print("Finger: ");
  print (finger.stabilizedTipPosition().getX());
  print (", ");
  print (finger.stabilizedTipPosition().getY());
  print (", ");
   print (finger.stabilizedTipPosition().getZ());
   print ("____\n");
 /*
   float x = finger.stabilizedTipPosition().getX();
   float y = finger.stabilizedTipPosition().getY();
   float z = finger.stabilizedTipPosition().getZ();
    */
}