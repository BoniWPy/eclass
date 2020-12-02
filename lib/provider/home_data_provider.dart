import 'dart:convert';
import 'package:eclass/model/zoom_meeting.dart';
import 'package:flutter/material.dart';
import '../common/apidata.dart';
import '../model/home_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HomeDataProvider with ChangeNotifier {
  HomeModel homeModel;
  List<SliderFact> sliderFactList = [];
  List<MySlider> sliderList = [];
  List<Testimonial> testimonialList = [];
  List<Trusted> trustedList = [];
  List<MyCategory> featuredCategoryList = [];
  List<SubCategory> subCategoryList = [];
  List<MyCategory> categoryList = [];
  List<ChildCategory> childCategoryList = [];
  List<ZoomMeeting> zoomMeetingList = [];
  Map categoryMap = {};

  void generateLists(HomeModel homeData) {
    generateSliderFactList(homeData.sliderfacts);
    generateSliderList(homeData.slider);
    generateTestimonialList(homeData);
    generateTrustedList(homeData);
    generateFeaturedCategoryList(homeData);
    generateCategoryList(homeData);
    generateSubCateList(homeData);
    generateChildCateList(homeData);
    // generateMeetingList(homeData.zoomMeeting);
  }

  Future<HomeModel> getHomeDetails(context) async {
    String url = APIData.home + APIData.secretKey;
    Response res = await get(url);
    sliderList.add(MySlider(
                id:1,
                heading:"Ini SLiders 1",
                subHeading:"ini subheading",
                searchText:"0",
                detail:"ini adalah detail dari detail",
                status:"1",
                image:"1606843923IMG_5559.JPG",
                position:1,
                createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
                updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
                // "left":1
        ));
    sliderFactList.add(
      SliderFact(
        id:1,
        icon:"fa-adn",
        heading:"headering",
        subHeading:"sub headering",
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
      )
    );
    trustedList.add(
      Trusted(
        id:1,
        url:"https:\/\/contact.boniw.io",
        image:"1606844011man.png",
        status:"1",
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
      )
    );
    categoryList.add(
      MyCategory(
        id:1,
        title:"programing",
        icon:"fa-500px",
        slug:"programing",
        featured:"1",
        status:"1",
        position:1,
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        catImage:"1606844811proses.png"
      )
    );
    categoryList.add(
      MyCategory(
        id:2,
        title:"matematika",
        icon:"fa-adjust",
        slug:"matematika",
        featured:"1",
        status:"1",
        position:2,
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        catImage:"1606844838proses.png"
      )
    );

    subCategoryList.add(
      SubCategory(
        id:1,
        categoryId:"1",
        title:"backend",
        icon:"fa-american-sign-language-interpreting",
        slug:"backend",
        status:"1",
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
      )
    );
    subCategoryList.add(
      SubCategory(
        id:1,
        categoryId:"2",
        title:"frontend",
        icon:"fa-adjust",
        slug:"frontend",
        status:"1",
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
      )
    );
    childCategoryList.add(
      ChildCategory(
        id:1,
        categoryId:1,
        subcategoryId:"1",
        title:"Mari b elajar PHP",
        icon:"fa-anchor",
        slug:"mari-b-elajar-php",
        status:"1",
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
      )
    );
    featuredCategoryList.add(
      MyCategory(
        id:1,
        title:"programing",
        icon:"fa-500px",
        slug:"programing",
        featured:"1",
        status:"1",
        position:1,
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        catImage:"1606844811proses.png"
      )
    );
    featuredCategoryList.add(
      MyCategory(
        id:2,
        title:"matematika",
        icon:"fa-adjust",
        slug:"matematika",
        featured:"1",
        status:"1",
        position:2,
        createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        catImage:"1606844838proses.png"
      )
    );
    testimonialList.add(
      Testimonial(
          id:1,
         clientName:"BOniq",
         details:"<p>Terimakasih bang bos... saya jadi bisa mengoding<\/p>",
        //  status:DateTime.parse("2020-12-02T01:21:44.000000Z"),
         image:"1606843923IMG_5559.JPG",
         createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
      )
    );
   

    
    print(res.statusCode);
    if (res.statusCode == 200) {
      // homeModel = HomeModel.fromJson(json.decode(res.body));
      homeModel= HomeModel(
        // settings: Settings(
        //             id:1,
        //             projectTitle:"eclasss",
        //             logo:"logo.png",
        //             favicon:"favicon.png",
        //             cpyTxt:"Copyright \u00a9 2020 eClass.",
        //           ),
        settings: Settings(
                    id:1,
                    projectTitle:"eclasss",
                    logo:"logo.png",
                    favicon:"favicon.png",
                    cpyTxt:"Copyright \u00a9 2020 eClass.",
                    logoType:"L",
                    rightclick:1,
                    inspect:1,
                    metaDataDesc:"test desc",
                    metaDataKeyword:"test keyword",
                    googleAna:"null",
                    fbPixel:"null",
                    fbLoginEnable:1,
                    googleLoginEnable:1,
                    gitlabLoginEnable:1,
                    stripeEnable:0,
                    instamojoEnable:0,
                    paypalEnable:1,
                    paytmEnable:0,
                    braintreeEnable:0,
                    razorpayEnable:0,
                    paystackEnable:0,
                    wEmailEnable:1,
                    verifyEnable:0,
                    welEmail:"boniw@getnada.com",
                    defaultAddress:"Comapny 12345 South Main Street Anywhere",
                    defaultPhone:"9123456789",
                    instructorEnable:1,
                    debugEnable:1,
                    catEnable:0,
                    featureAmount:null,
                    preloaderEnable:1,
                    zoomEnable:1,
                    amazonEnable:0,
                    captchaEnable:0,
                    bblEnable:0,
                    mapLat:null,
                    mapLong:null,
                    mapEnable:"image",
                    contactImage:null,
                    mobileEnable:1,
                    promoEnable:0,
                    promoText:null,
                    promoLink:null,
                    linkedinEnable:0,
                    mapApi:null,
                    twitterEnable:0,
                    awsEnable:0,
                    certificateEnable:1,
                    deviceControl:0,
                    ipblockEnable:0,
                    ipblock:null,
                    // "assignment_enable":0,
                    // "appointment_enable":0,
                    createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
                    updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
                    // "hide_identity":0,
                    // "footer_logo":null,
                    // "enable_omise":0,
                    // "enable_payu":0,
                    // "enable_moli":0,
                    // "enable_cashfree":0,
                    // "enable_skrill":0,
                    // "enable_rave":0,
                    // "preloader_logo":null,
                    // "chat_bubble":null,
                    // "wapp_phone":null,
                    // "wapp_popup_msg":null,
                    // "wapp_title":null,
                    // "wapp_position":null,
                    // "wapp_color":null,
                    // "wapp_enable":0,
                    // "enable_payhere":0
                  ),
        currency: Currency(
                    id:1,
                    icon:"fa fa-inr",
                    currency:"INR",
                    currencyDefault:0,
                    createdAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
                    updatedAt:DateTime.parse("2020-12-02T01:21:44.000000Z"),
        ),
        slider: sliderList,
        sliderfacts: sliderFactList,
        trusted: trustedList,
        testimonial: testimonialList,
        category: categoryList,
        subcategory: subCategoryList,
        childcategory: childCategoryList,
        featuredCate: featuredCategoryList,
      zoomMeeting: zoomMeetingList
      );
      generateLists(homeModel);
      for (int i = 0; i < homeModel.category.length; i++) {
        categoryMap[homeModel.category[i].id] = homeModel.category[i].title;
      }
    } else {
      throw "Can't get home data";
    }
    notifyListeners();
    return homeModel;
  }

  void generateMeetingList(List<ZoomMeeting> zoomMeeting){
    // zoomMeetingList = List.generate(zoomMeeting.length, (index) => ZoomMeeting(
    //   id: zoomMeeting[index].id,
    //   courseId: zoomMeeting[index].courseId,
    //   meetingId: zoomMeeting[index].meetingId,
    //   meetingTitle: zoomMeeting[index].meetingTitle,
    //   startTime: zoomMeeting[index].startTime,
    //   zoomUrl: zoomMeeting[index].zoomUrl,
    //   userId: zoomMeeting[index].userId,
    //   agenda: zoomMeeting[index].agenda,
    //   createdAt: zoomMeeting[index].createdAt,
    //   updatedAt: zoomMeeting[index].updatedAt,
    //   type: zoomMeeting[index].type,
    //   linkBy: zoomMeeting[index].linkBy,
    //   ownerId: zoomMeeting[index].ownerId,
    // ));
     zoomMeetingList.add(
       ZoomMeeting(
          id: 1,
          courseId: "1",
          meetingId: "95409871417",
          meetingTitle: "Pelatihan sertifikasi",
          startTime: DateTime.parse("2020-12-22 06:55:47"),
          zoomUrl: "https://zoom.us/j/95409871417?pwd=WGQ0Zmw3a0RjT0tUcDladXhXSWVNQT09",
          userId: "boniw",
          agenda: "Rapat",
          createdAt: DateTime.parse("2020-12-01 20:00:00"),
          updatedAt: DateTime.parse("2020-12-01 20:00:00"),
          type: "UMUM",
          linkBy: "DidzaCorp",
          ownerId: "Jack jack",
        )
     );

  }

  void generateSliderFactList(List<SliderFact> sliderfacts) {
    sliderFactList = List.generate(
        sliderfacts.length,
        (index) => SliderFact(
              id: sliderfacts[index].id,
              icon: sliderfacts[index].icon,
              heading: sliderfacts[index].heading,
              subHeading: sliderfacts[index].subHeading,
              createdAt: sliderfacts[index].createdAt,
              updatedAt: sliderfacts[index].updatedAt,
            ));
  }

  void generateSliderList(List<MySlider> slider) {
    sliderList = List.generate(slider == null ? 0 : slider.length, (index) {
      return MySlider(
        id: slider[index].id,
        image: slider[index].image,
        heading: slider[index].heading,
        subHeading: slider[index].subHeading,
        detail: slider[index].detail,
        searchText: slider[index].searchText,
        position: slider[index].position,
        status: slider[index].status,
        createdAt: slider[index].createdAt,
        updatedAt: slider[index].updatedAt,
      );
    });
  }

  void generateTestimonialList(HomeModel homeModels) {
    testimonialList = List.generate(
        homeModel.testimonial.length,
        (index) => Testimonial(
              id: homeModels.testimonial[index].id,
              clientName: homeModels.testimonial[index].clientName,
              image: homeModels.testimonial[index].image,
              status: homeModels.testimonial[index].status,
              details: homeModels.testimonial[index].details,
              createdAt: homeModels.testimonial[index].createdAt,
              updatedAt: homeModels.testimonial[index].updatedAt,
            ));
    testimonialList.removeWhere((element) => element.status == "0");
  }

  void generateTrustedList(HomeModel homeModels) {
    trustedList = List.generate(
        homeModel.trusted.length,
        (index) => Trusted(
              id: homeModels.trusted[index].id,
              url: homeModels.trusted[index].url,
              image: homeModels.trusted[index].image,
              status: homeModels.trusted[index].status,
              createdAt: homeModels.trusted[index].createdAt,
              updatedAt: homeModels.trusted[index].updatedAt,
            ));
  }

  void generateFeaturedCategoryList(HomeModel homeModels) {
    featuredCategoryList = List.generate(
        homeModel.featuredCate.length,
        (index) => MyCategory(
            id: homeModels.featuredCate[index].id,
            slug: homeModels.featuredCate[index].slug,
            icon: homeModels.featuredCate[index].icon,
            title: homeModels.featuredCate[index].title,
            status: homeModels.featuredCate[index].status,
            featured: homeModels.featuredCate[index].featured,
            position: homeModels.featuredCate[index].position,
            updatedAt: homeModels.featuredCate[index].updatedAt,
            createdAt: homeModels.featuredCate[index].createdAt,
            catImage: homeModels.featuredCate[index].catImage,
        ),
    );
    featuredCategoryList.removeWhere((element) => element.status == "0");
  }

  void generateCategoryList(HomeModel homeModels) {
    categoryList = List.generate(
        homeModel.category.length,
        (index) => MyCategory(
              id: homeModels.category[index].id,
              title: homeModels.category[index].title,
              icon: homeModels.category[index].icon,
              slug: homeModels.category[index].slug,
              featured: homeModels.category[index].featured,
              status: homeModels.category[index].status,
              position: homeModels.category[index].position,
              createdAt: homeModels.category[index].createdAt,
              updatedAt: homeModels.category[index].updatedAt,
            )
    );
    categoryList.removeWhere((element) => element.status == "0");
  }

  void generateSubCateList(HomeModel homeModels) {
    subCategoryList = List.generate(
        homeModel.subcategory.length,
        (index) => SubCategory(
              id: homeModels.subcategory[index].id,
              icon: homeModels.subcategory[index].icon,
              categoryId: homeModels.subcategory[index].categoryId,
              status: homeModels.subcategory[index].status,
              slug: homeModels.subcategory[index].slug,
              title: homeModels.subcategory[index].title,
              createdAt: homeModels.subcategory[index].createdAt,
              updatedAt: homeModels.subcategory[index].updatedAt,
            ));
    subCategoryList.removeWhere((element) => element.status == "0");
  }

  void generateChildCateList(HomeModel homeModels) {
    childCategoryList = List.generate(
        homeModel.childcategory.length,
        (index) => ChildCategory(
              id: homeModels.childcategory[index].id,
              status: homeModels.childcategory[index].status,
              title: homeModels.childcategory[index].title,
              slug: homeModels.childcategory[index].slug,
              icon: homeModels.childcategory[index].icon,
              subcategoryId: homeModels.childcategory[index].subcategoryId,
              categoryId: homeModels.childcategory[index].categoryId,
              createdAt: homeModels.childcategory[index].createdAt,
              updatedAt: homeModels.childcategory[index].updatedAt,
            ));
    childCategoryList.removeWhere((element) => element.status == "0");
  }

  String getCategoryName(String id) {
    return categoryMap[int.parse(id)];
  }
}
