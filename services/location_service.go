
package services

import (
    "encoding/json"
    "fmt"
    "io"
    "net/http"
    "rental/models"
    "github.com/beego/beego/v2/client/orm"
)

type LocationService struct {
    ApiBaseUrl string
    ApiKey     string
}

// FilteredLocation represents the structure for filtered locations.
type FilteredLocation struct {
    DestId   string `json:"dest_id"`
    DestType string `json:"dest_type"`
    Value    string `json:"value"`
}

// GetLocations fetches locations from the external API.
func (service *LocationService) GetLocations(query string) ([]FilteredLocation, error) {
    url := fmt.Sprintf("%s/web/stays/auto-complete?query=%s", service.ApiBaseUrl, query)
    
    client := &http.Client{}
    req, err := http.NewRequest("GET", url, nil)
    if err != nil {
        return nil, fmt.Errorf("Error creating request: %v", err)
    }

    req.Header.Add("x-rapidapi-host", "booking-com18.p.rapidapi.com")
    req.Header.Add("x-rapidapi-key", service.ApiKey)

    resp, err := client.Do(req)
    if err != nil {
        return nil, fmt.Errorf("Error making request: %v", err)
    }
    defer resp.Body.Close()

    if resp.StatusCode != http.StatusOK {
        bodyBytes, _ := io.ReadAll(resp.Body)
        bodyString := string(bodyBytes)
        return nil, fmt.Errorf("API request failed with status code: %d, Response: %s", resp.StatusCode, bodyString)
    }

    var apiResponse map[string]interface{}
    decoder := json.NewDecoder(resp.Body)
    if err := decoder.Decode(&apiResponse); err != nil {
        return nil, fmt.Errorf("Error decoding response: %v", err)
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

    return filteredLocations, nil
}
