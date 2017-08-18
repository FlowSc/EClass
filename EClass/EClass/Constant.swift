//
//  Constant.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 18..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import Foundation

struct StoryBoardConstant {
    static let detailPage = "DetailPage"
    static let searchPage = "SearchPage"
    static let locationSelectPage = "LocationSelect"
    static let categorySelectPage = "CategorySelect"
}

struct SegueIdentifier {
    static let detailSegue = "DetailPageSegue"
    static let categoryFilterSegue = "CategoryFilterSegue"
}

struct CustomCollectionViewCell {
    static let location = "LocationCollectionViewCell"
    static let category = "CategoryCollectionViewCell"
    static let lectureDetail = "RecommendCollectionViewCell"
    static let lectureImage = "LectureImageCollectionViewCell"

}

struct CustomsTableViewCell {
    static let location = "LocationCell"
    static let category = "CategoryCell"
    static let lectureDetail = "RecommendCell"
    static let tutorDetail = "tutorDetailInfoCell"
    static let lectureIntro = "LectureIntroTableViewCell"
    static let mapLocation = "MapLocationTableViewCell"
    static let lectureReview = "LectureReviewTableViewCell"
    static let lectureBasicInfo = "IntroductionCell"
    static let tutorBasicInfo = "tutorInfoCell"
}

struct NibFile {
    static let tutorDetail = "TutorDetailTableViewCell"
    static let lectureIntro = "LectureIntroTableViewCell"
    static let mapLocation = "MapLocationTableViewCell"
    static let lectureReivew = "LectureReviewCell"
    static let lectureImage = "LectureImageCollectionViewCell"
}
