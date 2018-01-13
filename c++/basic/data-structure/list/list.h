#pragma once

#include <initializer_list>
#include <iostream>

namespace collec {

namespace {

template <class T> class Node {
  T value;
  // next_node default is nullptr
  Node *next_node = nullptr;

public:
  // Just because compiler won't create one for you
  Node();
  Node(T);
  void next(Node<T> *);
  T get_value();
  Node<T> *get_next();
};

} // namespace

template <class T> class List {
  Node<T> *first;

public:
  List(std::initializer_list<T>);
  void for_each();
};

} // namespace collec

#include "./list.cpp"
