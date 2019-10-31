package route

import (
	"github.com/gin-gonic/gin"

	"languages-learn/go/web/gin/route/api"
	"languages-learn/go/web/gin/route/page"
)

func Page(g *gin.RouterGroup) {
	g.GET("/", page.Home)
}

func Api(g *gin.RouterGroup) {
	g.POST("/login", api.Login)
}
