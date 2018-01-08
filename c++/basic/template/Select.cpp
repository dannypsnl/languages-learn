#include <iostream>

template <bool flag, typename T, typename U> struct Select {
  typedef T Result;
};
template <typename T, typename U> struct Select<false, T, U> {
  typedef U Result;
};

int main() {
  // false, so we will Select int
  Select<false, char, int>::Result i{1};
  // true, so we will Select char
  Select<true, char, int>::Result c{'c'};
  std::cout << "Select<true, char, int> c = " << c << '\n'
            << "Select<false, char, int> i = " << i << std::endl;
}
