package routes

import "github.com/gin-gonic/gin"

func InitRoutes(gin *gin.Engine) {
	routingUser(gin)
}

func routingUser(gin *gin.Engine) {
	user := gin.Group("/user") 
	{
		user.POST("update/")
		user.DELETE("delete/")
		user.GET("get/")
		user.PUT("create/")
	}
}
