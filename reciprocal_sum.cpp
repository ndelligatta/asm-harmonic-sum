// =============================================== //
// Nolan Delligatta                                //
// CPSC 240-03                                     //
// ndelligatta@csu.fullerton.edu                   //
// Harmonic Sum Calculator                         //
// =============================================== //
#include <stdio.h>

extern "C" double reciprocal_sum(double sum);

double reciprocal_sum(double sum) {
  sum = 1 / sum;
  printf("\nThe reciprocal of the sum is %lf. Have a nice day.\n\n", sum);
  return sum;
}