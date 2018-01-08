#include <iostream>

template <class T> class Node {
  T value;
  Node *next_node = nullptr;

public:
  Node(T);
  void next(Node<T> *);
  T get_value();
  Node<T> *get_next();
};

template <class T> Node<T>::Node(T v) : value{v} {}

template <class T> void Node<T>::next(Node *n) { this->next_node = n; }

template <class T> T Node<T>::get_value() { return value; }

template <class T> Node<T> *Node<T>::get_next() { return next_node; }

int main() {
  Node<int> first = Node<int>(10);
  Node<int> second = Node<int>(20);
  first.next(&second);

  std::cout << first.get_value() << std::endl;
  std::cout << first.get_next()->get_value() << std::endl;
}
