import Adapter from "enzyme-adapter-react-16";
// 應enzyme之要求，在這裡建立Adapter，避免要修改多處測試檔案
// 注意new Adapter其實只執行一次
export default new Adapter();
