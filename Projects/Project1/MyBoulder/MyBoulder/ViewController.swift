//
//  ViewController.swift
//  MyBoulder
//
//  Created by Nathanael Bennett on 10/7/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //OUTLETS
    @IBOutlet weak var outdoorExplorationSwitch: UISwitch!
    @IBOutlet weak var entertainmentSwitch: UISwitch!
    @IBOutlet weak var urbanAttractionsSwitch: UISwitch!
    @IBOutlet weak var moneySegmentControl: UISegmentedControl!
    @IBOutlet weak var seasonSegmentControl: UISegmentedControl!
    
    let one = Idea(nTitle: "Take a Tour of Avery Brewing Company", nImageName: "avery", nDescription: "Avery Brewing Company is a famed craft brewery just northeast of Boulder with excellent food and beer. Join a free tour to taste some samples and learn about the brewing process!", nAddress: "4910 Nautilus Ct, Boulder, CO 80301", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let two = Idea(nTitle: "Rock Climb in Boulder Canyon", nImageName: "bocan", nDescription: "Boulder Canyon offers a multitude of climbing adventures on its granite cliffs, including longer trad adventures or right-by-the-road sport climbs.", nAddress: "Boulder Canyon Dr, Nederland, CO 80466", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: true, nWinter: false, nPaid: false)
    let three = Idea(nTitle: "Visit Eldorado Canyon State Park", nImageName: "eldo", nDescription: "One of Colorado's most beautiful state parks, Eldorado Canyon features staggering sandstone cliffs, a beautiful river, and thriving wildlife.", nAddress: "9 Kneale Rd, Eldorado Springs, CO 80025", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: true, nWinter: false, nPaid: true)
    let four = Idea(nTitle: "Drive Trail Ridge Road", nImageName: "rmnp", nDescription: "Drive one of the most scenic roads in Colorado, which goes straight through Rocky Mountain National Park.", nAddress: "Trail Ridge Rd, Estes Park, CO 80517", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: true, nWinter: false, nPaid: true)
    let five = Idea(nTitle: "Snowshoe Indian Peaks Wilderness", nImageName: "snowshoe", nDescription: "Snowshoe through the winter wonderland of the Indian Peaks Wilderness! A great place to start from is the Brainard Lake winter parking lot.", nAddress: "Brainard Lake Road, Ward, CO", nCategory: "outdoors", nSummer: false, nFall: false, nSpring: true, nWinter: true, nPaid: false)
    let six = Idea(nTitle: "Hike to the Boulder Star", nImageName: "star", nDescription: "Every winter, this star lights up the hills behind Boulder. You can hike to it easily from a nearby parking spot, but make sure to go at night!", nAddress: "1138 Flagstaff Rd, Boulder, CO 80302", nCategory: "outdoors", nSummer: false, nFall: false, nSpring: false, nWinter: true, nPaid: false)
    let seven = Idea(nTitle: "Shop Pearl Street", nImageName: "pearl", nDescription: "Pearl Street has plenty to offer in any season, including quirky shops, great places to eat, and unique art installations and sculptures.", nAddress: "1942 Broadway #301, Boulder, CO 80302", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let eight = Idea(nTitle: "Paddleboard Boulder Reservoir", nImageName: "paddle", nDescription: "Paddleboard on this scenic reservoir right outside of Boulder. You can bring your own equipment or rent boards at the reservoir!", nAddress: "5565 51st St, Boulder, CO 80301", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: false, nWinter: false, nPaid: true)
    let nine = Idea(nTitle: "Beach Day at Boulder Reservoir", nImageName: "beach", nDescription: "Enjoy a sunny day at the closest thing to a beach in Colorado. Bring your volleyball, hop into the swimming area, have a barbeque, or rent some boats to explore the reservoir with.", nAddress: "5565 51st St, Boulder, CO 80301", nCategory: "outdoors", nSummer: true, nFall: false, nSpring: false, nWinter: false, nPaid: true)
    let ten = Idea(nTitle: "Mountain Bike at Betasso Preserve", nImageName: "bike", nDescription: "Bring your mountain bike for a cruise around Betasso Preserve, high up in Boulder Canyon. Fly through evergreen trees and around sandy banks while you complete this quick 3-mile loop.", nAddress: "Betasso Rd, Boulder, CO 80302", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: true, nWinter: false, nPaid: false)
    let eleven = Idea(nTitle: "Hike the Royal Arch Trail", nImageName: "arch", nDescription: "Hike up to this iconic spot in the Flatirons area for a neat rock formation and great views of Boulder.", nAddress: "900 Baseline Rd, Boulder, CO 80302", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let twelve = Idea(nTitle: "Run in Chautauqua", nImageName: "chau", nDescription: "Go for a run right next to the Flatirons for a unique and beautiful workout. For extra Boulder points, bike to the trailhead! Make sure to bring traction in the winter.", nAddress: "900 Baseline Rd, Boulder, CO 80302", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let thirteen = Idea(nTitle: "Visit the Denver Botanic Gardens", nImageName: "garden", nDescription: "This curated garden adn assortment of plants is one of the top five botanic gardens in the nation, and you won't want to miss it.", nAddress: "1007 York St, Denver, CO 80206", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    let fourteen = Idea(nTitle: "See the Denver Zoo Lights", nImageName: "zoo", nDescription: "Every winter, the Denver Zoo creates an incredible display of magical lights to decorate the animal exhibits. It has never been more fun to visit the zoo!", nAddress: "2900 E 23rd Ave, Denver, CO 80205", nCategory: "urban", nSummer: false, nFall: false, nSpring: false, nWinter: true, nPaid: true)
    let fifteen = Idea(nTitle: "Visit the Denver Aquarium", nImageName: "fish", nDescription: "Swim in shark tanks, see all kinds of amazing marine animals, or visit the brand new 4D theater. A great place to spend a few hours or a day!", nAddress: "700 Water St, Denver, CO 80211", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    let sixteen = Idea(nTitle: "Go to Water World", nImageName: "water", nDescription: "This fully-featured water park has all kinds of slides, pools, and adventure attractions. It is one of America's largest water parks!", nAddress: "8801 N. Pecos Street, Federal Heights, 80260", nCategory: "urban", nSummer: true, nFall: false, nSpring: false, nWinter: false, nPaid: true)
    let seventeen = Idea(nTitle: "Play Pinball at Lyons Pinball", nImageName: "pinball", nDescription: "Play over 40 different versions of pinball, and plenty of other arcade games, at this hidden spot in Lyons.", nAddress: "339 Main St, Lyons, CO 80540", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    let eighteen = Idea(nTitle: "Visit the CU Campus", nImageName: "cu", nDescription: "Boulder's CU campus is praised for being one of the most beautiful American college campuses, and it's easy to see why. Join a free tour of the unique buildings and fields in the heart of Boulder.", nAddress: "1669 Euclid Ave, Boulder, CO 80309", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let nineteen = Idea(nTitle: "Watch a Shakespeare Performance", nImageName: "shakes", nDescription: "Every summer, CU puts on many different Shakespeare productions in its outdoor amphitheater. Don't miss out on the CU Shakespeare Festival!", nAddress: "277 University Ave, Boulder, CO 80309", nCategory: "entertainment", nSummer: true, nFall: false, nSpring: false, nWinter: false, nPaid: true)
    let twenty = Idea(nTitle: "Catch a Concert at the Fox Theater", nImageName: "fox", nDescription: "Watch a show from local or traveling artists in the bustling Pearl Street District.", nAddress: "1135 13th St, Boulder, CO 80302", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    let twentyone = Idea(nTitle: "Visit the Farmer's Market", nImageName: "farmer", nDescription: "On Saturdays and Wednesdays, stop by the Boulder Farmer's Market for fresh produce, honey, crafts, and all sorts of other local products.", nAddress: "13th St, Boulder, CO 80302", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: false, nPaid: false)
    let twentytwo = Idea(nTitle: "Stargaze at Brainard Lake", nImageName: "stars", nDescription: "One of the best places to stargaze in the Boulder area is Brainard Lake, which has crystal-clear skies and mountain seclusion.", nAddress: "Brainard Lake Road, Ward, CO", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    let twentythree = Idea(nTitle: "Chill out at Boulder Public Library", nImageName: "books", nDescription: "There is plenty to see and do at Boulder's Public Library, including a makerspace, an art gallery, a coffee shop, and all the books you could ever need.", nAddress: "1001 Arapahoe Ave, Boulder, CO 80302", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let twentyfour = Idea(nTitle: "Explore the Boulder Creek Path", nImageName: "path", nDescription: "Walk or bike along the wandering Boulder Creek Path, which explores the city and runs next to its namesake creek.", nAddress: "Boulder, CO 80302", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let twentyfive = Idea(nTitle: "Visit Boulder Falls", nImageName: "falls", nDescription: "A great spot for hiking and photography, Boulder Falls is a stunning location in any season.", nAddress: "Boulder Canyon Dr, Nederland, CO 80466", nCategory: "outdoors", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let twentysix = Idea(nTitle: "Visit Fiske Planetarium", nImageName: "fiske", nDescription: "Fiske Planetarium features informative talks, engaging tours of the solar system, and laser and light shows set to your favorite tunes.", nAddress: "2414 Regent Dr, Boulder, CO 80309", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    let twentyseven = Idea(nTitle: "Explore the Hill", nImageName: "hill", nDescription: "Boulder's University Hill has a ton of shops and restaurants to explore, and is a classic spot for college students to hang out.", nAddress: "College Ave, Boulder, CO 80302", nCategory: "urban", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: false)
    let twentyeight = Idea(nTitle: "Watch a Game at CU Events Center", nImageName: "events", nDescription: "Catch the CU basketball or volleyball teams on the court in this huge arena, sure to be packed with CU students and Boulder locals.", nAddress: "950 Regent Dr, Boulder, CO 80309", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    let twentynine = Idea(nTitle: "Tube Down Boulder Creek", nImageName: "tube", nDescription: "Summer is prime time to tube down Boulder Creek with friends. There is even a Tube to Work Day once a year, where people tube straight to work in their business clothes or ridiculous costumes.", nAddress: "Boulder, CO 80302", nCategory: "outdoors", nSummer: true, nFall: false, nSpring: false, nWinter: false, nPaid: false)
    let thirty = Idea(nTitle: "Hang Out at the Boulder Bandshell", nImageName: "bandshell", nDescription: "From concerts to scavenger hunts to ballet performances, there is always something happening at the Boulder Bandshell downtown.", nAddress: "1212 Canyon Blvd, Boulder, CO 80302", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: true, nWinter: false, nPaid: false)
    let thirtyone = Idea(nTitle: "Watch Entertainers on Pearl Street", nImageName: "juggle", nDescription: "From knife jugglers and fire throwers to singers and instrumentalists, there are always interesting entertainers playing for the crowds on Pearl Street.", nAddress: "1942 Broadway #301, Boulder, CO 80302", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: true, nWinter: false, nPaid: false)
    let thirtytwo = Idea(nTitle: "Visit Folsom Stadium", nImageName: "folsom", nDescription: "Whether you are there for a 4th of July celebration or a CU football game, Folsom Stadium is always worth checking out.", nAddress: "2400 Colorado Ave, Boulder, CO 80302", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: false, nWinter: false, nPaid: true)
    let thirtythree = Idea(nTitle: "Visit the Denver Art Museum", nImageName: "art", nDescription: "With a variety of modern and historical exhibits, the Denver Art Museum is sure to please art-lovers of all ages.", nAddress: "100 W 14th Ave Pkwy, Denver, CO 80204", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    let thirtyfour = Idea(nTitle: "Red Rocks Amphitheater", nImageName: "rocks", nDescription: "Red Rocks Amphitheater is one of the most unique and iconic concert venues in the world, nestled into the Rocky Mountains west of Denver.", nAddress: "18300 W Alameda Pkwy, Morrison, CO 80465", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: true, nWinter: false, nPaid: true)
    let thirtyfive = Idea(nTitle: "Watch a Movie at Century Theaters", nImageName: "movie", nDescription: "Go to Boulder's local movie theater to catch the latest blockbuster or indie film. There are plenty of restaurants nearby on the 29th Street Mall!", nAddress: "1700 29th St, Boulder, CO 80301", nCategory: "entertainment", nSummer: true, nFall: true, nSpring: true, nWinter: true, nPaid: true)
    
    var masterList = [Idea]()
    var selectedIdea = Idea()
    
    @IBAction func generateIdea(_ sender: CustomButton) {
        print("let's go!")
        if outdoorExplorationSwitch.isOn{
            print("you like nature")
        }
        if entertainmentSwitch.isOn{
            print("you like entertainment")
        }
        if urbanAttractionsSwitch.isOn{
            print("you like urban areas")
        }
        if moneySegmentControl.selectedSegmentIndex == 1 {
            print("you are rich")
        } else{
            print("you are college student")
        }
        if seasonSegmentControl.selectedSegmentIndex == 0{
            print("you like flowers")
        }else if seasonSegmentControl.selectedSegmentIndex == 1{
            print("you like warm weather")
        }else if seasonSegmentControl.selectedSegmentIndex == 2{
            print("you like leaves")
        }else if seasonSegmentControl.selectedSegmentIndex == 3{
            print("you like snow")
        }
        
        masterList = [one, two, three, four, five]
        let randomIndex = Int.random(in: 0...4)
        selectedIdea = masterList[randomIndex]
        
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //pass the idea to the next screen
        if segue.identifier == "buttonTapped" { //make sure this is the right segue
            let newView = segue.destination as? IdeaScreenController //cast UIViewController to IdeaScreenController to access property generatedIdea
            newView?.generatedIdea = selectedIdea //set generatedIdea Idea to be the one selected here
        }
    }

}

