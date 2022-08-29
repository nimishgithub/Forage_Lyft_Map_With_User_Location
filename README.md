# Forage_Lyft_Map_With_User_Location

1. Open the RideSharer.xcodeproj file in the RideSharer_Map_Start folder.
 
2. Add a map to the view. Use constraints to make it cover the entire view, like you did with the ride history table view, and similarly create an IBOutlet for it.
 
3. Get the user's current location and display it on the map.
 
4. If the user denies location access, show an alert telling the user that they have not provided permission.
 
5. Run the app and ensure the location request is displayed. Allow the request and see that your location is showing on the map. Reset the location permissions by removing the app, then re-running it. This time, deny permission to track your location. Run the app again and see that the alert is displayed.
