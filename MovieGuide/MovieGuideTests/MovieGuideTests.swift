//
//  MovieGuideTests.swift
//  MovieGuideTests
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import XCTest
import MovieGuideAPI
@testable import MovieGuide

class MovieGuideTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsingSearchResults() throws {
        let bundle = Bundle(for: MovieGuideTests.self)
        guard let url = bundle.url(forResource: "search", withExtension: "json") else {
            fatalError("search_result.json file not found in resources")
        }
        let data = try Data(contentsOf: url)
        let result = try JSONDecoder().decode(Search.self, from: data)
        
        let movie = result.search[1]
        XCTAssertEqual(movie.title, "Batman v Superman: Dawn of Justice")
        XCTAssertEqual(movie.type, "movie")
        XCTAssertEqual(movie.year, "2016")
        XCTAssertEqual(movie.imdbId, "tt2975590")
        XCTAssertEqual(result.totalResults, "366")
    }
    
    func testParsingMovieDetail() throws {
        let bundle = Bundle(for: MovieGuideTests.self)
        guard let url = bundle.url(forResource: "movie", withExtension: "json") else {
            fatalError("Movie.json file not found in resources")
        }
        let data = try Data(contentsOf: url)
        let movie = try JSONDecoder().decode(Movie.self, from: data)
        
        XCTAssertEqual(movie.title, "Batman v Superman: Dawn of Justice")
        XCTAssertEqual(movie.genre, "Action, Adventure, Fantasy, Sci-Fi")
        XCTAssertEqual(movie.year, "2016")
        XCTAssertEqual(movie.imdbId, "tt2975590")
    }

}
