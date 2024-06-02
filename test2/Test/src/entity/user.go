package entity

import "time"

type User struct {
	ID        uint `json:"id,omitempty" gorm:"primarykey;"`
	CreatedAt time.Time
	UpdatedAt time.Time
	Firstname string `json:"firstname"`
	Lastname  string `json:"lastname"`
	Email     string `json:"email" gorm:"uniqueIndex"`
	Password  string `json:"password,omitempty"`
}
