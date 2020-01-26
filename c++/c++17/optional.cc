// compile: clang++ -std=c++17 -stdlib=libc++ optional.cc

#include <iostream>
#include <optional>

using std::optional;

void example1();
void example2();
void example3();

int main() {
  example1();
  example2();
}

void example1() {
  optional<int> i{1};
  if (i) {
    std::cout << i.value() << std::endl;
  }
}

void example2() {
  optional<int> i{std::nullopt};
  std::cout << i.value_or(10) << std::endl;
}
