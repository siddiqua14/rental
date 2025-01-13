package controllers

import (
    "encoding/json"
    "fmt"
    "io"
    "net/http"
    

    "github.com/beego/beego/v2/client/orm"
    "github.com/beego/beego/v2/server/web"
    "github.com/beego/beego/v2/server/web/context" 
    "rental/models"
)

type LocationController struct {
    web.Controller
    apiBaseUrl string
    apiKey     string
}


type FilteredLocation struct {
    DestId   string `json:"dest_id"`
    DestType string `json:"dest_type"`
    Value    string `json:"value"`
}
type HotelDetails struct {
    IDHotel     int     `json:"id_hotel"`
    HotelID     string  `json:"hotel_id"`
    HotelName   string  `json:"hotel_name"`
    DestID      string  `json:"dest_id"`
    Location    string  `json:"location"`
    Rating      float64 `json:"rating"`
    ReviewCount int     `json:"review_count"`
    Price       string  `json:"price"`
    NumBeds     int     `json:"num_beds"`
    NumBedR     int     `json:"num_bedrooms"`
    NumBaths    int     `json:"num_bathrooms"`
}
type APIResponse struct {
    Data struct {
        Results []struct {
            ID               string `json:"id"`
            BasicPropertyData struct {
                ID      int `json:"id"`
                Reviews struct {
                    TotalScore   float64 `json:"totalScore"`
                    ReviewsCount int     `json:"reviewsCount"`
                } `json:"reviews"`
                
            } `json:"basicPropertyData"`
            Location struct {
                DisplayLocation string `json:"displayLocation"`
            } `json:"location"`
            DisplayName struct {
                Text string `json:"text"`
            } `json:"displayName"`
            MatchingUnitConfigurations struct {
                CommonConfiguration struct {
                    NbAllBeds   int `json:"nbAllBeds"`
                    NbAllBedR   int `json:"nbBedrooms"`
                    NbBathrooms int `json:"nbBathrooms"`
                } `json:"commonConfiguration"`
            } `json:"matchingUnitConfigurations"`
            PriceDisplayInfoIrene struct {
                DisplayPrice struct {
                    AmountPerStay struct {
                        Amount string `json:"amount"`
                    } `json:"amountPerStay"`
                } `json:"displayPrice"`
            } `json:"priceDisplayInfoIrene"`
        } `json:"results"`
    } `json:"data"`
    Meta struct {
        CurrentPage   int `json:"currentPage"`
        Limit        int `json:"limit"`
        TotalRecords int `json:"totalRecords"`
        TotalPage    int `json:"totalPage"`
    } `json:"meta"`
    Status  bool   `json:"status"`
    Message string `json:"message"`
}

// In-memory storage for dest_id and dest_type
var storedDestId string
var storedDestType string
var storedHotelIDs []int


// Init function to initialize apiBaseUrl and apiKey
func (c *LocationController) Init(ctx *context.Context, controllerName, actionName string, app interface{}) {
    c.Controller.Init(ctx, controllerName, actionName, app)

    apiBaseUrl, err := web.AppConfig.String("API_BASE_URL")
    if err != nil {
        c.Data["json"] = map[string]interface{}{"error": fmt.Sprintf("Error retrieving API Base URL: %v", err)}
        c.ServeJSON()
        return
    }

    apiKey, err := web.AppConfig.String("API_KEY")
    if err != nil {
        c.Data["json"] = map[string]interface{}{"error": fmt.Sprintf("Error retrieving API Key: %v", err)}
        c.ServeJSON()
        return
    }

    c.apiBaseUrl = apiBaseUrl
    c.apiKey = apiKey
}


