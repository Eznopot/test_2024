package main

import (
	"Technical/config"
	"Technical/database"
	"Technical/routes"

	"github.com/gin-gonic/gin"
)

var localhost = "0.0.0.0:"
var cfg *config.Config

func main() {

	cfg = config.InitConfig("./config/config.yml")
	db := database.ReturnDB(cfg)
	database.Migration(db)

	gin := gin.Default()
	routes.InitRoutes(gin)
	if err := gin.Run(localhost + cfg.Port); err != nil {
		return
	}
}
