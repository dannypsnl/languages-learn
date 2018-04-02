package route

import (
	"github.com/gin-gonic/gin"

	"github.com/dannypsnl/gin-start/route/page"
	"github.com/dannypsnl/gin-start/route/api"
)

func Page(g *gin.RouterGroup) {
	g.GET("/", page.Home)
}

func Api(g *gin.RouterGroup) {
	g.POST("/login", api.Login)
}
