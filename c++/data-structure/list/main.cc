#include "./list.h"

#include <iostream>

int main() {
  Node<int> first = Node<int>(10);
  Node<int> second = Node<int>(20);
  first.next(&second);

  std::cout << first.get_value() << std::endl;
  std::cout << first.get_next()->get_value() << std::endl;
}
