import strutils

type
  Person = object
    name*: string # Field is exported using `*`.
    age: Natural  # Natural type ensures the age is positive.
  PersonRef = ref Person

proc rename(person: PersonRef, name: string) =
  person.name = name

var people = [
  Person(name: "John", age: 45),
  Person(name: "Kate", age: 30)
]

for person in people:
  echo("$1 is $2 years old" % [person.name, $person.age])

var dan = PersonRef(name: "Dan", age: 20)
dan.rename("Danny")
echo(dan.name)
