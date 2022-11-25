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