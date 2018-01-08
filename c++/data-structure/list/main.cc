#include "./list.h"

#include <iostream>

int main() {
  Node<int> first = Node<int>(10);
  Node<int> second = Node<int>(20);
  first.next(&second);

  std::cout << first.get_value() << std::endl;
  std::cout << first.get_next()->get_value() << std::endl;

  List<int> l{1,  2,  3,  5, 6, 7, 7, 87, 87, 8, 78, 7,
              35, 23, 23, 5, 4, 2, 5, 89, 1,  6, 6,  4};
  l.for_each();
}