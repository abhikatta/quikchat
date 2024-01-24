// ignore_for_file:avoid_print

class Animal {
  String name;
  bool isBlack;
  Animal(this.name, this.isBlack);
  void printstufff() => {name += 'asd'};

  void printStuff() {
    print('$name is ${isBlack == false ? ' not' : ''} black.');
  }
}
