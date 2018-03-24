import jester, asyncdispatch, htmlgen

routes;
    get "/":
        resp h1("Home Page")
    get "/about":
        resp h1("About Page")
    post "/json":
        try:
            let j = parseJson(request.body)
        except:
            resp Http400, "Unable to parse JSON payload"

runForever()
