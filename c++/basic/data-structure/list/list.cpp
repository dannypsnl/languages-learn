#include <stdexcept>

namespace collec {

namespace {

template <class T> Node<T>::Node() {}

template <class T> Node<T>::Node(T v) : value{v} {}

template <class T> void Node<T>::next(Node *n) { this->next_node = n; }

template <class T> T Node<T>::get_value() { return value; }

template <class T> Node<T> *Node<T>::get_next() { return next_node; }

} // namespace

template <class T> List<T>::List(std::initializer_list<T> l) {
  auto iter = l.begin();
  this->first = new Node<T>(*iter);
  auto now = first;
  for (iter = ++iter; iter != l.end(); ++iter) {
    now->next(new Node<T>(*iter));
    now = now->get_next();
  }
}

template <class T> List<T>::~List() {
  auto tmp = this->first;
  while (tmp->get_next() != nullptr) {
    tmp = tmp->get_next();
    delete tmp;
  }
}

template <class T> T List<T>::at(int index) {
  int cursor = 0;
  auto now = this->first;
  while (now->get_next() != nullptr) {
    if (index == cursor) {
      return now->get_value();
    }
    now = now->get_next();
    cursor++;
  }
  throw std::out_of_range("Out of range");
}

// TODO: accept functor at for_each
template <class T> void List<T>::for_each() {
  for (auto now = first; now->get_next() != nullptr; now = now->get_next()) {
    std::cout << now->get_value() << std::endl;
  }
}

} // namespace collec
