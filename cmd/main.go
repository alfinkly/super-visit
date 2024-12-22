package main

import (
	"github.com/gin-gonic/gin"
	"super-visit/internal/handlers"
)

func main() {
	router := gin.Default()

	router.GET("/user", handlers.UserHandler)

	router.Run(":8080")
}
