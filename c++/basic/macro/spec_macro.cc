#include <iostream>

int main() {
  // Print line of code
  std::cout << __LINE__ << std::endl;
  // Print this function ref name
  std::cout << __func__ << std::endl;
  // Print the source file name
  std::cout << __FILE__ << std::endl;
}
