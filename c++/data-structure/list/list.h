#include <initializer_list>
#include <iostream>

template <class T> class Node {
  T value;
  Node *next_node = nullptr;

public:
  Node();
  Node(T);
  void next(Node<T> *);
  T get_value();
  Node<T> *get_next();
};

template <class T> Node<T>::Node() {}

template <class T> Node<T>::Node(T v) : value{v} {}

template <class T> void Node<T>::next(Node *n) { this->next_node = n; }

template <class T> T Node<T>::get_value() { return value; }

template <class T> Node<T> *Node<T>::get_next() { return next_node; }

template <class T> class List {
  Node<T> *first = new Node<T>();

public:
  List(std::initializer_list<T>);
  void for_each();
};

template <class T> List<T>::List(std::initializer_list<T> l) {
  first = new Node<T>(*l.begin());
  auto now = first;
  for (auto iter = l.begin(); iter != l.end(); ++iter) {
    now->next(new Node<T>(*iter));
    now = now->get_next();
  }
}

template <class T> void List<T>::for_each() {
  for (auto now = first; now->get_next() != nullptr; now = now->get_next()) {
    std::cout << now->get_value() << std::endl;
  }
}
