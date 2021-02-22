require 'gpx-stats'

class Track < ApplicationRecord
    def self.add_new_gpx_to_db
    
        #comb through the assets/gpx folder looking for gpx files that aren't in the db yet. Add the new ones
        Dir.glob("#{Rails.root}/app/assets/gpx/*.GPX") do |file|
            #check if this filename can be found in a db entry
            unless (exists?(filename: file))
                puts("\nFound new file, running: " + file)

                #run data analysis on this gpx file, passing an override date if specified
                #from the gpx file, we want to get date, distance, elevation change, and duration.
                if date = ARGV[0]
                    this_gpx = GPXParse.new(file, date)
                else
                    this_gpx = GPXParse.new(file)
                end

                #add this gpx to the db, passing appropriate data, (or nil if a certain datum is unavailable for this gpx)
                new(:filename => file, :date => this_gpx.get_date, :distance => this_gpx.get_dist, :elev_change => this_gpx.get_elev_change, :duration => this_gpx.get_duration).save
                
                #file_name = File.basename(icon)
            end
        end

        puts("Completed scan of GPX assets folder.")
    end
end
