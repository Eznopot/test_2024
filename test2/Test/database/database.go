package database

import (
	"log"
	"sync"

	"Technical/config"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var err error
var database *gorm.DB
var once sync.Once

func ReturnDB(cfg *config.Config) (db *gorm.DB) {
	once.Do(func() {
		var dsn string
		dsn = cfg.Username + ":" + cfg.Password + "@tcp(" + cfg.Host + ":" + cfg.PortDB + ")/" + cfg.DBName + "?charset=utf8mb4&parseTime=True&loc=Local"
		database, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
		if err != nil {
			log.Fatal("database open failed")
			return
		}
	})
	return database
}
