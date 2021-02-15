require 'geopoint'

class GPX_alt
    def initialize(path)
        @doc = nil
    
        begin
            path = open(path)
            doc = Nokogiri::XML(path)

            rescue
                raise GPXInvalidFileException
            end
        
            @points = []
            @dates = []
        
            doc.search('trkpt').map do |el|
                if raw_date = el.at('time')
                    @dates.push Time.parse(raw_date.text)
                end

                @points.push GeoPoint.new(
                    latitude: el['lat'].to_f,
                    longitude: el['lon'].to_f,
                    #elevation: el.at('ele').text.to_f
                    #we don't need elevation here
                    elevation: nil
                )
        end
    end



    def start_date
        unless @dates == []
            @dates.first
        else
            nil
        end
    end

    def end_date
        unless @dates == []
            @dates.last
        else
            nil
        end
    end
end