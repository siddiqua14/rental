package controllers

import (
	"github.com/beego/beego/v2/server/web"
	"github.com/beego/beego/v2/client/orm"
	"strings"
	"log"
	"rental/models" // Update to match your project structure
)

type PropertyController struct {
	web.Controller
}
// Get handles GET requests for /v1/property/list
func (c *PropertyController) Get() {
	o := orm.NewOrm()
	var properties []models.RentalProperty

	// Query all properties
	_, err := o.QueryTable("rental_property").All(&properties)
	if err != nil {
		log.Printf("Error retrieving properties: %v", err)
		c.Data["json"] = map[string]string{
			"error":   "Failed to retrieve properties",
			"details": err.Error(),
		}
		c.ServeJSON()
		return
	}

	// Prepare enhanced property response
	var enhancedProperties []map[string]interface{}
	for _, prop := range properties {
		var details models.PropertyDetails
		err := o.QueryTable("property_details").Filter("HotelID", prop.HotelID).One(&details)

		// Handle the error for property details query
		if err != nil {
			// If there's an error, use default/empty values for details
			details = models.PropertyDetails{
				ImageUrl1:  "",
				ImageUrl2:  "",
				ImageUrl3:  "",
				ImageUrl4:  "",
				ImageUrl5:  "",
				Description: "No description available",
			}
		}

		enhancedProp := map[string]interface{}{
			"ID":           prop.ID,
			"IDHotel":      prop.IDHotel,
			"HotelID":      prop.HotelID,
			"HotelName":    prop.HotelName,
			"Location":     prop.Location,
			"Price":        prop.Price,
			"PropertyType": prop.PropertyType,
			"Guests":       prop.Guests,
			"Rating":       prop.Rating,
			"ReviewCount":  prop.ReviewCount,
			"NumBeds":      prop.NumBeds,
			"NumBedR":      prop.NumBedR,
			"NumBaths":     prop.NumBaths,
			"Bedroom":      prop.Bedroom,
			"Amenities":    strings.Split(prop.Amenities, ","),
			"HeroImage":    details.ImageUrl1,
			"Gallery":      []string{details.ImageUrl1, details.ImageUrl2, details.ImageUrl3, details.ImageUrl4, details.ImageUrl5},
		}
		enhancedProperties = append(enhancedProperties, enhancedProp)
	}

	// Send the enhanced properties as JSON response
	c.Data["json"] = map[string]interface{}{
		"message":    "Property list fetched successfully",
		"properties": enhancedProperties,
	}
	c.ServeJSON()
}