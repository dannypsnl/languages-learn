#include <iostream>

template <int n> struct Fib {
  enum { value = Fib<n - 1>::value + Fib<n - 2>::value };
};
template <> struct Fib<1> {
  enum { value = 1 };
};
template <> struct Fib<0> {
  enum { value = 1 };
};

int main() {
  std::cout << Fib<0>::value << '\n';
  std::cout << Fib<1>::value << '\n';
  std::cout << Fib<5>::value << '\n';
  std::cout << Fib<10>::value << '\n';
}
