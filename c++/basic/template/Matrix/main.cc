// Compile: clang++ main.cc
#include <iostream>

template <int x, int y> class Matrix {
  // We don't care how to implement at here
};

template <int x, int y> Matrix<x, y> Add(Matrix<x, y> a, Matrix<x, y> b) {
  return a; // Just help compile can run it.
}

int main() {
  std::cout << "Matrix" << std::endl;
  Add(Matrix<2, 2>(), Matrix<2, 2>());
  // This line never pass, interesting part.
  Add(Matrix<3, 2>(), Matrix<2, 3>());
}
