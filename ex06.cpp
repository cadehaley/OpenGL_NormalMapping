//
//  HW4:  OpenGL 4
//  By Cade Haley
//  Partner: Jose Canizares
//  Adapted from code by Willem A. (Vlakkies) Schreuder
//  CSCI 4239/5239 Spring 2017
//

#include <QApplication>
#include "ex06viewer.h"

//
//  Main function
//
int main(int argc, char *argv[])
{
   //  Create the application
   QApplication app(argc,argv);
   //  Create and show view widget
   Ex06viewer view;
   view.show();
   //  Main loop for application
   return app.exec();
}
