import React from "react";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";
import TodoList from "./TodoList";
import Editor from "./Editor";

const Home = () => <div>Home Page</div>;

const inlineStyle = {
  display: 'inline',
  maxWidth: '600px',
  margin: '0 auto',
}

const Routes = () => (
  <Router>
    <div>
      <ul>
        <li style={inlineStyle}><Link to="/">Home</Link></li>
        <li style={inlineStyle}><Link to="/todolist">TodoList</Link></li>
        <li style={inlineStyle}><Link to="/editor">Editor</Link></li>
      </ul>

      <Route exact path="/" component={Home} />
      <Route path="/editor" component={Editor} />
      <Route path="/todolist" component={TodoList} />
    </div>
  </Router>
);

export default function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1 className="App-title">Welcome to React-Todo</h1>
      </header>
      <Routes />
    </div>
  )
}