package controllers

import (
	"github.com/beego/beego/v2/server/web"
	"github.com/beego/beego/v2/client/orm"
	"strings"
	//"log"
	"rental/models" // Update to match your project structure
)

type PropertyController struct {
	web.Controller
}

// ListProperties handles the GET request for property listings
func (c *PropertyController) Get() {
    location := c.GetString("location", "New York")

    // Initialize ORM
    o := orm.NewOrm()
    qs := o.QueryTable("rental_property")

    // Apply location filter
    qs = qs.Filter("Location__icontains", location)

    // Prepare result slice
    var properties []models.RentalProperty
    _, err := qs.All(&properties)

    if err != nil {
        c.Data["json"] = map[string]string{
            "error": "Failed to retrieve properties",
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
                ImageUrl1:  "", // default empty image URL
                ImageUrl2:  "",
                ImageUrl3:  "",
                ImageUrl4:  "",
                ImageUrl5:  "",
                Description: "No description available",
            }
        }

        propertyDetail := map[string]interface{}{
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

        enhancedProp := map[string]interface{}{
            "Location":   prop.Location,
            "LocationId": prop.DestID, // Assuming DestID is a field in RentalProperty
            "details":    []map[string]interface{}{propertyDetail},
        }

        enhancedProperties = append(enhancedProperties, enhancedProp)
    }

    // Pass data to the template
    c.Data["json"] = map[string]interface{}{
        "properties": enhancedProperties,
    }
    c.ServeJSON()
}