object Main extends App {
  args.foreach((arg) => {
    printf("%s len: %d\n", arg, arg.length)
  })
}
