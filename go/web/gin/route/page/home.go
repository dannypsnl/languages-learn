package page

import (
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/contrib/sessions"
)

func Home(c *gin.Context) {
	s := sessions.Default(c)
	str := s.Get("user_name")
	c.String(200, "Home Page, Welcome %s", str)
}
