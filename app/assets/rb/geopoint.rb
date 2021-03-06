

# Class holds coordinates and elevation of single point
class GeoPoint
    attr_accessor :latitude, :longitude, :elevation
    
    def initialize(latitude:, longitude:, elevation:)
        self.latitude = latitude
        self.longitude = longitude
        self.elevation = elevation
    end
end