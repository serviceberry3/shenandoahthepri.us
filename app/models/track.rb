require 'gpx-stats'

class Track < ApplicationRecord
    def self.add_new_gpx_to_db
        #comb through the assets/gpx folder looking for gpx files that aren't in the db yet. Add the new ones
        Dir.glob("#{Rails.root}/app/assets/gpx/*.GPX") do |file|
            puts("\nNow running " + file)
            if date = ARGV[0]
                GPXParse.extract_data(file, date)
            else
                GPXParse.extract_data(file)
            end

            #file_name = File.basename(icon)

        end
        
        #from the gpx file, we want to get date, distance, elevation change, and duration. Call my C program to do so
    end
end
