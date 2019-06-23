import React from "react";
import ReactDOM from "react-dom";
import Enzyme, { configure, shallow } from "enzyme";
import adapter from "../../enzyme-adapter";
import TodoItem from "./index";

// enzyme要求要根據React版本設定不同的adapter
// 因此我們把它放在src下的enzyme-adapter中，避免要修改多個檔案
configure({ adapter });

describe("Component <TodoItem>", () => {
  it("should contains <li>{props.text}</li>", () => {
    // 提供props渲染Todo
    const output = shallow(<TodoItem text="a todo" />);
    // 預期內部所擁有的html
    expect(output.contains(<li>a todo<button>-</button></li>)).toBe(true);
  });
});
