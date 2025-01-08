package main

import (
	"test/docs"
	"test/routers"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	swaggerfiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

// @tittle Backend API
// @version 1.0
// @description Profile server

// @BasePath /

// @securityDefinitions.apiKey ApiKeyAuth
// @in						   header
// @name					   Authorization
func main() {
	router := gin.Default()
	router.Use(cors.New(cors.Config{
		// AllowAllOrigins: true,
		AllowOrigins: []string{"*"},
	}))
	router.MaxMultipartMemory = 8 << 20
	// router.Use(middlewares.SetHTMLHeader())
	routers.Routers(router)
	router.Static("/movies/image", "./upload/movies")
	router.Static("/profile/image", "./upload/profile")
	docs.SwaggerInfo.BasePath = "/"
	router.GET("/docs/*any", ginSwagger.WrapHandler(swaggerfiles.Handler))
	router.Run(":8888")
}
