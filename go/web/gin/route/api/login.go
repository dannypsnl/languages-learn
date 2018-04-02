package api

import (
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/contrib/sessions"
)

func Login(c *gin.Context) {
	user := c.PostForm("user")
	s := sessions.Default(c)
	s.Set("user_name", user)
	s.Save()
	c.JSON(200, gin.H{"status": "Logged in"})
}
