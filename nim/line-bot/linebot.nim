import jester, asyncdispatch, htmlgen, json
import httpcore

routes:
    get "/":
        resp h1("Hello World")
    post "/line":
        try:
            let j = parseJson(request.body)
            echo j["events"].getElems()[0]["replyToken"]
            echo j["events"].getElems()[0]["messages"]
            resp $j
        except:
            resp Http400, "Unable to parse Json payload"

runForever()
