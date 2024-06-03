package routes

import (
	"Technical/src/users"

	"github.com/gin-gonic/gin"
)

func InitRoutes(gin *gin.Engine) {
	routingUser(gin)
}

func routingUser(gin *gin.Engine) {
	user := gin.Group("/user")
	{
		user.POST("update/", users.UpdateUser)
		user.DELETE("delete/", users.DeleteUser)
		user.GET("get/", users.GetUser)
		user.PUT("create/", users.CreateUser)
	}
}