// Get handles GET requests for "/fetch_locations"
func (c *LocationController) Get() {
	query := "New%20York"
	url := fmt.Sprintf("%s/web/stays/auto-complete?query=%s", c.apiBaseUrl, query)

	client := &http.Client{}
	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		c.Data["json"] = map[string]interface{}{"error": fmt.Sprintf("Error creating request: %v", err)}
		c.ServeJSON()
		return
	}

	req.Header.Add("x-rapidapi-host", "booking-com18.p.rapidapi.com")
	req.Header.Add("x-rapidapi-key", c.apiKey)

	resp, err := client.Do(req)
	if err != nil {
		c.Data["json"] = map[string]interface{}{"error": fmt.Sprintf("Error making request: %v", err)}
		c.ServeJSON()
		return
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		bodyBytes, _ := io.ReadAll(resp.Body)
		bodyString := string(bodyBytes)
		c.Data["json"] = map[string]interface{}{
			"error":    fmt.Sprintf("API request failed with status code: %d", resp.StatusCode),
			"response": bodyString,
		}
		c.ServeJSON()
		return
	}

	var apiResponse map[string]interface{}
	decoder := json.NewDecoder(resp.Body)
	if err := decoder.Decode(&apiResponse); err != nil {
		c.Data["json"] = map[string]interface{}{"error": fmt.Sprintf("Error decoding response: %v", err)}
		c.ServeJSON()
		return
	}

	var filteredLocations []FilteredLocation
	if data, ok := apiResponse["data"].([]interface{}); ok {
		o := orm.NewOrm()
		for _, item := range data {
			if itemMap, ok := item.(map[string]interface{}); ok {
				filteredLocation := FilteredLocation{
					DestId:   itemMap["dest_id"].(string),
					DestType: itemMap["dest_type"].(string),
					Value:    itemMap["label"].(string),
				}
				filteredLocations = append(filteredLocations, filteredLocation)

				location := &models.Location{
					DestId:   itemMap["dest_id"].(string),
					DestType: itemMap["dest_type"].(string),
					Value:    itemMap["label"].(string),
				}
				existingLocation := models.Location{DestId: location.DestId}
				err := o.Read(&existingLocation, "DestId")
				if err != nil {
					_, err := o.Insert(location)
					if err != nil {
						fmt.Printf("Error inserting location: %v\n", err)
					}
				}
			}
		}
	}

	c.Data["json"] = map[string]interface{}{
		"success": true,
		"query":   query,
		"count":   len(filteredLocations),
		"data": map[string]interface{}{
			"data": filteredLocations,
		},
	}
	c.ServeJSON()
}

