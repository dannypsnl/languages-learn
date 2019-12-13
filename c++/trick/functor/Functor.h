//
// Created by dannypsnl on 2019/12/13.
//

#ifndef C_TRICK_FUNCTOR_FUNCTOR_H_
#define C_TRICK_FUNCTOR_FUNCTOR_H_

#include <functional>
#include <memory>
#include <string>

using std::function;
using std::string;
using std::unique_ptr;

template <typename A> class Functor {
public:
  template <typename B> B fmap(function<B(A)>);
};

template <typename V> class Option : public Functor<V> {
  V *_v;

public:
  Option() : _v(nullptr) {}
  Option(V *v) : _v(v) {}

  template <typename B> unique_ptr<Option<B>> fmap(function<B(V)> func) {
    if (_v) {
      V *vp = new V(func(*_v));
      return std::make_unique<Option<B>>(Option(vp));
    } else {
      return std::make_unique<Option<B>>(Option());
    }
  }

  string to_string() {
    if (_v) {
      return (string("Some(") + std::to_string(*_v) + ")");
    } else {
      return string("None");
    }
  }
};

#endif // C_TRICK_FUNCTOR_FUNCTOR_H_
