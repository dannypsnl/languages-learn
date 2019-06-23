import React, { useState } from "react";
import showdown from "showdown";

const converter = new showdown.Converter();

export default function Editor() {
  const [editString, setEditString] = useState("");

  return (
    <div>
      <div
        style={{
          float: "left",
          padding: "45px",
          width: "40%"
        }}
      >
        <textarea
          value={editString}
          onChange={(event: React.ChangeEvent<HTMLTextAreaElement>) => {
            setEditString(event.target.value);
          }}
          rows={50}
          style={{ width: "100%" }}
        />
      </div>
      <div
        style={{
          float: "right",
          padding: "45px",
          width: "40%"
        }}
        dangerouslySetInnerHTML={{
          __html: converter.makeHtml(editString)
        }}
      />
    </div>
  )
}