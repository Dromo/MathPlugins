local function Coords(north, west, south, east)
    -- Return a function for converting (longitude, lattitude) into (x, y)
    return function(lattitude, longitude)
        local x = 800 * (longitude - west) / (east - west);
        local y = 600 * (lattitude - north) / (south - north);
        return { x, y };
    end
end

mapdata={};

AngmarCoords = Coords(14.6, -42.8, -7.4, -13.3);
mapdata["Angmar"]={};
mapdata["Angmarc"] = AngmarCoords;
mapdata["Angmarq"] = AngmarCoords(0.4, -39.5);
mapdata["Angmar"]["0.6N 36.3W"] = AngmarCoords(0.6, -36.3);
mapdata["Angmar"]["4.8N 34.5W"] = AngmarCoords(4.8, -34.5);
mapdata["Angmar"]["2.4N 32.0W"] = AngmarCoords(2.4, -32.0);
mapdata["Angmar"]["0.8N 28.7W"] = AngmarCoords(0.8, -28.7);
mapdata["Angmar"]["0.6N 20.8W"] = AngmarCoords(0.6, -20.8);
mapdata["Angmar"]["3.1N 24.1W"] = AngmarCoords(3.1, -24.1);
mapdata["Angmar"]["5.8N 23.4W"] = AngmarCoords(5.8, -23.4);
mapdata["Angmar"]["7.1N 20.1W"] = AngmarCoords(7.1, -20.1);
mapdata["Angmar"]["8.6N 28.5W"] = AngmarCoords(8.6, -28.5);
mapdata["Angmar"]["11.3N 27.1W"] = AngmarCoords(11.3, -27.1);


EvendimCoords = Coords(-1.6, -82.6, -24.4, -52.3);
mapdata["Evendim"]={};
mapdata["Evendimc"]= EvendimCoords;
mapdata["Evendimq"]= EvendimCoords(-12.7, -67.2);
mapdata["Evendim"]["5.0S 68.4W"] = EvendimCoords(-5.0, -68.4);
mapdata["Evendim"]["5.8S 61.4W"] = EvendimCoords(-5.8, -61.4);
mapdata["Evendim"]["6.1S 73.9W"] = EvendimCoords(-6.1, -73.9);
mapdata["Evendim"]["7.4S 72.8W"] = EvendimCoords(-7.4, -72.8);
mapdata["Evendim"]["9.0S 74.1W"] = EvendimCoords(-9.0, -74.1);
mapdata["Evendim"]["15.3S 64.4W"] = EvendimCoords(-15.3, -64.4);
mapdata["Evendim"]["16.1S 75.2W"] = EvendimCoords(-16.1, -75.2);
mapdata["Evendim"]["16.7S 64.1W"] = EvendimCoords(-16.7, -64.1);
mapdata["Evendim"]["18.6S 70.2W"] = EvendimCoords(-18.6, -70.2);
mapdata["Evendim"]["16.6S 69.7W"] = EvendimCoords(-16.6, -69.7);


ForochelCoords = Coords(25.0, -92.5, -5.5, -52.4);
mapdata["Forochel"]={};
mapdata["Forochelc"] = ForochelCoords;
mapdata["Forochelq"] = ForochelCoords(18.8, -71.0);
mapdata["Forochel"]["20.6N 69.4W"] = ForochelCoords(20.6, -69.4);
mapdata["Forochel"]["17.6N 67.2W"] = ForochelCoords(17.6, -67.2);
mapdata["Forochel"]["12.2N 66.8W"] = ForochelCoords(12.2, -66.8);
mapdata["Forochel"]["14.2N 74.4W"] = ForochelCoords(14.2, -74.4);
mapdata["Forochel"]["12.7N 80.3W"] = ForochelCoords(12.7, -80.3);
mapdata["Forochel"]["10.5N 73.0W"] = ForochelCoords(10.5, -73.0);
mapdata["Forochel"]["5.5N 74.5W"] = ForochelCoords(5.5, -74.5);
mapdata["Forochel"]["7.9N 77.1W"] = ForochelCoords(7.9, -77.1);
--mapdata["Forochel"]["8.1N 76.7W"] = ForochelCoords(8.1, -76.7); -- probably the same as the one above
mapdata["Forochel"]["16.8N 86.2W"] = ForochelCoords(16.8, -86.2);
mapdata["Forochel"]["18.8N 85.4W"] = ForochelCoords(18.8, -85.4);
mapdata["Forochel"]["10.8N 79.5W"] = ForochelCoords(10.8, -79.5);


