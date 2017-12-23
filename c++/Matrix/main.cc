#include <iostream>

template <int x, int y> class Matrix {
  // We don't care how to implement at here
public:
  std::string print() { return std::string("Matrix"); }
};

template <int x, int y> Matrix<x, y> Add(Matrix<x, y> a, Matrix<x, y> b) {
  return a; // Just help compile can run it.
}

int main() {
  std::cout << Add(Matrix<2, 2>(), Matrix<2, 2>()).print() << std::endl;
  std::cout << Add(Matrix<3, 2>(), Matrix<2, 3>()).print() << std::endl;
}
