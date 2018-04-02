function dump() {
  console.log(this);
}

let obj = {
  dump: dump,
};

obj.dump();

let copyDump = obj.dump;
copyDump();
