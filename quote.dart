main() {
  var s1 = 'Single quote';
  var s2 = "Double quotes work as well";
  var s3 = 'It\'s easy to escape this';
  var s4 = "It's not easy to escape this";

  print(s1);
  print(s2);
  print(s3);
  print(s4);
  print('');

  //Raw String
  var s5 = r'Mr. \n does not get special treatment';
  print(s5);
}
