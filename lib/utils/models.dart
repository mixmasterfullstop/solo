import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class Post {
  String title;
  String image ;
  String description;
  int price;
  String location = 'harare';


  Post({this.title,this.image,this.description, this.price});
  

}

//List<Post> posts=[Post('Nissan UD90 Refridgerated Truck 2007','images/ud.jpg','Toyota Landcruiser Prado Mint Condition 2013 model , Steering Controls Automatic Transmission , Mag wheels Mileage : 109000 miles ZINARA Licence September 2020 Neat all round',1300),
//  Post('Toyota Prado Mint Condition','images/landcruiser.jpg','Toyota Landcruiser Prado Mint Condition 2013 model , Steering Controls Automatic Transmission , Mag wheels Mileage : 109000 miles ZINARA Licence September 2020 Neat all round..',26500),
//  Post('Chevrolet trailblazer 2016','images/chev.jpg','Chevrolet trailblazer 2016 model recent import in immaculate condition with 60000km on the clock 4x4 full leather interior 7 seater no dents full service record diesel ',29000),
//  Post('Toyota Hilux 2008','images/hilux.jpg','*swops accepted *new tyres',14900),
//  Post('Honda CRV RD2 Recent Import 1999','images/crv.jpg','013 model MILEAGE 97000km 4x4 manual transmission.',4900),

  // post('assets/img.png',





//];

List<Post> posts= [
  Post(
  title: 'Nissan UD90 Refridgerated Truck 2007',
    image:'images/ud.jpg',
    description:'Toyota Landcruiser Prado Mint Condition 2013 model , Steering Controls Automatic Transmission , Mag wheels Mileage : 109000 miles ZINARA Licence September 2020 Neat all round',
    price: 1300,
  ),
  Post(
    title: 'Toyota Landcruiser Prado Mint Condition',
    image:'images/landcruiser.jpg',
    description:'Toyota Prado Mint Condition 2013 , Steering Controls Automatic Transmission , Mag wheels Mileage : 109000 miles ZINARA Licence September 2020 Neat all round',
    price: 26500,
  ),
  Post(
    title: 'Chevrolet trailblazer 2016',
    image:'images/chev.jpg',
    description:'Chevrolet trailblazer 2016 model recent import in immaculate condition with 60000km on the clock 4x4 full leather interior 7 seater no dents full service record diesel',
    price: 29000,
  ),
  Post(
    title: 'Toyota Hilux 2008',
    image:'images/crv.jpg',
    description:'*swops accepted *new tyres',
    price: 14900,
  ),
  Post(
    title: 'Honda CRV RD2 Recent Import 1999',
    image:'images/crv.jpg',
    description:'2013 model MILEAGE 97000km 4x4 manual transmission',
    price: 4900,
  ),


];