#include <algorithm>
#include <assert.h>
#include <map>

using std::map;

int main() {
  map<int, char> code;

  code['a'] = 10;
  code['b'] = 20;
  code['c'] = 30;
  code['d'] = 40;

  assert(code['b'] == 20);
}
