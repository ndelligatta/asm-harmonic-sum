// =============================================== //
// Nolan Delligatta                                //
// CPSC 240-03                                     //
// ndelligatta@csu.fullerton.edu                   //
// Harmonic Sum Calculator                         //
// =============================================== //

#include <stdio.h>

extern double harmonic();

int main() {
  double result_code = -99.0;
  printf("Welcome to Harmonic Sum by Nolan Delligatta\n");
  result_code = harmonic();
  printf("The main program recieved this number %lf and will keep it.\n", result_code);
  printf("I hope you enjoyed this summation program. A zero will be sent to the OS. Bye.\n");
  return 0;
}