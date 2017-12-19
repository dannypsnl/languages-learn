function dump() {
  console.log(this);
}

let obj = {
  dump: dump,
};

obj.dump();
