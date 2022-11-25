#include <stdio.h>

void print_f(FILE * out, double pi, int N, double t){
  int arr[9];
  for(int i = 0; i < N; i++){
    if(i == 1){
      fprintf(out, ".");
    }
    arr[i] = pi;
    pi *= 10;
    arr[i] = arr[i]%10;
    fprintf(out, "%d", arr[i]);
  }
  fprintf(out, "\ntime: %.6lf\n", t);
}