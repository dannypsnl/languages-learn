type
    Person = object
        name: string
        age: int

proc `$`(p: Person): string =
    result = p.name & " is " &
        $p.age &
        " years old."

var p = Person(name: "Danny", age: 20)
echo(p)
