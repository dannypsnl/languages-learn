// compile: clang++ -std=c++17 -stdlib=libc++ variant.cc

#include <iostream>
#include <variant>

int main() {
  // As you can see, v can be int or char, this ability is really powerful
  std::variant<int, char> v{'c'};
  std::cout << std::get<char>(v) << std::endl;
  v = 1;
  std::cout << std::get<int>(v) << std::endl;
}
