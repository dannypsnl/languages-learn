object Main extends App {
  var m = Map(
    "Dan" -> "Lin",
    "Jack" -> "Ola"
  )
  m += ("Harry" -> "Potter")
  println(m("Harry"))
}
