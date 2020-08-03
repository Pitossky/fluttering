main() {
  List<String> names = ['Jack', 'Jill'];

  var names2 = [...names];

  names[1] = 'Mark';

  for (var n in names2) {
    print(n);
  }
  print('');
  var names3 = names;

  names[1] = 'Mark';

  for (var n in names3) {
    print(n);
  }
}
