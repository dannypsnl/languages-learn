[@react.component]
let make = (~name, ~deleteTodo) => {
  <>
	{React.string(name)}
	<button
	  onClick={deleteTodo}
	>{React.string("-")}</button>
  </>
}