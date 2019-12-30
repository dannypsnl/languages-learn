let valueFromEvent = (evt) =>
  evt->ReactEvent.Form.target##value;

[@react.component]
let make = () => {
  let (todoText, setTodoText) = React.useState(() => "");
  let (todoList, setTodoList) = React.useState(() => []);

  <>
    <input
      value={todoText}
      onChange={event => setTodoText(valueFromEvent(event))}
    />
    <button
      onClick={_event => {
        // add todo item into list
        setTodoList((l) => [(Js.Date.now(), todoText), ...l]);
        // clear text
        setTodoText((_text) => "");
      }}
    >{React.string("Add Todo")}</button>
    <p>{React.string("Next Todo is: " ++ todoText)}</p>
    <ul>{React.array(Array.of_list(
      List.map(((date, item: string)) => {
        <li>
          <TodoItem name={item} deleteTodo={
            _event => {setTodoList((l) => List.remove_assoc(date, l))}
          }/>
        </li>
      }, todoList)
    ))}</ul>
  </>
};