MistyCoords = Coords(-14.8, -12.5, -32.9, 12.3);
mapdata["Misty Mountains"]={};
mapdata["Misty Mountainsc"] = MistyCoords;
mapdata["Misty Mountainsq"] = MistyCoords(-24.7, -4.1);
mapdata["Misty Mountains"]["25.4S 0.1E"] = MistyCoords(-25.4, 0.1);
mapdata["Misty Mountains"]["23.1S 1.2E"] = MistyCoords(-23.1, 1.2);
mapdata["Misty Mountains"]["23.6S 7.2E"] = MistyCoords(-23.6, 7.2);
mapdata["Misty Mountains"]["22.1S 7.6E"] = MistyCoords(-22.1, 7.6);
mapdata["Misty Mountains"]["21.9S 4.4E"] = MistyCoords(-21.9, 4.4);
mapdata["Misty Mountains"]["22.5S 4.1E"] = MistyCoords(-22.5, 4.1);
mapdata["Misty Mountains"]["24.4S 6.2E"] = MistyCoords(-24.4, 6.2);
mapdata["Misty Mountains"]["27.8S 8.2E"] = MistyCoords(-27.8, 8.2);
mapdata["Misty Mountains"]["28.1S 7.3E"] = MistyCoords(-28.1, 7.3);
mapdata["Misty Mountains"]["31.1S 3.3E"] = MistyCoords(-31.1, 3.3);


NorthDownsCoords = Coords(-1.3, -60.4, -22.5, -32.2);
mapdata["North Downs"]={};
mapdata["North Downsc"] = NorthDownsCoords;
mapdata["North Downsq"] = NorthDownsCoords(-9.5, -41.4);
mapdata["North Downs"]["5.8S 46.3W"] = NorthDownsCoords(-5.8, -46.3);
mapdata["North Downs"]["7.0S 53.6W"] = NorthDownsCoords(-7.0, -53.6);
mapdata["North Downs"]["8.1S 37.5W"] = NorthDownsCoords(-8.1, -37.5);
mapdata["North Downs"]["8.5S 33.0W"] = NorthDownsCoords(-8.5, -33.0);
mapdata["North Downs"]["8.7S 36.2W"] = NorthDownsCoords(-8.7, -36.2);
mapdata["North Downs"]["9.6S 52.3W"] = NorthDownsCoords(-9.6, -52.3);
mapdata["North Downs"]["9.7S 56.2W"] = NorthDownsCoords(-9.7, -56.2);
mapdata["North Downs"]["11.0S 47.3W"] = NorthDownsCoords(-11.0, -47.3);
mapdata["North Downs"]["11.4S 58.4W"] = NorthDownsCoords(-11.4, -58.4);
mapdata["North Downs"]["12.2S 57.9W"] = NorthDownsCoords(-12.2, -57.9);
mapdata["North Downs"]["13.8S 53.1W"] = NorthDownsCoords(-13.8, -53.1);


