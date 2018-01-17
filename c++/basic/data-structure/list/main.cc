#include "./list.h"

#include <iostream>

int main() {
  collec::List<int> l{
      1, 2, 3, 5, 6, 7, 7, 87, 87, 8, 78, 7,
  };
  l.for_each();
  std::cout << "l[0] = " << l.at(0) << std::endl;
  std::cout << "l[1] = " << l.at(1) << std::endl;
  std::cout << "l[2] = " << l.at(2) << std::endl;
  std::cout << "l[3] = " << l[3] << std::endl;
}
