#include <iostream>

#define NEW_FUNC(__name,                                                       \
                 __id) /* append __name and __id to be function name */        \
  void __name##__id() {                                                        \
    std::cout << "func_" << #__name ": " << #__id << std::endl;                \
  }

NEW_FUNC(foo, 1) // foo1
NEW_FUNC(foo, 2) // foo2

int main() {
  foo1();
  foo2();
}
