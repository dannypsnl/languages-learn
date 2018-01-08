#include <iostream>

#define NEW_FUNC(__name, __id)                                                 \
  void __name##__id() { std::cout << "func: " << __id << std::endl; }

NEW_FUNC(foo, 1)
NEW_FUNC(foo, 2)

int main() {
  foo1();
  foo2();
}