MirkwoodCoords = Coords(-4.9, -63.6, -23.5, -38.8);
mapdata["Southern Mirkwood"]={};
mapdata["Southern Mirkwoodc"] = MirkwoodCoords;
mapdata["Southern Mirkwoodq"] = MirkwoodCoords(-14.5, -50.9);
mapdata["Southern Mirkwood"]["12.8S 43.7W"] = MirkwoodCoords(-12.8, -43.7);
mapdata["Southern Mirkwood"]["13.4S 59.0W"] = MirkwoodCoords(-13.4, -59.0);
mapdata["Southern Mirkwood"]["15.8S 46.5W"] = MirkwoodCoords(-15.8, -46.5);
mapdata["Southern Mirkwood"]["15.8S 58.3W"] = MirkwoodCoords(-15.8, -58.3);
mapdata["Southern Mirkwood"]["16.1S 53.5W"] = MirkwoodCoords(-16.1, -53.5);
mapdata["Southern Mirkwood"]["18.2S 48.7W"] = MirkwoodCoords(-18.2, -48.7);
mapdata["Southern Mirkwood"]["19.0S 56.3W"] = MirkwoodCoords(-19.0, -56.3);
mapdata["Southern Mirkwood"]["19.3S 46.7W"] = MirkwoodCoords(-19.3, -46.7);


WGondorCoords = Coords(-50.3, -90.3, -83.0, -47.3);
mapdata["Western Gondor"]={};
mapdata["Western Gondorc"] = WGondorCoords;
mapdata["Western Gondorq"] = WGondorCoords(-75.5, -71.9);
mapdata["Western Gondor"]["76.9S 73.1W"] = WGondorCoords(-76.9, -73.1);
mapdata["Western Gondor"]["78.7S 69.0W"] = WGondorCoords(-78.7, -69.0);
mapdata["Western Gondor"]["77.0S 68.7W"] = WGondorCoords(-77.0, -68.7);
mapdata["Western Gondor"]["71.2S 64.6W"] = WGondorCoords(-71.2, -64.6);
mapdata["Western Gondor"]["71.2S 60.7W"] = WGondorCoords(-71.2, -60.7);
mapdata["Western Gondor"]["65.7S 53.7W"] = WGondorCoords(-65.7, -53.7);
mapdata["Western Gondor"]["62.2S 55.8W"] = WGondorCoords(-62.2, -55.8);
mapdata["Western Gondor"]["62.7S 61.0W"] = WGondorCoords(-62.7, -61.0);
mapdata["Western Gondor"]["60.2S 64.3W"] = WGondorCoords(-60.2, -64.3);
mapdata["Western Gondor"]["59.9S 70.8W"] = WGondorCoords(-59.9, -70.8);

CGondorCoords = Coords(-66.6, -59.4, -91.1, -26.9);
mapdata["Central Gondor"]={};
mapdata["Central Gondorc"] = CGondorCoords;
--- Ringlo Vale
mapdata["Central Gondorq"] = CGondorCoords(-72.0, -50.1);
mapdata["Central Gondor"]["71.7S 52.0W"] = CGondorCoords(-71.7, -52.0);
mapdata["Central Gondor"]["72.2S 51.8W"] = CGondorCoords(-72.2, -51.8);
mapdata["Central Gondor"]["72.0S 47.6W"] = CGondorCoords(-72.0, -47.6);
mapdata["Central Gondor"]["73.7S 49.2W"] = CGondorCoords(-73.7, -49.2);
mapdata["Central Gondor"]["76.3S 50.4W"] = CGondorCoords(-76.3, -50.4);
mapdata["Central Gondor"]["70.3S 46.2W"] = CGondorCoords(-70.3, -46.2);
mapdata["Central Gondor"]["72.3S 48.6W"] = CGondorCoords(-72.3, -48.6);
mapdata["Central Gondor"]["70.3S 47.4W"] = CGondorCoords(-70.3, -47.4);
--- Dor En Enril
mapdata["Central Gondorq2"] = CGondorCoords(-80.6, -44.9);
mapdata["Central Gondor"]["77.7S 50.2W"] = CGondorCoords(-77.7, -50.2);
mapdata["Central Gondor"]["78.3S 49.0W"] = CGondorCoords(-78.3, -49.0);
mapdata["Central Gondor"]["79.4S 48.0W"] = CGondorCoords(-79.4, -48.0);
mapdata["Central Gondor"]["81.3S 47.1W"] = CGondorCoords(-81.3, -47.1);
mapdata["Central Gondor"]["81.4S 48.0W"] = CGondorCoords(-81.4, -48.0);
mapdata["Central Gondor"]["83.0S 50.8W"] = CGondorCoords(-83.0, -50.8);
mapdata["Central Gondor"]["83.1S 49.3W"] = CGondorCoords(-83.1, -49.3);
--- Lebennin
mapdata["Central Gondorq3"] = CGondorCoords(-79.4, -39.4);
mapdata["Central Gondor"]["84.1S 41.7W"] = CGondorCoords(-84.1, -41.7);
mapdata["Central Gondor"]["79.0S 33.6W"] = CGondorCoords(-79.0, -33.6);
mapdata["Central Gondor"]["78.5S 35.5W"] = CGondorCoords(-78.5, -35.5);
mapdata["Central Gondor"]["85.6S 44.8W"] = CGondorCoords(-85.6, -44.8);
mapdata["Central Gondor"]["84.6S 43.9W"] = CGondorCoords(-84.6, -43.9);
mapdata["Central Gondor"]["80.8S 40.8W"] = CGondorCoords(-80.8, -40.8);
mapdata["Central Gondor"]["83.5S 44.2W"] = CGondorCoords(-83.5, -44.2);

