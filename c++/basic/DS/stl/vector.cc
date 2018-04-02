#include <algorithm>
#include <iostream>
#include <vector>

using std::vector;

void print(int i) { std::cout << i; }

int main() {
  vector<int> L{1, 2, 3, 4, 5};
  L.push_back(-1);
  std::for_each(L.begin(), L.end(), print);
  std::cout << '\n';
}
