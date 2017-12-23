// compile: clang++ -std=c++17 -stdlib=libc++ variant.cc

// This path is because I didn't setting my system
#include <c++/v1/variant>
#include <iostream>

int main() {
  // As you can see, v can be int or char, this ability is really powerful
  std::variant<int, char> v{'c'};
  std::cout << std::get<char>(v) << std::endl;
  v = 1;
  std::cout << std::get<int>(v) << std::endl;
}
