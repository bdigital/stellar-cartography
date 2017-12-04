using StellarCartographyString
module StellarCartography

  #Largest 500 cities in US.  See uscities data to come up with adding or removing some.

  CITIES = ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia", "Phoenix", "San Diego", "Dallas", "San Antonio", "Detroit", "San Jose", "Indianapolis", "San Francisco", "Jacksonville", "Columbus", "Austin", "Baltimore", "Memphis", "Milwaukee", "Boston", "Washington", "El Paso", "Seattle", "Denver", "Nashville-Davidson", "Charlotte", "Fort Worth", "Portland", "Oklahoma City", "Tucson", "New Orleans", "Las Vegas", "Cleveland", "Long Beach", "Albuquerque", "Kansas City", "Fresno", "Virginia Beach", "Atlanta", "Sacramento", "Oakland", "Mesa", "Tulsa", "Omaha", "Minneapolis", "Honolulu", "Miami", "Colorado Springs", "St. Louis", "Wichita", "Santa Ana", "Pittsburgh", "Arlington", "Cincinnati", "Anaheim", "Toledo", "Tampa", "Buffalo", "St. Paul", "Corpus Christi", "Aurora", "Raleigh", "Newark", "Lexington-Fayett", "Anchorage municipalit", "Louisville", "Riverside", "St. Petersburg", "Bakersfield", "Stockton", "Birmingham", "Jersey City", "Norfolk", "Baton Rouge", "Hialeah", "Lincoln", "Greensboro", "Plano", "Rochester", "Glendale", "Akron", "Garland", "Madison", "Fort Wayne", "Fremont", "Scottsdale", "Montgomery", "Shreveport", "Lubbock", "Chesapeake", "Mobile", "Des Moines", "Grand Rapids", "Richmond", "Yonkers", "Spokane", "Augusta-Richmond County (balance", "Glendale", "Tacoma", "Irving", "Huntington Beach", "Arlington", "Modesto", "Durham", "Paradise", "Orlando", "Boise City", "Columbus", "Winston-Salem", "San Bernardino", "Jackson", "Little Rock", "Salt Lake City", "Reno", "Newport News", "Chandler", "Laredo", "Henderson", "Knoxville", "Amarillo", "Providence", "Chula Vista", "Worcester", "Oxnard", "Dayton", "Garden Grove", "Oceanside", "Tempe", "Huntsville", "Ontario", "Sunrise Manor", "Chattanooga", "Fort Lauderdale", "Springfield", "Springfield", "Santa Clarita", "Salinas", "Tallahassee", "Rockford", "Pomona", "Paterson", "Overland Park", "Santa Rosa", "Syracuse", "Kansas City", "Hampton", "Metairie", "Lakewood", "Vancouver", "Irvine", "Aurora", "Moreno Valley", "Pasadena", "Hayward", "Brownsville", "Bridgeport", "Hollywood", "Warren", "Torrance", "Eugene", "Pembroke Pines", "Salem", "Pasadena", "Escondido", "Sunnyvale", "Savannah", "Fontana", "Orange", "Naperville", "Alexandria", "Rancho Cucamonga", "Grand Prairie", "Fullerton", "Corona", "Flint", "Mesquite", "Sterling Heights", "East Los Angeles", "Sioux Falls", "New Haven", "Topeka", "Concord", "Evansville", "Hartford", "Fayetteville", "Cedar Rapids", "Elizabeth", "Lansing", "Lancaster", "Fort Collins", "Coral Springs", "Spring Valley", "Stamford", "Thousand Oaks", "Vallejo", "Palmdale", "Columbia", "El Monte", "Abilene", "North Las Vegas", "Ann Arbor", "Beaumont", "Waco", "Independence", "Peoria", "Inglewood", "Springfield", "Simi Valley", "Lafayette", "Gilbert", "Carrollton", "Bellevue", "West Valley City", "Clearwater", "Costa Mesa", "Peoria", "South Bend", "Downey", "Waterbury", "Manchester", "Allen", "McAllen", "Joliet", "Lowell", "Provo", "West Covina", "Wichita Falls", "Erie", "Daly City", "Clarksville", "Norwalk", "Gary", "Berkeley", "Santa Clara", "Green Bay", "Cape Coral", "Arvada", "Pueblo", "Cambridge", "Westminster", "San Buenaventura (Ventura)", "Portsmouth", "Livonia", "Burbank", "Athens-Clarke County (balance", "Richmond", "Davenport", "Dearborn", "Edison", "Macon", "Charleston", "South Gate", "Fairfield", "Arden-Arcade", "Norman", "Albany", "Clinton", "Gainesville", "Midland", "Roanoke", "El Cajon", "Boulder", "Cary", "Elgin", "Brockton", "New Bedford", "Compton", "Mission Viejo", "Olathe", "Lawton", "San Mateo", "Santa Barbara", "Fall River", "Rialto", "Richardson", "Visalia", "Everett", "Odessa", "Fargo", "Antioch", "Kenosha", "Gresham", "Vista", "Billings", "Carson", "Lynn", "Port St. Lucie", "Vacaville", "San Angelo", "Sandy", "Columbia", "Westminster", "Quincy", "Miami Beach", "Waukegan", "Duluth", "Killeen", "Nashua", "Westland", "Toms River", "High Point", "Warwick", "Rochester", "Alhambra", "Sandy Springs", "Sunrise", "Parma", "Cicero", "Trenton", "Bloomington", "Citrus Heights", "Sioux City", "Columbia", "Orem", "Hawthorne", "Santa Monica", "Newton", "Whittier", "Tyler", "Federal Way", "Hammond", "Norwalk", "Plantation", "Thornton", "Farmington Hills", "West Palm Beach", "Youngs", "Decatur", "Racine", "Reading", "Troy", "Redding", "Canton", "Denton", "Fort Smith", "Lawrence", "Cheektowaga", "Roseville", "Camden", "North Charleston", "Kent", "San Leandro", "Palm Bay", "Lakewood", "Roswell", "Cranston", "Clifton", "Lakeland", "Southfield", "Buena Park", "Carlsbad", "Pompano Beach", "Tuscaloosa", "Brandon", "Lewisville", "Yuma", "Somerville", "Santa Maria", "Ogden", "Kalamazoo", "Albany", "Greeley", "Silver Spring", "Scranton", "Canton", "Beaverton", "Arlington Heights", "Wilmington", "Baldwin Park", "Davie", "Redwood City", "Schaumburg", "Kendall", "Broken Arrow", "Danbury", "Boca Raton", "Las Cruces", "Evanston", "St. Joseph", "Livermore", "Longview", "Waterford", "Pawtucket", "Bellflower", "Miramar", "Wilmington", "Napa", "Town 'n' Country", "Alameda", "New Rochelle", "Lawrence", "Yakima", "Lake Charles", "New Britain", "Melbourne", "Bethlehem", "Gulfport", "Longmont", "Highlands Ranch", "Mountain View", "Lee's Summit", "Kenner", "Hillsboro", "Appleton", "Newport Beach", "Lynwood", "East Orange", "Deltona", "Largo", "Wyoming", "Bloomington", "Spring Hill", "Asheville", "Rochester Hills", "Murfreesboro", "Waterloo", "Lorain", "Clovis", "Upland", "Mount Vernon", "West Jordan", "Edmond", "College Station", "Passaic", "Champaign", "Tustin", "Muncie", "Brooklyn Park", "Bellingham", "Chino", "Union City", "Framingham", "Union City", "Chino Hills", "Jacksonville", "Bay", "Sparks", "Pontiac", "Gastonia", "Plymouth", "Taylor", "Bryan", "Palatine", "Springfield", "Lynchburg", "Shelby", "West Bloomfield Township", "Waukesha", "Bloomington", "Deerfield Beach", "Walnut Creek", "Portland", "Daytona Beach", "Victorville", "Merced", "Suffolk", "Pleasanton", "Redlands", "West Hartford", "Eagan", "Pico Rivera", "Skokie", "Sugar Land", "Redondo Beach", "Medford", "St. Clair Shores", "Oshkosh", "Hoover", "Milpitas", "Hesperia", "Dundalk", "Iowa City", "Santa Fe", "Montebello", "Laguna Niguel", "Bayonne", "Schenectady", "Saginaw", "Tonawanda", "Eau Claire", "Coon Rapids", "Huntington Park", "West Allis", "Round Rock", "Irvington", "Hamilton", "Utica", "Victoria", "South San Francisco", "Greenville", "North Little Rock", "Boynton Beach", "St. Charles", "Davis", "Burnsville", "Florence-Graham", "Bristol", "Royal Oak", "Monterey Park", "Delray Beach"]

end
