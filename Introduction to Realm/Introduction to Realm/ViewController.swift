//
//  ViewController.swift
//  Introduction to Realm
//
//  Created by Hugo Doria on 19/12/14.
//  Copyright (c) 2014 Hugo Doria. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
            you probably will do this after fetch some requests from a webserver
        */
        
        println("Our default realm is located at \(RLMRealm.defaultRealmPath())")
        let realm = RLMRealm.defaultRealm()
        
        realm.transactionWithBlock() {
            let pinkFloyd = Artist()
            pinkFloyd.name = "Pink Floyd"
            pinkFloyd.country = "England"

            let ledZeppelin = Artist()
            ledZeppelin.name = "Led Zeppelin"
            ledZeppelin.country = "England"
            
            /*  createOrUpdateInDefaultRealmWithObject avoids duplicating records by looking at the
            primary key we have set on our RLMObject model.
            */
            Artist.createOrUpdateInDefaultRealmWithObject(pinkFloyd)
            Artist.createOrUpdateInDefaultRealmWithObject(ledZeppelin)
            
            // Also, we could do this
            // realm.addObject(pinkFloyd)
            
            // Or this:
            // realm.addObjects([pinkFloyd, ledZeppelin])
            
            let theDarkSideOfTheMoon = Album()
            theDarkSideOfTheMoon.name = "The Dark Side Of The Moon"
            theDarkSideOfTheMoon.year = "1973"
            theDarkSideOfTheMoon.genre = "Progressive Rock"
            theDarkSideOfTheMoon.coverUrl = "http://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png"
            theDarkSideOfTheMoon.artist = pinkFloyd
            
            let zepellinIV = Album()
            zepellinIV.name = "Led Zeppelin IV"
            zepellinIV.year = "1971"
            zepellinIV.genre = "Classic Rock"
            zepellinIV.coverUrl = "http://cdn.stereogum.com/files/2014/10/ledzeppelin4-608x608.jpg"
            zepellinIV.artist = ledZeppelin
            
            Album.createOrUpdateInDefaultRealmWithObject(theDarkSideOfTheMoon)
            Album.createOrUpdateInDefaultRealmWithObject(zepellinIV)
        }
        
        // retrieving some albums
        let albums = Album.allObjects()
        for album in albums {
            let anAlbum = album as Album
            println("The album name is \(anAlbum.name) and the artist is \(anAlbum.artist!.name)")
        }
        
        // retrieving only pink floyd albums
        let pinkFloydAlbums = Album.objectsWhere("artist.name = 'Pink Floyd'", 0)
        for pinkFLoydAlbum in pinkFloydAlbums {
            let anPinkFloyAlbum = pinkFLoydAlbum as Album
            println("The album \(anPinkFloyAlbum.name) is from the best artist ever and was released on \(anPinkFloyAlbum.year)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

