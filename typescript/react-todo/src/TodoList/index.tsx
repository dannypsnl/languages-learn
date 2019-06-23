import React, { useState, useReducer } from "react";
import TodoItem from "./Todo";

// 這裡限制Action的型別，一定有type所以是string
//
// 不一定有index跟todoStr，所以是?(optional)
// Because we would use it as ADD or DELETE action
type TodoAction = {
  type: string,
  index?: number,
  todoStr?: string
};
// reducer 舊狀態:型別=初始狀態 action:限制
function todocer(oldState: string[] = [], action: TodoAction): string[] {
  // 根據action的訊息選擇動作
  switch (action.type) {
    case "ADD_TODO":
      // 展開舊狀態，加上新元素
      return [...oldState, action.todoStr];
    case "DELETE_TODO":
      // 過濾舊狀態，回傳不是我們要刪除的索引，跟action帶的參數做比較
      return oldState.filter((_, index) => index !== action.index);
    default:
      return oldState;
  }
};

export default function TodoList() {
  const enter = 13;
  // init todo text
  const [todoText, setTodoText] = useState("");
  const [todoStore, dispatch] = useReducer(todocer, []);
  // remember `addTodo` dependent on `todoStr` this state, don't move it out of the scope
  let addTodo = () => {
    if (todoText !== "") {
      dispatch({ type: "ADD_TODO", todoStr: todoText });
      // clean input text after create a new todo item
      setTodoText("");
    }
  }
  // deleteTodo is a high order function
  // receive an index, return a function listen on click event
  let deleteTodo = (index: number) => (_: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
    dispatch({ type: "DELETE_TODO", index: index });
  };

  return (
    <div>
      <input
        value={todoText}
        onChange={(e) => setTodoText(e.target.value)}
        onKeyDown={(e) => e.keyCode === enter ? addTodo() : null} />
      <p>Next Todo is: {todoText}</p>
      <button
        onClick={(_: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
          addTodo();
        }}>
        Add Todo
      </button>
      <ul>
        {todoStore
          .map((todoText: string, index: number) => (
            <TodoItem
              key={index}
              text={todoText}
              deleteDelegate={
                deleteTodo(index) /*bind index and delete function*/
              }
            />
          ))}
      </ul>
    </div>
  );
}
