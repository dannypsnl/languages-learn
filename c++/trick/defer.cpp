#include <functional>
#include <iostream>

template <class T> class defer {
  T defered;

public:
  defer(T f) : defered{f} {}
  ~defer() { this->defered(); }
};

int main() {
  defer<std::function<void()>> d{[]() { std::cout << "defer!!!" << '\n'; }};
  std::cout << "hello, defer" << '\n';
}
