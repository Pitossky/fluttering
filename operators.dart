main() {
  int num = 10 + 22;
  num = num - 2;

  print(num);

  num = num % 5;
  print(num);

  // relational operators
  if (num == 0) {
    print('zero');

    num = 100;
    num *= 2;
    print(num);

    // Unary operators
    ++num;
    num++;
    num += 1;
    num -= 1;
    print(num);

    // logical operators
    if (num > 200 || num < 203) {
      print('200 to 203');
    }
  }
}
