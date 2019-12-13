//
// Created by dannypsnl on 2019/12/13.
//

#include <iostream>

#include "Functor.h"

int add_one(int i) { return i + 1; }

int main() {
  int i = 1;
  auto wow = Option<int>(&i);
  auto result = wow.fmap<int>(add_one);
  std::cout << result->to_string() << '\n';
  wow = Option<int>();
  result = wow.fmap<int>(add_one);
  std::cout << result->to_string() << '\n';
}