#pragma once

#include <initializer_list>
#include <iostream>

namespace collec {

namespace {

template <class T> class Node;

} // namespace

template <class T> class List {
  Node<T> *first;

public:
  List(std::initializer_list<T>);
  ~List();
  T operator[](int index) { return this->at(index); }
  T at(int index);
  void for_each();
};

} // namespace collec

#include "./list.tcc"
