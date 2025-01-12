// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"rental/controllers"

	"github.com/beego/beego/v2/server/web"
)

func init() {

    web.Router("/fetch_locations", &controllers.LocationController{})
	web.Router("/fetch_stays_data", &controllers.LocationController{}, "get:FetchStaysData")
    web.Router("/fetch-hotel-details", &controllers.LocationController{}, "get:FetchHotelDetails")
    web.Router("/fetch-hotel-images-and-description", &controllers.LocationController{}, "get:FetchHotelImagesAndDescriptions")
    // Page route
    // Property listing endpoint
    web.Router("/v1/property/list", &controllers.PropertyController{})
    web.Router("/v1/property/details", &controllers.PropertyDetailsController{})
}