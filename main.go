package main

import (
	_ "rental/routers"

	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/server/web"
    _ "github.com/lib/pq"
)


func main() {
    orm.RegisterDriver("postgres", orm.DRPostgres)

    // Database connection setup
    orm.RegisterDataBase("default", "postgres", "user=postgres password=postgres host=localhost port=5432 dbname=booking_db sslmode=disable")

    orm.RunSyncdb("default", false, true) // Automatically create the tables in the database

    // Start the Beego server
    web.BConfig.WebConfig.ViewsPath = "views"
    web.Run()
}