EGondorCoords = Coords(-60.6, -26.5, -80.1, -0.1);
mapdata["Eastern Gondor"]={};
mapdata["Eastern Gondorc"] = EGondorCoords;
mapdata["Eastern Gondorq"] = EGondorCoords(-72.7, -12.5);
mapdata["Eastern Gondor"]["62.6S 6.4W"] = EGondorCoords(-62.6, -6.4);
mapdata["Eastern Gondor"]["63.0S 9.8W"] = EGondorCoords(-63.0, -9.8);
mapdata["Eastern Gondor"]["64.8S 3.9W"] = EGondorCoords(-64.8, -3.9);
mapdata["Eastern Gondor"]["66.3S 8.8W"] = EGondorCoords(-66.3, -8.8);
mapdata["Eastern Gondor"]["68.9S 9.8W"] = EGondorCoords(-68.9, -9.8);
mapdata["Eastern Gondor"]["70.0S 10.2W"] = EGondorCoords(-70.0, -10.2);
mapdata["Eastern Gondor"]["71.9S 8.1W"] = EGondorCoords(-71.9, -8.1);
mapdata["Eastern Gondor"]["76.7S 12.3W"] = EGondorCoords(-76.7, -12.3);
mapdata["Eastern Gondor"]["75.9S 14.4W"] = EGondorCoords(-75.9, -14.4);
mapdata["Eastern Gondor"]["76.3S 16.6W"] = EGondorCoords(-76.3, -16.6);
mapdata["Eastern Gondor"]["76.8S 17.2W"] = EGondorCoords(-76.8, -17.2);

WastesCoords = Coords(-26.1, -17.0, -41.5, 3.5);
mapdata["The Wastes"]={};
mapdata["The Wastesc"] = WastesCoords;
mapdata["The Wastes"]["37.3S 14.6W"] = WastesCoords(-37.3, -14.6);
mapdata["The Wastes"]["35.0S, 12.3W"] = WastesCoords(-35.0, -12.3);
mapdata["The Wastes"]["34.3S, 11.6W"] = WastesCoords(-34.3, -11.6);
mapdata["The Wastes"]["33.3S, 8.2W"] = WastesCoords(-33.3, -8.2);
mapdata["The Wastes"]["32.5S, 0.6E"] = WastesCoords(-32.5, 0.6);
mapdata["The Wastes"]["30.5S, 3.5W"] = WastesCoords(-30.5, -3.5);
mapdata["The Wastes"]["34.2S, 2.2E"] = WastesCoords(-34.2, 2.2);

