package main

import (
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/contrib/sessions"

	"github.com/dannypsnl/gin-start/route"
)

func main() {
	r := gin.Default()
	store := sessions.NewCookieStore([]byte("secret"))
	r.Use(sessions.Sessions("user_name", store))

	route.Page(r.Group("/"))
	route.Api(r.Group("/api"))

	r.Run(":8000")
}
