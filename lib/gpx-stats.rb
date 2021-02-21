require 'gpx'
require 'haversine'
require 'gpx_alt'

class GPXParse
  #constructor
  def initialize(file, date = nil)
    @ascent = @descent = 0
    @ascent_grade = @descent_grade = 0
    @distance = @ascent_distance = @descent_distance = @flat_distance = 0
    @prev_lat = @prev_lon = @prev_elevation = @prev_time = 0
    
    if file.nil?
      puts "ERROR: You must provide the path to a valid gpx file."
      abort
    end

    @gpx = GPX::GPXFile.new(gpx_file: file)
    
    @gpx.tracks.each do |t|
      t.points.each do |p|
        # Skip calculations for the first point since there's no previous data
        if @prev_lat > 0

          # Get distance between current and previous point and convert to miles
          d = Haversine.distance(p.lat, p.lon, @prev_lat, @prev_lon).to_miles

          #Add this local distance to cumulative distance sum
          @distance += d

          # Make sure the GPX file contained elevation data
          unless p.elevation.nil?
            #If gained elevation since last tkpt
            if p.elevation > @prev_elevation
              #Add elevation change to running ascent total
              @ascent += (p.elevation - @prev_elevation)

              #Add distance since last tkpt to running 'distance ascending' total
              @ascent_distance += d

            #IF lost elevation since last tkpt
            elsif p.elevation < @prev_elevation
              #Add elevation change to running descent total
              @descent += (@prev_elevation - p.elevation)

              #Add distance since last tkpt to running 'distance descending' total
              @descent_distance += d

            #Otherwise there wasn't any elev change between these two tkpts, so add dist to 'flat_distance'
            else
              @flat_distance += d
            end
          end

        end

        #Set previous to this so that we can keep track of the diffs between tkpts
        @prev_lat, @prev_lon, @prev_elevation, @prev_time = [p.lat, p.lon, p.elevation, p.time]
      end
    end

    

    # Convert ascent and descent to feet
    @ascent = (@ascent * 3.281).round
    @descent = (@descent * 3.281).round

    @total_elev_change = @ascent + @descent

    #Calculate steepness
    @ascent_grade = (100 * (@ascent / (@ascent_distance * 5280))).abs.round(1) unless @ascent == 0
    @descent_grade = (100 * (@descent / (@descent_distance * 5280))).abs.round(1) unless @descent == 0
    @total_grade = (100 * ((@ascent - @descent) / (@distance * 5280))).abs.round(1) unless @ascent == 0 or @descent == 0

    puts "#{@ascent} ft. ascent, #{@descent} ft. descent"
    puts "#{@ascent_distance.round(2)} mi. ascending, #{@descent_distance.round(2)} mi. descending, #{@flat_distance.round(2)} mi. flat, #{@distance.round(2)} mi. total"
    puts "#{@ascent_grade}% ascent grade, #{@descent_grade}% descent grade, #{@total_grade}% total grade"
    puts "Duration: #{@gpx.moving_duration}"
    puts "Date: #{@gpx.time.to_date}"

    gpx_alt = GPX_alt.new file
    #date_temp = gpx_alt.start_date.to_s - " UTC"
    #puts date_temp
    #puts Time.parse (date_temp + " EST")
    
    if @date = gpx_alt.start_date
      puts @date.in_time_zone("America/New_York").to_s[0..9]
    end
  end


  def extract_data(file, date = nil)
    
  end

  def get_elev_change
    if @total_elev_change == 0
      nil
    else
      @total_elev_change
    end
  end

  def get_date
    if @date
      @date
    else
      @gpx.time.to_date
    end
  end

  def get_dist
    @distance
  end

  def get_duration
    if @gpx.moving_duration == 0
      nil
    else
      @gpx.moving_duration
    end
  end

end



