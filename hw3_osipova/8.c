#include <stdio.h>
#include <math.h>
#include <time.h>
#include <string.h>
#include <stdlib.h>

double pi_N(){
  double pi = 3.0;
  double a = 2;
  double b = 3;
  double c = 4;
  for(int i = 0; i < 1000;i++){
    pi += 4 / (a * b * c);
    a += 2;
    b += 2;
    c += 2;
    pi -= 4 / (a * b * c);
    a += 2;
    b += 2;
    c += 2;
  }
  return pi;
}

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


int main(int argc, char *argv[]) {
  if((argc != 2) && (argc != 4)&& (argc != 3)){
    printf("Incrorrect input, check README.md\n");
    return 0;
  }
  clock_t start, end;
  if(strcmp(argv[1], "-r") == 0){
    if(argc != 3){
      printf("Incrorrect input, check README.md\n");
      return 0;
    }
    srand(time(NULL));
    FILE *out = fopen(argv[2], "w");
    if((out == NULL)){
      printf("incorrect file\n");
      return 0;
    }
    int N = (rand()%8+1);
    fprintf(out, "random number: N = %d\n", N);
    start = clock();
    double pi = pi_N();
    end = clock();
    double t = (double)(end-start)/(CLOCKS_PER_SEC);
    print_f(out, pi, N, t);
    fclose(out);
  }
  else if(strcmp(argv[1], "-h") == 0){
    printf("\n-h help\n");
    printf("-r create random numbers (a, b, A, B)\n");
    printf("-f use numbers from first file and save result in second file\n");
    printf("-s take numbers from terminal and print result in file\n");
  }
  else if(strcmp(argv[1], "-f") == 0){
    if(argc != 4){
      printf("Incrorrect input, check README.md\n");
      return 0;
    }
    FILE *input = fopen(argv[2], "r");
    FILE *out = fopen(argv[3], "w");
    if((input == NULL) || (out == NULL)){
      printf("incorrect file\n");
      return 0;
    }
    int N;
    fscanf(input, "%d", &N);
    if((N > 9) || (N < 1)){
      printf("incorrect input, N must be 1 - 9\n");
      return 0;
    }
    start = clock(); 
    double pi = pi_N();
    end = clock();
    double t = (double)(end-start)/(CLOCKS_PER_SEC);
    print_f(out, pi, N, t);
    fclose(input);
    fclose(out);
  }
  else if((strcmp(argv[1], "-s") == 0)){
    if(argc != 3){
      printf("Incrorrect input, check README.md\n");
      return 0;
    }
    FILE *out = fopen(argv[2], "w");
    if((out == NULL)){
      printf("incorrect file\n");
      return 0;
    }
    int N;
    scanf("%d", &N);
    if((N > 9) || (N < 1)){
      printf("incorrect input, N must be 1 - 9\n");
      return 0;
    }
    start = clock(); 
    double pi = pi_N();
    end = clock();
    double t = (double)(end-start)/(CLOCKS_PER_SEC);
    print_f(out, pi, N, t);
    fclose(out);
  }
  return 0;
}


