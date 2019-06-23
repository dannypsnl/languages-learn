import React from "react";

type TodoItemProps = {
  text: string,
  deleteDelegate?: (event: React.MouseEvent<HTMLButtonElement, MouseEvent>) => void
}

function TodoItem({ text, deleteDelegate }: TodoItemProps) {
  return (
    <div>
      <li>
        {text}
        <button onClick={deleteDelegate/*讓委派函數監聽此按鈕事件*/}>-</button>
      </li>
    </div>
  )
}

export default React.memo(TodoItem)