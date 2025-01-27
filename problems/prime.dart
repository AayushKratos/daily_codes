class Prime {
  int prime(int num) {
    int c = 0;
    for (int i = 1; i <= num; i++) {
      if (num % i == 0) {
        c++;
      }
    }

    return c;
  }
}

void main() {
  Prime obj = Prime();

  int prime = obj.prime(7);

  print(prime == 2 ? 'Prime number' : 'Not prime number');
}
