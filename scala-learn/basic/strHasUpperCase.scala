object Main extends App {
  val str = "HhlHLFHkaflfklrqrqiLAKSDWEHJBSKSashdjahjdksqeqm,x.W"
  val hasUpperCase = str.exists(_.isUpper)
  printf("Has upper case: %s\n", hasUpperCase)
}
