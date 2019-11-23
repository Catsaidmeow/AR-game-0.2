//
//  SceneManager.swift
//  AR try 0.1
//
//  Created by denys pashkov on 13/11/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit

class MemesClass {
    
    var memeDict: [Int:Meme] = [
        0:
            Meme(imageName: "box", description: "\"Me, also me: \"refers to the snowclone template \"Me: X Also me: Y.\" In the template, \"X\" represents something laudatory about one's self, while \"Y\" contradicts \"X.\" This meme is similar to Evil Kermit. The earliest known iteration appeared on March 29th, 2015, on Twitter", name: "Me every weekend", hint: "Look for a box"),
        1:
            Meme(imageName: "bottle", description: "It's a Surprise Tool That Will Helps Us Later: is a screenshot from the Disney Channel animated television series Mickey Mouse Clubhouse. The meme generally keeps the image of Mickey saying the line, \"it's a surprise tool that will help us later,\" while the caption indicates that the surprise tool is something outside the realm of the Disney universe. The cartoon series premiered on May 6th 2006, but it started to become viral in 2017", name: "Caesar's assassination", hint: "Look for a bottle"),
        2:
            Meme(imageName: "guitar", description: "Go Home, You Are Drunk: is an expression used to point out someone else's failure or misplaced objects, similar to other well-known dismissive statements like You're Doing It Wrong and Buzzkilling. The phrase is typically featured in image macros in which the subject is performing a task incorrectly or found in an out-of-place position. It became viral in 2012 ", name: "Drunk guitar", hint: "Look for a guitar"),
        3:
            Meme(imageName: "trash", description: "Know your fucking place, trash: refers to a memorable scene from a video by YouTuber Filthy Frank(05/04/2016). Online, still images from the video have been used as macros and exploitables. After one month people started to share this meme.", name: "Know your place", hint: "Look for trash"),
        4:
            Meme(imageName: "water", description: "Scissors vs. Water: also known as Cutting Water With Scissors, refers to an exploitable stock image of a stream of tap water being cut by a pair of scissors. In January 2019, the image was circulated as an object-labeling meme illustrating various futile actions.", name: "Every gamers' problem", hint: "Look for some water"),
        5:
            Meme(imageName: "tablet", description: "Tech Support Gandalf is an advice animal character based on a behind-the-scene photograph of British actor Ian McKellen using a laptop computer while dressed in his Gandalf costume on the set of the 2012 epic fantasy film The Hobbit. The series portrays the actor as a tech-savvy wizard who offers troubleshooting tips and commentaries on social media phenomena. This meme became viral in 2014", name: "Gandalf ", hint: "Look for a tablet"),
        6:
            Meme (imageName: "cybertruck.jpeg", description: "Cybertruck is an electric truck vehicle manufactured by Elon Musk's automotive and energy company Tesla, Inc. After the truck was unveiled on November 21st 2019, memes about the vehicle's angular design widely circulated on Reddit and Twitter.", name: "Cybertruck", hint: "--"),
        7:
            Meme (imageName: "ok_boomer.jpeg", description: "OK Boomer is a dismissive retort often used to disregard or mock Baby Boomers and those who are perceived as old-fashioned and being out-of-touch.The exact origin of the phrase is currently unknown. On 4chan, the retort was first used by an anonymous /r9k/ user on September 3rd, 2015. On Reddit, the phrase was first used as a retort on October 26th, 2017. On Twitter, the phrase was first used on April 12th, 2018.", name: "Ok Boomer", hint: "--"),
        8:
            Meme (imageName: "jojo_reference.jpeg", description: "Is That a JoJo Reference? is a rhetorical question often used ironically by online commenters in response to pictures that include allusions to the manga and anime series JoJo's Bizarre Adventure. The jojo reference expression comes from a 4chan's /a/ thread on December 9th, 2009.", name: "Jojo Reference", hint: "--"),
        9:
            Meme (imageName: "cat.jpeg", description: "Woman Yelling at a Cat refers to a meme format featuring a screen cap of The Real Housewives of Beverly Hills cast members Taylor Armstrong and Kyle Richards followed by a picture of a confused-looking cat sitting behind a dinner plate. The format gained significant popularity across the web in mid-June 2019 and the cat was later identified as Smudge the Cat. This meme became viral in June 2019.", name: "Woman Yelling at a Cat", hint: "--"),
        10:
            Meme (imageName: "mini_keanu_reeves.jpeg", description: "Mini Keanu Reeves, also known as Midget Keanu Reeves and Short Keanu Reeves, refers to a still image of Keanu Reeves from the E3 2019 Cyberpunk 2077 presentation, edited to make the actor appear disproportionately short. Online, the image has been circulated as a blursed image and used as an exploitable. It became viral on June 9th 2019.", name: "Mini Keanu Reeves", hint: "--"),
        11:
            Meme (imageName: "area_51.jpeg", description: "Storm Area 51, also known as the Area 51 Raid and Alienstock, is a satirical Facebook event that calls for an assembly of a flash mob to infiltrate the top-secret American military airbase in Lincoln County, Nevada, scheduled to commence at 3:00 a.m. on September 20th, 2019. Since its launch in late June, the Facebook page went viral and millions of people have signed up to attend.", name: "Storm Area 51", hint: "--"),
        12:
            Meme (imageName: "naruto_run.jpeg", description: "Area 51 Naruto Run refers to the online nickname of Elia Elixir, an attendee of the Storm Area 51 event who photobombed a live newscast by performing Naruto Run as referenced in the original description for the event. The run, a parody of an action performed by the titular character from the anime Nartuto, features a person running with their arms stretched behind their back and their torso hinged at the waste. Video of the newscast went viral on various websites and inspired a series of image macro memes.", name: "Naruto run", hint: "--"),
//        13:
//            Meme (imageName: "", description: "", name: "", hint: ""),
//        14:
//            Meme (imageName: "", description: "", name: "", hint: ""),
//        15:
//            Meme (imageName: "", description: "", name: "", hint: ""),
//        16:
//            Meme (imageName: "", description: "", name: "", hint: ""),
//        17:
//        Meme (imageName: "", description: "", name: "", hint: ""),
//        18:
//        Meme (imageName: "", description: "", name: "", hint: ""),
//        19:
//        Meme (imageName: "", description: "", name: "", hint: ""),
//        20:
//        Meme (imageName: "", description: "", name: "", hint: ""),
    
    ]
    
    // save the index for the found meme in plist
    func storeFoundMeme(){
        
        let archiveURL = Bundle.main.url(forResource: "FoundMemes", withExtension: "plist")!
        
        // store the index of the memes found
        var foundMemeNames: [Int] = []
        for (key, meme) in memeDict {
            if meme.found {
                foundMemeNames.append(key)
            }
        }
        
        let encoded = try? PropertyListEncoder().encode(foundMemeNames)
        try? encoded?.write(to: archiveURL, options: .noFileProtection)
        
    }
    
    // load found memes from plist file and set found to true
    func loadFoundMemes(){
        
        if  let archiveURL = Bundle.main.url(forResource: "FoundMemes", withExtension: "plist"),
            let retrivedNotesData = try? Data(contentsOf: archiveURL),
            let foundIndecies = try? PropertyListDecoder().decode([Int].self, from: retrivedNotesData) {
            
            for index in foundIndecies {
                memeDict[Int(index)]!.found = true
            }
            
        }
    }
    
}

let memeDatabase = MemesClass()
