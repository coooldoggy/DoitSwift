//
//  ViewController.swift
//  Map
//
//  Created by ATS on 2019/10/16.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        //정확도 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //위치 데이터 추적을 위해 사용자에게 승인 요청
        locationManager.requestWhenInUseAuthorization()
        //위치 업데이트 시작
        locationManager.startUpdatingLocation()
        //위치 보기 값을 true로 설정
        myMap.showsUserLocation = true
    }
    
    func goLocation(latValue: CLLocationDegrees, longValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latValue, longValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last
        _ = goLocation(latValue: (pLocation?.coordinate.latitude)!, longValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += ""
                address = pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    
    func setAnnotation(latVal: CLLocationDegrees, longVal: CLLocationDegrees, delta span:Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latValue: latVal, longValue: longVal, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }

    @IBOutlet var myMap: MKMapView!
    
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latVal: 37.751853, longVal: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        }else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latVal: 37.5307871, longVal: 126.8981, delta: 0.1, title: "이지스 퍼블리싱", subtitle: "서울시 영등포구 당산로 41길 11")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        }else if sender.selectedSegmentIndex == 3 {
            setAnnotation(latVal: 37.517184, longVal: 126.9776987, delta: 0.1, title: "이 집 사줘", subtitle: "서울시 용산구 이촌동 300-3")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "로또 당첨"
        }
    }
}

