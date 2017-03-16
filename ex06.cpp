//
//  HW8:  Normal Mapping in OpenGL
//  By Cade Haley
// Resources:
// https://learnopengl.com/#!Advanced-Lighting/Normal-Mapping
// http://gamedev.stackexchange.com/questions/86530/is-it-possible-to-calculate-the-tbn-matrix-in-the-fragment-shader

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
