class objective {
    public static void main(String[] argv) {
        Person dan = new Person("Danny");
        dan.say_name();
    }
}

class Person {
    String name;
    public Person(String name) {
        this.name = name;
    }
    public void say_name() {
        System.out.println(this.name);
    }
}
