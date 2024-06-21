# Test Technique 
## Objectif

L'objectif de ce test technique est d'implémenter des routes API pour gérer des utilisateurs en utilisant le framework Gin et l'ORM Gorm. Vous allez créer les routes nécessaires, ainsi que les services et contrôleurs correspondants afin de pouvoir créer, supprimer, modifier et récuperer un User.
La base du code est déja faite mais vous pouvez la modifier comme bon vous semble.
Un docker-compose est fournis pour lancer la base de donnée MariaDB. Vous etes libre de l'utiliser comme bon vous semble. La structure de la base de donnée ne sera pas évaluer sauf en cas de fonctionalités bonus réalisé.

## Prérequis

- [Go](https://golang.org/dl/) 1.16+
- [Gin](https://gin-gonic.com/)
- [Gorm](https://gorm.io/docs/)
- Créer une base de donnée MariaDB avec le nom *backend_db*

## Structure du Projet

Le projet est organisé de la manière suivante :

```
/your_project
├── config
│   ├── config.go
│   └── config.yml
├── database
│   ├── database.go
│   └── databaseMigration.go
├── docker-compose.yml
├── go.mod
├── go.sum
├── main.go
├── routes
│   └── routes.go
└── src
    ├── entity
    │   └── user.go
    └── users
        ├── controller.go
        └── service.go
```

## Instructions

#### src/users/service.go

Les fonction a modifier sont les suivantes:

```go
package users

import (
	"errors"
	"your_project/src/entity"
)

func UpdateUserService() error {
	// Implémentation de la mise à jour de l'utilisateur
	// Par exemple, mise à jour dans la base de données
	return nil
}

func DeleteUserService() error {
	// Implémentation de la suppression de l'utilisateur
	// Par exemple, suppression dans la base de données
	return nil
}

func GetUserService() (entity.User, error) {
	// Implémentation de la récupération de l'utilisateur
	// Par exemple, récupération dans la base de données
	return user, nil
}

func CreateUserService() error {
	// Implémentation de la création de l'utilisateur
	// Par exemple, création dans la base de données
	return nil
}
```

#### src/users/controller.go

Le fichier controller.go contient les fonctions "controller" des fonctions que vous devez implémenter. Vous devrez surement les modifier afin de faire passer les arguments au bons endroit.

```go
package users

import (
	"net/http"
	"github.com/gin-gonic/gin"
)

func UpdateUser(c *gin.Context) {
	if err := UpdateUser(); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "User updated"})
}

func DeleteUser(c *gin.Context) {
	if err := DeleteUser(); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "User deleted"})
}

func GetUser(c *gin.Context) {
	user, err := GetUser()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"user": user})
}

func CreateUser(c *gin.Context) {
	if err := CreateUser(); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "User created"})
}
```

#### routes/routes.go

Le fichier routes.go contient les routes qui sont exposé par l'API. SI vous souhaitez rajouter des routes c'est par ce fichier qu'il faut les ajouter.

```go
package routes

import (
	"github.com/gin-gonic/gin"
	"your_project/src/users"
)

func SetupRoutes(router *gin.Engine) {
	user := router.Group("/user")
	{
		user.POST("update/", users.UpdateUser)
		user.DELETE("delete/", users.DeleteUser)
		user.GET("get/", users.GetUser)
		user.PUT("create/", users.CreateUser)
	}
}
```


#### Utilisation de Gorm en lien avec la base de donnée
Lorsque nécessaire, l'utilisation de gorm peut se faire de cette manière:

```go

func ExampleHandlingDatabase(tofind string) (Model, error) {
	var ModelExample entity.Model

	// Utilisation du singleton de la base de donnée 
	db := database.ReturnDb(nil)

	// Query effectué a l'aide de Gorm de cette manière
	err := db.Where("element = ? ", tofind).First(&ModelExample).Error
	if err != nil {
		return _, err
	}

	return ModelExample, nil
}
```
## Critères d'évaluation

1. **Respect de l'architecture Modèle-Contrôleur-Service.**
2. **Implémentation correcte des routes, des services et des contrôleurs.**
3. **Structure et organisation du code.**
4. **Clarté et propreté du code.**
