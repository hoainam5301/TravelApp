import 'package:flutter/material.dart';
import 'package:travelapp/models/hotel_model.dart';
import 'package:travelapp/screens/main_view/list_hotel_screen.dart';
import 'package:travelapp/screens/main_view/detailspage.dart';

class HotelCarousel extends StatelessWidget {
  final List<Hotel> hotels;
  HotelCarousel(this.hotels);

  @override
  Widget build(BuildContext context) {
    List<Hotel> tophotels = [hotels[0], hotels[1], hotels[2]];
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Exclusive Hotels',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ListHotelScreen(
                      hotels: hotels,
                    ),
                  ),
                ),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tophotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = tophotels[index];
              return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 240.0,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(
                            hotel.name,
                            hotel.imageUrl,
                            hotel.description,
                            hotel.latitude,
                            hotel.longitude,
                            hotel.price,
                            hotel.rating),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                            height: 120.0,
                            width: 240.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    hotel.name,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    hotel.address,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    '\$${hotel.price} / night',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 220.0,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
