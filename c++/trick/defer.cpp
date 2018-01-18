#include <functional>
#include <iostream>
#include <stack>

class deferer {
  std::stack<std::function<void()>> defers;
  void callAll() {
    while (!this->defers.empty()) {

      this->defers.top()();
      this->defers.pop();
    }
  }

public:
  deferer() {}
  void add(std::function<void()> &&f) {
    this->defers.push(std::forward<decltype(f)>(f));
  }
  ~deferer() { callAll(); }
};

#define allow_defer() deferer __deferer{};
#define defer(...)                                                             \
  auto defered = std::bind(__VA_ARGS__);                                       \
  __deferer.add(defered);

int main() {
  allow_defer();
  defer([=]() { std::cout << "defer!!!!!!!!!!" << '\n'; });
  for (size_t i = 0; i < 10; ++i) {
    defer(
        [=]() { std::cout << "Number " << i + 1 << " defer be call" << '\n'; });
  }
  std::cout << "hello, defer" << '\n';
}