GorgorothCoords = Coords(-35.4, -5.9, -69.4, 39.5);
mapdata["Gorgoroth"]={}
mapdata["Gorgorothc"] = GorgorothCoords;
mapdata["Gorgoroth"]["47.0S, 33.5E"] = GorgorothCoords(-47.0, 33.5);--Bolvag
mapdata["Gorgoroth"]["52.5S, 25.5E"] = GorgorothCoords(-52.5, 25.5);
mapdata["Gorgoroth"]["62.4S, 25.5E"] = GorgorothCoords(-62.4, 25.5);
mapdata["Gorgoroth"]["56.1S, 24.7E"] = GorgorothCoords(-56.1, 24.7);
mapdata["Gorgoroth"]["60.6S, 10.9E"] = GorgorothCoords(-60.6, 10.9);--Gristlebite
--mapdata["Gorgoroth"]["49.4S, 4.5E"] = GorgorothCoords(-49.4, 4.5);
mapdata["Gorgoroth"]["64.2S, 10.7E"] = GorgorothCoords(-64.2, 10.7);
mapdata["Gorgoroth"]["51.4S, 4.0E"] = GorgorothCoords(-51.4, 4.0);
mapdata["Gorgoroth"]["49.4S, 4.5E"] = GorgorothCoords(-49.4, 4.5);--Nuzdum
--mapdata["Gorgoroth"]["40.8S, 3.9E"] = GorgorothCoords(-40.8, 3.9);
mapdata["Gorgoroth"]["45.6S, 7.3E"] = GorgorothCoords(-45.6, 7.3);
mapdata["Gorgoroth"]["39.6S, 6.8E"] = GorgorothCoords(-39.6, 6.8);
mapdata["Gorgoroth"]["40.8S, 3.9E"] = GorgorothCoords(-40.8, 3.9);--Rotwing
mapdata["Gorgoroth"]["43.9S, 17.3E"] = GorgorothCoords(-43.9, 17.3);
mapdata["Gorgoroth"]["47.4S, 20.0E"] = GorgorothCoords(-47.4, 20.0);
mapdata["Gorgoroth"]["50.9S, 8.8E"] = GorgorothCoords(-50.9, 8.8);
mapdata["Gorgoroth"]["57.0S, 15.9E"] = GorgorothCoords(-57.0, 15.9);--Spitpyre
mapdata["Gorgoroth"]["60.8S, 26.3E"] = GorgorothCoords(-60.8, 26.3);
--mapdata["Gorgoroth"]["62.5S, 25.5E"] = GorgorothCoords(-62.5, 25.5);
--mapdata["Gorgoroth"]["58.7S, 20.7E"] = GorgorothCoords(-58.7, 20.7); --Uiluir
mapdata["Gorgoroth"]["50.9S, 12.7E"] = GorgorothCoords(-50.9, 12.7);
mapdata["Gorgoroth"]["52.8S, 14.4E"] = GorgorothCoords(-52.8, 14.4);
mapdata["Gorgoroth"]["61.7S, 15.8E"] = GorgorothCoords(-61.7, 15.8);

NMirkwoodCoords = Coords(37.4, -56.6, 5.3, -13.8);
mapdata["Northern Mirkwood"]={};
mapdata["Northern Mirkwoodc"] = NMirkwoodCoords;
mapdata["Northern Mirkwood"]["15.4N 43.1W"] = NMirkwoodCoords(15.4, -43.1);
mapdata["Northern Mirkwood"]["16.0N 36.2W"] = NMirkwoodCoords(16.0, -36.2);
mapdata["Northern Mirkwood"]["20.8N 24.7W"] = NMirkwoodCoords(20.8, -24.7);
mapdata["Northern Mirkwood"]["23.3N 27.4W"] = NMirkwoodCoords(23.3, -27.4);
mapdata["Northern Mirkwood"]["15.2N 22.8W"] = NMirkwoodCoords(15.2, -22.8);
mapdata["Northern Mirkwood"]["17.5N 23.5W"] = NMirkwoodCoords(17.5, -23.5);
mapdata["Northern Mirkwood"]["16.9N 47.8W"] = NMirkwoodCoords(16.9, -47.8);
mapdata["Northern Mirkwood"]["20.9N 43.2W"] = NMirkwoodCoords(20.9, -43.2);

