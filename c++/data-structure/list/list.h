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
