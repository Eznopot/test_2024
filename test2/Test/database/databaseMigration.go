package database

import (
	"Technical/src/entity"
	"fmt"
	"log"

	"gorm.io/gorm"
)

func Migration(db *gorm.DB) {
	if err = db.AutoMigrate(&entity.User{}); err != nil {
		log.Println("Error", fmt.Errorf("").Error())
	}
}