/*

func (c *LocationController) FetchHotelDetails() {
    o := orm.NewOrm()

    // Fetch top 25 records from the rental_property table
    var rentalProperties []models.RentalProperty
    _, err := o.QueryTable("rental_property").Limit(80).All(&rentalProperties)
    if err != nil {
        c.Data["json"] = map[string]interface{}{"error": "Failed to retrieve rental properties"}
        c.ServeJSON()
        return
    }

    var hotelDetailsList []map[string]interface{}

    for _, rentalProperty := range rentalProperties {
        hotelID := rentalProperty.IDHotel
        url := fmt.Sprintf("https://booking-com18.p.rapidapi.com/stays/detail?hotelId=%d&checkinDate=2025-02-12&checkoutDate=2025-02-18&units=metric", hotelID)
        log.Printf("Making request to URL: %s", url)

        req, err := http.NewRequest("GET", url, nil)
        if err != nil {
            log.Printf("Error creating request for hotel ID %d: %v", hotelID, err)
            continue
        }

        req.Header.Add("x-rapidapi-host", "booking-com18.p.rapidapi.com")
        req.Header.Add("x-rapidapi-key", c.apiKey)

        client := &http.Client{}
        resp, err := client.Do(req)
        if err != nil {
            log.Printf("Error making request for hotel ID %d: %v", hotelID, err)
            continue
        }

        // Ensure the response body is closed after reading
        body, err := io.ReadAll(resp.Body)
        resp.Body.Close()  // Close response body immediately after reading
        if err != nil {
            log.Printf("Error reading response body for hotel ID %d: %v", hotelID, err)
            continue
        }

        log.Printf("API Response Status for hotel ID %d: %s", hotelID, resp.Status)
        log.Printf("Raw API Response for hotel ID %d: %s", hotelID, string(body))

        var apiResponse map[string]interface{}
        if err := json.Unmarshal(body, &apiResponse); err != nil {
            log.Printf("Error unmarshalling response for hotel ID %d: %v", hotelID, err)
            continue
        }

        data, ok := apiResponse["data"].(map[string]interface{})
        if !ok {
            log.Printf("Invalid data format in response for hotel ID %d", hotelID)
            continue
        }

        availableRooms, ok := data["available_rooms"].(float64)
        if !ok {
            log.Printf("Invalid available_rooms format in response for hotel ID %d", hotelID)
            continue
        }

        roomRecommendations, ok := data["room_recommendation"].([]interface{})
        if !ok {
            log.Printf("Invalid room_recommendation format in response for hotel ID %d", hotelID)
            continue
        }

        var totalAdults, totalChildren float64
        for _, recommendation := range roomRecommendations {
            if recommendationMap, ok := recommendation.(map[string]interface{}); ok {
                if adults, ok := recommendationMap["adults"].(float64); ok {
                    totalAdults += adults
                }
                if children, ok := recommendationMap["children"].(float64); ok {
                    totalChildren += children
                }
            }
        }

        accommodationTypeName, ok := data["accommodation_type_name"].(string)
        if !ok {
            log.Printf("Invalid accommodation_type_name format in response for hotel ID %d", hotelID)
            continue
        }

        facilitiesBlock, ok := data["facilities_block"].(map[string]interface{})
        if !ok {
            log.Printf("Invalid facilities_block format in response for hotel ID %d", hotelID)
            continue
        }

        facilities, ok := facilitiesBlock["facilities"].([]interface{})
        if !ok {
            log.Printf("Invalid facilities format in response for hotel ID %d", hotelID)
            continue
        }

        var amenities []string
        for i, facility := range facilities {
            if i >= 3 {
                break
            }
            facilityMap, ok := facility.(map[string]interface{})
            if !ok {
                log.Printf("Invalid facility format in response for hotel ID %d", hotelID)
                continue
            }
            name, ok := facilityMap["name"].(string)
            if !ok {
                log.Printf("Invalid facility name format in response for hotel ID %d", hotelID)
                continue
            }
            amenities = append(amenities, name)
        }
        
        // Parse CityInTrans
        cityInTrans, ok := data["city_in_trans"].(string)
        if !ok {
            cityInTrans = ""
        }

        
        // Update the existing rental property with additional details
        rentalProperty.Bedroom = int(availableRooms)
        rentalProperty.Guests = int(totalAdults + totalChildren)
        rentalProperty.PropertyType = accommodationTypeName
        rentalProperty.Amenities = strings.Join(amenities, ", ")
        rentalProperty.CityInTrans = cityInTrans

        if _, err := o.Update(&rentalProperty); err != nil {
            log.Printf("Error updating rental property for hotel ID %d: %v", hotelID, err)
            continue
        }

        log.Printf("Rental property updated successfully for hotel ID %d", hotelID)

        // Collect details for JSON output
        hotelDetails := map[string]interface{}{
            "IDHotel":       rentalProperty.IDHotel,
            "HotelID":       rentalProperty.HotelID,
            "HotelName":     rentalProperty.HotelName,
            "DestID":        rentalProperty.DestID,
            "Location":      rentalProperty.Location,
            "Rating":        rentalProperty.Rating,
            "ReviewCount":   rentalProperty.ReviewCount,
            "Price":         rentalProperty.Price,
            "NumBeds":       rentalProperty.NumBeds,
            "NumBedR":       rentalProperty.NumBedR,
            "NumBaths":      rentalProperty.NumBaths,
            "Bedroom":       rentalProperty.Bedroom,
            "Guests":        rentalProperty.Guests,
            "PropertyType":  rentalProperty.PropertyType,
            "Amenities":     rentalProperty.Amenities,
            "CityInTrans":   rentalProperty.CityInTrans,
        }
        hotelDetailsList = append(hotelDetailsList, hotelDetails)
    }

    // Send the hotel details as JSON response
    c.Data["json"] = map[string]interface{}{
        "message": "Rental properties updated successfully",
        "details": hotelDetailsList,
    }
    c.ServeJSON()
}
*/