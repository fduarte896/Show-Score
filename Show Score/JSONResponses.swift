//This is the response we get from "https://api.themoviedb.org/3/movie/popular" when we ask for the most popular movies, people and TV Shows.

import Foundation

/*

MOVIES:
 
 {
   "page": 1,
   "results": [
     {
       "adult": false,
       "backdrop_path": "/euYIwmwkmz95mnXvufEmbL6ovhZ.jpg",
       "genre_ids": [
         28,
         12,
         18
       ],
       "id": 558449,
       "original_language": "en",
       "original_title": "Gladiator II",
       "overview": "Years after witnessing the death of the revered hero Maximus at the hands of his uncle, Lucius is forced to enter the Colosseum after his home is conquered by the tyrannical Emperors who now lead Rome with an iron fist. With rage in his heart and the future of the Empire at stake, Lucius must look to his past to find strength and honor to return the glory of Rome to its people.",
       "popularity": 4201.992,
       "poster_path": "/2cxhvwyEwRlysAmRH4iodkvo0z5.jpg",
       "release_date": "2024-11-05",
       "title": "Gladiator II",
       "video": false,
       "vote_average": 6.8,
       "vote_count": 2104
     },
     {
       "adult": false,
       "backdrop_path": "/zOpe0eHsq0A2NvNyBbtT6sj53qV.jpg",
       "genre_ids": [
         28,
         878,
         35,
         10751
       ],
       "id": 939243,
       "original_language": "en",
       "original_title": "Sonic the Hedgehog 3",
       "overview": "Sonic, Knuckles, and Tails reunite against a powerful new adversary, Shadow, a mysterious villain with powers unlike anything they have faced before. With their abilities outmatched in every way, Team Sonic must seek out an unlikely alliance in hopes of stopping Shadow and protecting the planet.",
       "popularity": 4186.749,
       "poster_path": "/x7NPbBlrvFRJrpinBSRlMOOUWom.jpg",
       "release_date": "2024-12-19",
       "title": "Sonic the Hedgehog 3",
       "video": false,
       "vote_average": 7.7,
       "vote_count": 386
     },
     {
       "adult": false,
       "backdrop_path": "/k24eZq5I3jyz4htPkZCRpnUmBzE.jpg",
       "genre_ids": [
         10749,
         18
       ],
       "id": 1156593,
       "original_language": "es",
       "original_title": "Culpa tuya",
       "overview": "The love between Noah and Nick seems unwavering despite their parents' attempts to separate them. But his job and her entry into college open up their lives to new relationships that will shake the foundations of both their relationship and the Leister family itself.",
       "popularity": 3009.907,
       "poster_path": "/1sQA7lfcF9yUyoLYC0e6Zo3jmxE.jpg",
       "release_date": "2024-12-26",
       "title": "Your Fault",
       "video": false,
       "vote_average": 7.133,
       "vote_count": 737
     },
     {
       "adult": false,
       "backdrop_path": "/oHPoF0Gzu8xwK4CtdXDaWdcuZxZ.jpg",
       "genre_ids": [
         12,
         10751,
         16
       ],
       "id": 762509,
       "original_language": "en",
       "original_title": "Mufasa: The Lion King",
       "overview": "Mufasa, a cub lost and alone, meets a sympathetic lion named Taka, the heir to a royal bloodline. The chance meeting sets in motion an expansive journey of a group of misfits searching for their destiny.",
       "popularity": 2924.518,
       "poster_path": "/nHhjqeJcaQKOBCd21c1kV2DK5gm.jpg",
       "release_date": "2024-12-18",
       "title": "Mufasa: The Lion King",
       "video": false,
       "vote_average": 7.5,
       "vote_count": 498
     },
     {
       "adult": false,
       "backdrop_path": "/vZG7PrX9HmdgL5qfZRjhJsFYEIA.jpg",
       "genre_ids": [
         28,
         878,
         12
       ],
       "id": 912649,
       "original_language": "en",
       "original_title": "Venom: The Last Dance",
       "overview": "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
       "popularity": 2862.276,
       "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
       "release_date": "2024-10-22",
       "title": "Venom: The Last Dance",
       "video": false,
       "vote_average": 6.814,
       "vote_count": 2195
     },
     {
       "adult": false,
       "backdrop_path": "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
       "genre_ids": [
         28,
         14,
         35
       ],
       "id": 845781,
       "original_language": "en",
       "original_title": "Red One",
       "overview": "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
       "popularity": 2249.629,
       "poster_path": "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
       "release_date": "2024-10-31",
       "title": "Red One",
       "video": false,
       "vote_average": 7,
       "vote_count": 1882
     },
     {
       "adult": false,
       "backdrop_path": "/uKb22E0nlzr914bA9KyA5CVCOlV.jpg",
       "genre_ids": [
         18,
         10749,
         14
       ],
       "id": 402431,
       "original_language": "en",
       "original_title": "Wicked",
       "overview": "In the land of Oz, ostracized and misunderstood green-skinned Elphaba is forced to share a room with the popular aristocrat Glinda at Shiz University, and the two's unlikely friendship is tested as they begin to fulfill their respective destinies as Glinda the Good and the Wicked Witch of the West.",
       "popularity": 2440.1,
       "poster_path": "/2E1x1qcHqGZcYuYi4PzVZjzg8IV.jpg",
       "release_date": "2024-11-20",
       "title": "Wicked",
       "video": false,
       "vote_average": 7.3,
       "vote_count": 1078
     },
     {
       "adult": false,
       "backdrop_path": "/A6vAMO3myroRfBwSZetY4GVqaW4.jpg",
       "genre_ids": [
         16,
         14,
         28,
         12
       ],
       "id": 839033,
       "original_language": "en",
       "original_title": "The Lord of the Rings: The War of the Rohirrim",
       "overview": "183 years before the events chronicled in the original trilogy, a sudden attack by Wulf, a clever and ruthless Dunlending lord seeking vengeance for the death of his father, forces Helm Hammerhand and his people to make a daring last stand in the ancient stronghold of the Hornburg. Finding herself in an increasingly desperate situation, Héra, the daughter of Helm, must summon the will to lead the resistance against a deadly enemy intent on their total destruction.",
       "popularity": 2166.194,
       "poster_path": "/hE9SAMyMSUGAPsHUGdyl6irv11v.jpg",
       "release_date": "2024-12-05",
       "title": "The Lord of the Rings: The War of the Rohirrim",
       "video": false,
       "vote_average": 6.6,
       "vote_count": 251
     },
     {
       "adult": false,
       "backdrop_path": "/tElnmtQ6yz1PjN1kePNl8yMSb59.jpg",
       "genre_ids": [
         16,
         12,
         10751,
         35
       ],
       "id": 1241982,
       "original_language": "en",
       "original_title": "Moana 2",
       "overview": "After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.",
       "popularity": 2083.288,
       "poster_path": "/m0SbwFNCa9epW1X60deLqTHiP7x.jpg",
       "release_date": "2024-11-21",
       "title": "Moana 2",
       "video": false,
       "vote_average": 7,
       "vote_count": 781
     },
     {
       "adult": false,
       "backdrop_path": "/au3o84ub27qTZiMiEc9UYzN74V3.jpg",
       "genre_ids": [
         28,
         878,
         53
       ],
       "id": 1035048,
       "original_language": "en",
       "original_title": "Elevation",
       "overview": "A single father and two women venture from the safety of their homes to face monstrous creatures to save the life of a young boy.",
       "popularity": 1576.453,
       "poster_path": "/9knPvD6GLtl1w4pamRomyQKHXyj.jpg",
       "release_date": "2024-11-07",
       "title": "Elevation",
       "video": false,
       "vote_average": 6.23,
       "vote_count": 280
     },
     {
       "adult": false,
       "backdrop_path": "/fzjH7kt1017R9EckLDmWmH5pGhD.jpg",
       "genre_ids": [
         28,
         27,
         53
       ],
       "id": 970450,
       "original_language": "en",
       "original_title": "Werewolves",
       "overview": "A year after a supermoon’s light activated a dormant gene, transforming humans into bloodthirsty werewolves and causing nearly a billion deaths, the nightmare resurfaces as the supermoon rises again. Two scientists attempt to stop the mutation but fail, leaving those exposed to the moonlight to once again become feral werewolves. Chaos engulfs the streets as the scientists struggle to reach one of their family homes, now under siege by the savage creatures.",
       "popularity": 1670.395,
       "poster_path": "/cRTctVlwvMdXVsaYbX5qfkittDP.jpg",
       "release_date": "2024-12-04",
       "title": "Werewolves",
       "video": false,
       "vote_average": 6.041,
       "vote_count": 121
     },
     {
       "adult": false,
       "backdrop_path": "/dWkdmxIkH9y23s9v1PjQFhTGIwo.jpg",
       "genre_ids": [
         28,
         18,
         53
       ],
       "id": 1043905,
       "original_language": "en",
       "original_title": "Dirty Angels",
       "overview": "During the United States' 2021 withdrawal from Afghanistan, a group of female soldiers posing as medical relief are sent back in to rescue a group of kidnapped teenagers caught between ISIS and the Taliban.",
       "popularity": 1354.815,
       "poster_path": "/1y3TG8N8zwwMxqh0qzdyDs3IyCq.jpg",
       "release_date": "2024-12-11",
       "title": "Dirty Angels",
       "video": false,
       "vote_average": 6.546,
       "vote_count": 98
     },
     {
       "adult": false,
       "backdrop_path": "/rhc8Mtuo3Kh8CndnlmTNMF8o9pU.jpg",
       "genre_ids": [
         28,
         53
       ],
       "id": 1005331,
       "original_language": "en",
       "original_title": "Carry-On",
       "overview": "An airport security officer races to outsmart a mysterious traveler forcing him to let a dangerous item slip onto a Christmas Eve flight.",
       "popularity": 1228.88,
       "poster_path": "/sjMN7DRi4sGiledsmllEw5HJjPy.jpg",
       "release_date": "2024-12-05",
       "title": "Carry-On",
       "video": false,
       "vote_average": 6.956,
       "vote_count": 1493
     },
     {
       "adult": false,
       "backdrop_path": "/lntyt4OVDbcxA1l7LtwITbrD3FI.jpg",
       "genre_ids": [
         10749,
         18
       ],
       "id": 1010581,
       "original_language": "es",
       "original_title": "Culpa mía",
       "overview": "Noah must leave her city, boyfriend, and friends to move into William Leister's mansion, the flashy and wealthy husband of her mother Rafaela. As a proud and independent 17 year old, Noah resists living in a mansion surrounded by luxury. However, it is there where she meets Nick, her new stepbrother, and the clash of their strong personalities becomes evident from the very beginning.",
       "popularity": 1054.65,
       "poster_path": "/w46Vw536HwNnEzOa7J24YH9DPRS.jpg",
       "release_date": "2023-06-08",
       "title": "My Fault",
       "video": false,
       "vote_average": 7.9,
       "vote_count": 3330
     },
     {
       "adult": false,
       "backdrop_path": "/b3mdmjYTEL70j7nuXATUAD9qgu4.jpg",
       "genre_ids": [
         16,
         14,
         12
       ],
       "id": 823219,
       "original_language": "lv",
       "original_title": "Straume",
       "overview": "A solitary cat, displaced by a great flood, finds refuge on a boat with various species and must navigate the challenges of adapting to a transformed world together.",
       "popularity": 1109.247,
       "poster_path": "/imKSymKBK7o73sajciEmndJoVkR.jpg",
       "release_date": "2024-01-30",
       "title": "Flow",
       "video": false,
       "vote_average": 8.4,
       "vote_count": 570
     },
     {
       "adult": false,
       "backdrop_path": "/b0itXhS69X33BvLi7uWjUZQs9MB.jpg",
       "genre_ids": [
         27,
         878
       ],
       "id": 933260,
       "original_language": "en",
       "original_title": "The Substance",
       "overview": "A fading celebrity decides to use a black market drug, a cell-replicating substance that temporarily creates a younger, better version of herself.",
       "popularity": 1086.872,
       "poster_path": "/lqoMzCcZYEFK729d6qzt349fB4o.jpg",
       "release_date": "2024-09-07",
       "title": "The Substance",
       "video": false,
       "vote_average": 7.1,
       "vote_count": 3067
     },
     {
       "adult": false,
       "backdrop_path": "/uWOJbarUXfVf6B4o0368dh138eR.jpg",
       "genre_ids": [
         18,
         14,
         27
       ],
       "id": 426063,
       "original_language": "en",
       "original_title": "Nosferatu",
       "overview": "A gothic tale of obsession between a haunted young woman and the terrifying vampire infatuated with her, causing untold horror in its wake.",
       "popularity": 952.121,
       "poster_path": "/5qGIxdEO841C0tdY8vOdLoRVrr0.jpg",
       "release_date": "2024-12-25",
       "title": "Nosferatu",
       "video": false,
       "vote_average": 6.8,
       "vote_count": 617
     },
     {
       "adult": false,
       "backdrop_path": "/6amNYUYvoKsZbg8vE00Yzt9Xn7H.jpg",
       "genre_ids": [
         28,
         35,
         878
       ],
       "id": 533535,
       "original_language": "en",
       "original_title": "Deadpool & Wolverine",
       "overview": "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
       "popularity": 856.096,
       "poster_path": "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
       "release_date": "2024-07-24",
       "title": "Deadpool & Wolverine",
       "video": false,
       "vote_average": 7.7,
       "vote_count": 6267
     },
     {
       "adult": false,
       "backdrop_path": "/sQbFupSWM9wUdPj96NZNUOFSP5.jpg",
       "genre_ids": [
         28,
         12,
         53
       ],
       "id": 1000075,
       "original_language": "fr",
       "original_title": "Largo Winch: Le prix de l'argent",
       "overview": "Largo Winch, devastated by the kidnapping of his son, realizes that if he finds those responsible for his bankruptcy, maybe he'll see his son again.",
       "popularity": 735.391,
       "poster_path": "/myS41ZUmFvslkT8LeD2irAKxyrf.jpg",
       "release_date": "2024-07-31",
       "title": "The Price of Money: A Largo Winch Adventure",
       "video": false,
       "vote_average": 5.928,
       "vote_count": 83
     },
     {
       "adult": false,
       "backdrop_path": "/A28EE0vgHrB0OdoxWWMfgfyEoYn.jpg",
       "genre_ids": [
         80,
         53,
         28
       ],
       "id": 1276945,
       "original_language": "nl",
       "original_title": "Ferry 2",
       "overview": "After losing his drug empire, Ferry Bouman has found a measure of peace away from Brabant's criminal underworld — until his past catches up to him.",
       "popularity": 873.984,
       "poster_path": "/8pwdnL3pEISIN1EGmwZzU6hpNVk.jpg",
       "release_date": "2024-12-19",
       "title": "Ferry 2",
       "video": false,
       "vote_average": 5.7,
       "vote_count": 76
     }
   ],
   "total_pages": 48056,
   "total_results": 961115
 }
 
 PEOPLE:
 
 
 {
   "page": 1,
   "results": [
     {
       "adult": false,
       "gender": 2,
       "id": 63429,
       "known_for_department": "Directing",
       "name": "Kwak Jae-yong",
       "original_name": "곽재용",
       "popularity": 430.221,
       "profile_path": "/oTpZ0Ek4qoI8U0tRIViUhgfB05b.jpg",
       "known_for": [
         {
           "backdrop_path": "/13uKAt4M87HQi1lMZAwBmsNZRGg.jpg",
           "id": 11178,
           "title": "My Sassy Girl",
           "original_title": "엽기적인 그녀",
           "overview": "A dweeby, mild-mannered man comes to the aid of a drunk young woman on a subway platform. Little does he know how much trouble he’s in for.",
           "poster_path": "/qx4hZvSy2b11KIPBHBFEibgRbk0.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "ko",
           "genre_ids": [
             18,
             35,
             10749
           ],
           "popularity": 19.582,
           "release_date": "2001-07-27",
           "video": false,
           "vote_average": 7.5,
           "vote_count": 569
         },
         {
           "backdrop_path": "/aUskYggZkaoU2BhvIaRF1QehNdj.jpg",
           "id": 42190,
           "title": "The Classic",
           "original_title": "클래식",
           "overview": "Ji-hae's friend is having problems expressing her feelings to the boy she loves, so she asks Ji-hae to write e-mails to him in her name. As the boy falls in love with her letters, Ji-hae discovers the story of her mother's romance which is remarkably similar to her own circumstances.",
           "poster_path": "/sNe23Tsia9usMBN5TW2KXPJdq2K.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "ko",
           "genre_ids": [
             18,
             10749
           ],
           "popularity": 14.892,
           "release_date": "2003-01-30",
           "video": false,
           "vote_average": 7.6,
           "vote_count": 158
         },
         {
           "backdrop_path": "/2tZb1Aq8TK55GAWuGnosGy9Rmt5.jpg",
           "id": 821661,
           "title": "A Year-End Medley",
           "original_title": "해피 뉴 이어",
           "overview": "A romantic comedy of a young man and woman that is told in the background of hotel 'Emross'. It has stories of people who met each other at Hotel Emross during the New Year holidays. Each one has his own memory to relate and create relationships or just going nostalgic.",
           "poster_path": "/z1kgyVRmoNd4MxsP4NTNMadsPRZ.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "ko",
           "genre_ids": [
             35,
             10749
           ],
           "popularity": 11.928,
           "release_date": "2021-12-29",
           "video": false,
           "vote_average": 7.1,
           "vote_count": 142
         }
       ]
     },
     {
       "adult": false,
       "gender": 1,
       "id": 20652,
       "known_for_department": "Acting",
       "name": "Cecilia Cheung",
       "original_name": "張柏芝",
       "popularity": 251.172,
       "profile_path": "/xghVxRPUmFCHYxzD0NxMO8NtoKK.jpg",
       "known_for": [
         {
           "backdrop_path": "/AwlJ2bQGjfEuXLsL5XJAaxOmMuV.jpg",
           "id": 2008,
           "title": "The Promise",
           "original_title": "无极",
           "overview": "An orphaned girl, driven by poverty at such a young age, makes a promise with an enchantress. In return for beauty and the admiration of every man, she will never be with the man she loves. This spell cannot be broken unless the impossible happens: snow falling in spring and the dead coming back to life. Now a grown and beautiful princess, she regrets her promise, for all of the men she's loved has always been met with tragedy.",
           "poster_path": "/tdm4mlc27S1d72ub4Y4xcU2OlDD.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "zh",
           "genre_ids": [
             14,
             18,
             28,
             53,
             10749
           ],
           "popularity": 15.211,
           "release_date": "2005-12-15",
           "video": false,
           "vote_average": 5.6,
           "vote_count": 115
         },
         {
           "backdrop_path": "/lMRX4cLx4hxYth3iQ96c0E1RHGB.jpg",
           "id": 11770,
           "title": "Shaolin Soccer",
           "original_title": "少林足球",
           "overview": "A young Shaolin follower reunites with his discouraged brothers to form a soccer team using their martial art skills to their advantage.",
           "poster_path": "/ppgeawDWa4rehYYRidWCqg4kOli.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "cn",
           "genre_ids": [
             28,
             35
           ],
           "popularity": 45.798,
           "release_date": "2001-07-05",
           "video": false,
           "vote_average": 7.1,
           "vote_count": 2262
         },
         {
           "backdrop_path": "/fGzO3qGIaBlLlW53fsaRSUPEjw0.jpg",
           "id": 53168,
           "title": "King of Comedy",
           "original_title": "喜劇之王",
           "overview": "Wan Tin-Sau is an actor who cannot seem to catch a break, since his only professional jobs are limited to being a movie extra. As well as being an actor, he is also the head of his village's community center.",
           "poster_path": "/dmJWvKNgeCrIwJH6AapdSMiZHop.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "cn",
           "genre_ids": [
             35,
             18,
             10749
           ],
           "popularity": 14.301,
           "release_date": "1999-02-08",
           "video": false,
           "vote_average": 7.3,
           "vote_count": 174
         }
       ]
     },
     {
       "adult": false,
       "gender": 1,
       "id": 2527414,
       "known_for_department": "Acting",
       "name": "Nicole Wallace",
       "original_name": "Nicole Wallace",
       "popularity": 222.134,
       "profile_path": "/xlvq6OYCN6yQef4fpJQtwVyQxqr.jpg",
       "known_for": [
         {
           "backdrop_path": "/lntyt4OVDbcxA1l7LtwITbrD3FI.jpg",
           "id": 1010581,
           "title": "My Fault",
           "original_title": "Culpa mía",
           "overview": "Noah must leave her city, boyfriend, and friends to move into William Leister's mansion, the flashy and wealthy husband of her mother Rafaela. As a proud and independent 17 year old, Noah resists living in a mansion surrounded by luxury. However, it is there where she meets Nick, her new stepbrother, and the clash of their strong personalities becomes evident from the very beginning.",
           "poster_path": "/w46Vw536HwNnEzOa7J24YH9DPRS.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "es",
           "genre_ids": [
             10749,
             18
           ],
           "popularity": 904.418,
           "release_date": "2023-06-08",
           "video": false,
           "vote_average": 7.9,
           "vote_count": 3356
         },
         {
           "backdrop_path": "/k24eZq5I3jyz4htPkZCRpnUmBzE.jpg",
           "id": 1156593,
           "title": "Your Fault",
           "original_title": "Culpa tuya",
           "overview": "The love between Noah and Nick seems unwavering despite their parents' attempts to separate them. But his job and her entry into college open up their lives to new relationships that will shake the foundations of both their relationship and the Leister family itself.",
           "poster_path": "/1sQA7lfcF9yUyoLYC0e6Zo3jmxE.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "es",
           "genre_ids": [
             10749,
             18
           ],
           "popularity": 2310.635,
           "release_date": "2024-12-26",
           "video": false,
           "vote_average": 7.139,
           "vote_count": 779
         },
         {
           "backdrop_path": "/ieiq46OoeTrLkjtclmhii6iRyzP.jpg",
           "id": 242876,
           "name": "Raising Voices",
           "original_name": "Ni una más",
           "overview": "When a 17-year-old reports a sexual assault at her high school, an investigation upends her life and tests her relationships.",
           "poster_path": "/lCU77Jp0iWN2e1WuSJvR7M35ebN.jpg",
           "media_type": "tv",
           "adult": false,
           "original_language": "es",
           "genre_ids": [
             18
           ],
           "popularity": 238.854,
           "first_air_date": "2024-05-31",
           "vote_average": 7.795,
           "vote_count": 351,
           "origin_country": [
             "ES"
           ]
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 2786960,
       "known_for_department": "Acting",
       "name": "Gabriel Guevara",
       "original_name": "Gabriel Guevara",
       "popularity": 205.16,
       "profile_path": "/pviRYKEEmoPUfLYwP1VHJ6LQcRg.jpg",
       "known_for": [
         {
           "backdrop_path": "/lntyt4OVDbcxA1l7LtwITbrD3FI.jpg",
           "id": 1010581,
           "title": "My Fault",
           "original_title": "Culpa mía",
           "overview": "Noah must leave her city, boyfriend, and friends to move into William Leister's mansion, the flashy and wealthy husband of her mother Rafaela. As a proud and independent 17 year old, Noah resists living in a mansion surrounded by luxury. However, it is there where she meets Nick, her new stepbrother, and the clash of their strong personalities becomes evident from the very beginning.",
           "poster_path": "/w46Vw536HwNnEzOa7J24YH9DPRS.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "es",
           "genre_ids": [
             10749,
             18
           ],
           "popularity": 904.418,
           "release_date": "2023-06-08",
           "video": false,
           "vote_average": 7.9,
           "vote_count": 3356
         },
         {
           "backdrop_path": "/k24eZq5I3jyz4htPkZCRpnUmBzE.jpg",
           "id": 1156593,
           "title": "Your Fault",
           "original_title": "Culpa tuya",
           "overview": "The love between Noah and Nick seems unwavering despite their parents' attempts to separate them. But his job and her entry into college open up their lives to new relationships that will shake the foundations of both their relationship and the Leister family itself.",
           "poster_path": "/1sQA7lfcF9yUyoLYC0e6Zo3jmxE.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "es",
           "genre_ids": [
             10749,
             18
           ],
           "popularity": 2310.635,
           "release_date": "2024-12-26",
           "video": false,
           "vote_average": 7.139,
           "vote_count": 779
         },
         {
           "backdrop_path": "/ieiq46OoeTrLkjtclmhii6iRyzP.jpg",
           "id": 242876,
           "name": "Raising Voices",
           "original_name": "Ni una más",
           "overview": "When a 17-year-old reports a sexual assault at her high school, an investigation upends her life and tests her relationships.",
           "poster_path": "/lCU77Jp0iWN2e1WuSJvR7M35ebN.jpg",
           "media_type": "tv",
           "adult": false,
           "original_language": "es",
           "genre_ids": [
             18
           ],
           "popularity": 238.854,
           "first_air_date": "2024-05-31",
           "vote_average": 7.795,
           "vote_count": 351,
           "origin_country": [
             "ES"
           ]
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 3724154,
       "known_for_department": "Acting",
       "name": "Lou Goossens",
       "original_name": "Lou Goossens",
       "popularity": 168.482,
       "profile_path": "/kY8eifhCPvjTE6JJclrrWO7Zr9L.jpg",
       "known_for": [
         {
           "backdrop_path": "/9ExqMvtOqvYcmQjMDXyhtfjLmEA.jpg",
           "id": 1232449,
           "title": "Young Hearts",
           "original_title": "Young Hearts",
           "overview": "Fourteen-year-old Elias increasingly feels like an outsider in his village. When he meets his new neighbour of the same age, Alexander, Elias is confronted with his burgeoning sexuality.",
           "poster_path": "/iGCtYxfuvXfy0BD5m6p7vKuPOxS.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "nl",
           "genre_ids": [
             18,
             10749
           ],
           "popularity": 119.403,
           "release_date": "2024-10-26",
           "video": false,
           "vote_average": 8.3,
           "vote_count": 27
         },
         {
           "backdrop_path": "/xbb0AzHP1B7vJ2LiN7ARLNe3RwZ.jpg",
           "id": 229685,
           "name": "Boomer",
           "original_name": "Boomer",
           "overview": "",
           "poster_path": "/bZAKLGZk3gqCbdBhcfrnBp0LuwS.jpg",
           "media_type": "tv",
           "adult": false,
           "original_language": "nl",
           "genre_ids": [
             35
           ],
           "popularity": 18.745,
           "first_air_date": "2023-08-18",
           "vote_average": 10,
           "vote_count": 1,
           "origin_country": [
             "BE"
           ]
         },
         {
           "backdrop_path": "/xANGcChEgQJLHMdiLwOLxWebvbs.jpg",
           "id": 1030955,
           "title": "Alleen Ik (Only me, me alone)",
           "original_title": "Alleen Ik",
           "overview": "Longing for acceptance, a neurodivergent boy taunts the boundaries of his best friend: his brother.",
           "poster_path": "/qUzwUif6WybmpH6t4MA26hkdUI5.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "nl",
           "genre_ids": [
             18
           ],
           "popularity": 14.196,
           "release_date": "2022-11-05",
           "video": false,
           "vote_average": 6,
           "vote_count": 2
         }
       ]
     },
     {
       "adult": false,
       "gender": 1,
       "id": 115440,
       "known_for_department": "Acting",
       "name": "Sydney Sweeney",
       "original_name": "Sydney Sweeney",
       "popularity": 165.988,
       "profile_path": "/qYiaSl0Eb7G3VaxOg8PxExCFwon.jpg",
       "known_for": [
         {
           "backdrop_path": "/9KnIzPCv9XpWA0MqmwiKBZvV1Sj.jpg",
           "id": 85552,
           "name": "Euphoria",
           "original_name": "Euphoria",
           "overview": "A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.",
           "poster_path": "/3Q0hd3heuWwDWpwcDkhQOA6TYWI.jpg",
           "media_type": "tv",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             18
           ],
           "popularity": 345.526,
           "first_air_date": "2019-06-16",
           "vote_average": 8.31,
           "vote_count": 9832,
           "origin_country": [
             "US"
           ]
         },
         {
           "backdrop_path": "/j9eOeLlTGoHoM8BNUJVNyWmIvCi.jpg",
           "id": 1072790,
           "title": "Anyone But You",
           "original_title": "Anyone But You",
           "overview": "After an amazing first date, Bea and Ben’s fiery attraction turns ice cold — until they find themselves unexpectedly reunited at a destination wedding in Australia. So they do what any two mature adults would do: pretend to be a couple.",
           "poster_path": "/5qHoazZiaLe7oFBok7XlUhg96f2.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             10749,
             35
           ],
           "popularity": 91.44,
           "release_date": "2023-12-21",
           "video": false,
           "vote_average": 6.9,
           "vote_count": 2329
         },
         {
           "backdrop_path": "/5Eip60UDiPLASyKjmHPMruggTc4.jpg",
           "id": 1041613,
           "title": "Immaculate",
           "original_title": "Immaculate",
           "overview": "An American nun embarks on a new journey when she joins a remote convent in the Italian countryside. However, her warm welcome quickly turns into a living nightmare when she discovers her new home harbours a sinister secret and unspeakable horrors.",
           "poster_path": "/fdZpvODTX5wwkD0ikZNaClE4AoW.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             27,
             9648,
             53
           ],
           "popularity": 81.818,
           "release_date": "2024-03-20",
           "video": false,
           "vote_average": 6.3,
           "vote_count": 1293
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 1763709,
       "known_for_department": "Acting",
       "name": "Aaron Pierre",
       "original_name": "Aaron Pierre",
       "popularity": 164.831,
       "profile_path": "/hNwZWdT2KxKj1YLbipvtUhNjfAp.jpg",
       "known_for": [
         {
           "backdrop_path": "/cyKH7pDFlxIXluqRyNoHHEpxSDX.jpg",
           "id": 646097,
           "title": "Rebel Ridge",
           "original_title": "Rebel Ridge",
           "overview": "A former Marine confronts corruption in a small town when local law enforcement unjustly seizes the bag of cash he needs to post his cousin's bail.",
           "poster_path": "/xEt2GSz9z5rSVpIHMiGdtf0czyf.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             80,
             28,
             53,
             18
           ],
           "popularity": 123.613,
           "release_date": "2024-08-27",
           "video": false,
           "vote_average": 7,
           "vote_count": 1112
         },
         {
           "backdrop_path": "/oHPoF0Gzu8xwK4CtdXDaWdcuZxZ.jpg",
           "id": 762509,
           "title": "Mufasa: The Lion King",
           "original_title": "Mufasa: The Lion King",
           "overview": "Mufasa, a cub lost and alone, meets a sympathetic lion named Taka, the heir to a royal bloodline. The chance meeting sets in motion an expansive journey of a group of misfits searching for their destiny.",
           "poster_path": "/iBqXjFkAozQ1z2sfAiWwBimbiJX.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             12,
             10751,
             16
           ],
           "popularity": 2684.622,
           "release_date": "2024-12-18",
           "video": false,
           "vote_average": 7.458,
           "vote_count": 546
         },
         {
           "backdrop_path": "/32yqxyLlWcO81UCx51Jfq9aeJdA.jpg",
           "id": 631843,
           "title": "Old",
           "original_title": "Old",
           "overview": "A group of families on a tropical holiday discover that the secluded beach where they are staying is somehow causing them to age rapidly – reducing their entire lives into a single day.",
           "poster_path": "/vclShucpUmPhdAOmKgf3B3Z4POD.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             53,
             9648,
             27
           ],
           "popularity": 48.54,
           "release_date": "2021-07-21",
           "video": false,
           "vote_average": 6.333,
           "vote_count": 4463
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 500,
       "known_for_department": "Acting",
       "name": "Tom Cruise",
       "original_name": "Tom Cruise",
       "popularity": 156.754,
       "profile_path": "/eOh4ubpOm2Igdg0QH2ghj0mFtC.jpg",
       "known_for": [
         {
           "backdrop_path": "/4V1yIoAKPMRQwGBaSses8Bp2nsi.jpg",
           "id": 137113,
           "title": "Edge of Tomorrow",
           "original_title": "Edge of Tomorrow",
           "overview": "Major Bill Cage is an officer who has never seen a day of combat when he is unceremoniously demoted and dropped into combat. Cage is killed within minutes, managing to take an alpha alien down with him. He awakens back at the beginning of the same day and is forced to fight and die again... and again - as physical contact with the alien has thrown him into a time loop.",
           "poster_path": "/uUHvlkLavotfGsNtosDy8ShsIYF.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             878
           ],
           "popularity": 73.24,
           "release_date": "2014-05-27",
           "video": false,
           "vote_average": 7.6,
           "vote_count": 13899
         },
         {
           "backdrop_path": "/sbkYWB5QcfT00gLUkbNE5LTdhIX.jpg",
           "id": 75612,
           "title": "Oblivion",
           "original_title": "Oblivion",
           "overview": "Jack Harper is one of the last few drone repairmen stationed on Earth. Part of a massive operation to extract vital resources after decades of war with a terrifying threat known as the Scavs, Jack’s mission is nearly complete. His existence is brought crashing down when he rescues a beautiful  stranger from a downed spacecraft. Her arrival triggers a chain of events that  forces him to question everything he knows and puts the fate of humanity in his hands.",
           "poster_path": "/5Onf4TW3mZn3oLeKVr9W4FGomQQ.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             878,
             12,
             9648
           ],
           "popularity": 70.12,
           "release_date": "2013-04-10",
           "video": false,
           "vote_average": 6.65,
           "vote_count": 10696
         },
         {
           "backdrop_path": "/ih4lZkUpmSE7AP3maymiO72xJ1z.jpg",
           "id": 56292,
           "title": "Mission: Impossible - Ghost Protocol",
           "original_title": "Mission: Impossible - Ghost Protocol",
           "overview": "Ethan Hunt and his team are racing against time to track down a dangerous terrorist named Hendricks, who has gained access to Russian nuclear launch codes and is planning a strike on the United States. An attempt to stop him ends in an explosion causing severe destruction to the Kremlin and the IMF to be implicated in the bombing, forcing the President to disavow them. No longer being aided by the government, Ethan and his team chase Hendricks around the globe, although they might still be too late to stop a disaster.",
           "poster_path": "/eRZTGx7GsiKqPch96k27LK005ZL.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             53,
             12
           ],
           "popularity": 51.336,
           "release_date": "2011-12-07",
           "video": false,
           "vote_average": 7.092,
           "vote_count": 9909
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 1862434,
       "known_for_department": "Acting",
       "name": "Jacob McCarthy",
       "original_name": "Jacob McCarthy",
       "popularity": 156.483,
       "profile_path": "/kU6N4Z2L7f3mFeSZnrnmFE0k4ZZ.jpg",
       "known_for": [
         {
           "backdrop_path": "/aWas3hZ8DKvfKxLe3dQVpB758eA.jpg",
           "id": 502292,
           "title": "The Last Summer",
           "original_title": "The Last Summer",
           "overview": "Standing on the precipice of adulthood, a group of friends navigate new relationships, while reexamining others, during their final summer before college.",
           "poster_path": "/nAn3MRAUwbjVApN3qYkvsTEOAvx.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             10749,
             35
           ],
           "popularity": 19.362,
           "release_date": "2019-05-03",
           "video": false,
           "vote_average": 6.013,
           "vote_count": 1370
         },
         {
           "backdrop_path": "/lMjY6kMBOHhloz2Ul16fLJn8xuw.jpg",
           "id": 591538,
           "title": "The Tragedy of Macbeth",
           "original_title": "The Tragedy of Macbeth",
           "overview": "Macbeth, the Thane of Glamis, receives a prophecy from a trio of witches that one day he will become King of Scotland. Consumed by ambition and spurred to action by his wife, Macbeth murders his king and takes the throne for himself.",
           "poster_path": "/tDNJEhcLbX3jIk3BMCur9pCdaVD.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             18,
             10752
           ],
           "popularity": 21.356,
           "release_date": "2021-12-05",
           "video": false,
           "vote_average": 6.9,
           "vote_count": 755
         },
         {
           "backdrop_path": "/hGdTq9BX3DB2gwGGFMLTdipCBPk.jpg",
           "id": 93870,
           "name": "SAS Rogue Heroes",
           "original_name": "SAS Rogue Heroes",
           "overview": "The dramatised account of how the world’s greatest Special Forces unit, the SAS, was formed under extraordinary circumstances in the darkest days of World War Two.",
           "poster_path": "/qEaxiDrPaTY34eIg6naXMfM2IKC.jpg",
           "media_type": "tv",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             18,
             10768
           ],
           "popularity": 121.604,
           "first_air_date": "2022-10-30",
           "vote_average": 7.7,
           "vote_count": 93,
           "origin_country": [
             "GB"
           ]
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 6384,
       "known_for_department": "Acting",
       "name": "Keanu Reeves",
       "original_name": "Keanu Reeves",
       "popularity": 156.423,
       "profile_path": "/8RZLOyYGsoRe9p44q3xin9QkMHv.jpg",
       "known_for": [
         {
           "backdrop_path": "/icmmSD4vTTDKOq2vvdulafOGw93.jpg",
           "id": 603,
           "title": "The Matrix",
           "original_title": "The Matrix",
           "overview": "Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.",
           "poster_path": "/dXNAPwY7VrqMAo51EKhhCJfaGb5.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             878
           ],
           "popularity": 159.434,
           "release_date": "1999-03-31",
           "video": false,
           "vote_average": 8.22,
           "vote_count": 25865
         },
         {
           "backdrop_path": "/eD7FnB7LLrBV5ewjdGLYTAoV9Mv.jpg",
           "id": 245891,
           "title": "John Wick",
           "original_title": "John Wick",
           "overview": "Ex-hitman John Wick comes out of retirement to track down the gangsters that took everything from him.",
           "poster_path": "/fZPSd91yGE9fCcCe6OoQr6E3Bev.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             53
           ],
           "popularity": 93.979,
           "release_date": "2014-10-22",
           "video": false,
           "vote_average": 7.441,
           "vote_count": 19317
         },
         {
           "backdrop_path": "/r17jFHAemzcWPPtoO0UxjIX0xas.jpg",
           "id": 324552,
           "title": "John Wick: Chapter 2",
           "original_title": "John Wick: Chapter 2",
           "overview": "John Wick is forced out of retirement by a former associate looking to seize control of a shadowy international assassins’ guild. Bound by a blood oath to aid him, Wick travels to Rome and does battle against some of the world’s most dangerous killers.",
           "poster_path": "/hXWBc0ioZP3cN4zCu6SN3YHXZVO.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             53,
             80
           ],
           "popularity": 100.083,
           "release_date": "2017-02-08",
           "video": false,
           "vote_average": 7.333,
           "vote_count": 13124
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 976,
       "known_for_department": "Acting",
       "name": "Jason Statham",
       "original_name": "Jason Statham",
       "popularity": 151.85,
       "profile_path": "/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg",
       "known_for": [
         {
           "backdrop_path": "/ibKeXahq4JD63z6uWQphqoJLvNw.jpg",
           "id": 345940,
           "title": "The Meg",
           "original_title": "The Meg",
           "overview": "A deep sea submersible pilot revisits his past fears in the Mariana Trench, and accidentally unleashes the seventy foot ancestor of the Great White Shark believed to be extinct.",
           "poster_path": "/eyWICPcxOuTcDDDbTMOZawoOn8d.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             878,
             27
           ],
           "popularity": 78.802,
           "release_date": "2018-08-09",
           "video": false,
           "vote_average": 6.3,
           "vote_count": 7671
         },
         {
           "backdrop_path": "/70AV2Xx5FQYj20labp0EGdbjI6E.jpg",
           "id": 637649,
           "title": "Wrath of Man",
           "original_title": "Wrath of Man",
           "overview": "A cold and mysterious new security guard for a Los Angeles cash truck company surprises his co-workers when he unleashes precision skills during a heist. The crew is left wondering who he is and where he came from. Soon, the marksman's ultimate motive becomes clear as he takes dramatic and irrevocable steps to settle a score.",
           "poster_path": "/M7SUK85sKjaStg4TKhlAVyGlz3.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             80,
             28,
             53
           ],
           "popularity": 180.528,
           "release_date": "2021-04-22",
           "video": false,
           "vote_average": 7.63,
           "vote_count": 5366
         },
         {
           "backdrop_path": "/kWt1OcPgwO1ssu57wgTKmq38JYw.jpg",
           "id": 4108,
           "title": "The Transporter",
           "original_title": "The Transporter",
           "overview": "Former Special Forces officer Frank Martin will deliver anything to anyone for the right price, and his no-questions-asked policy puts him in high demand. But when he realizes his latest cargo is alive, it sets in motion a dangerous chain of events. The bound and gagged Lai is being smuggled to France by a shady American businessman, and Frank works to save her as his own illegal activities are uncovered by a French detective.",
           "poster_path": "/xmuCaJJjGbUns8pwMD7M0C0O1uP.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             80,
             53
           ],
           "popularity": 56.563,
           "release_date": "2002-10-02",
           "video": false,
           "vote_average": 6.7,
           "vote_count": 5344
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 1190668,
       "known_for_department": "Acting",
       "name": "Timothée Chalamet",
       "original_name": "Timothée Chalamet",
       "popularity": 150.602,
       "profile_path": "/BE2sdjpgsa2rNTFa66f7upkaOP.jpg",
       "known_for": [
         {
           "backdrop_path": "/h3HsfV8Kn9Sz2QWUYYdP5ya23hx.jpg",
           "id": 438631,
           "title": "Dune",
           "original_title": "Dune",
           "overview": "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.",
           "poster_path": "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             878,
             12
           ],
           "popularity": 208.489,
           "release_date": "2021-09-15",
           "video": false,
           "vote_average": 7.8,
           "vote_count": 12966
         },
         {
           "backdrop_path": "/zvOJawrnmgK0sL293mOXOdLvTXQ.jpg",
           "id": 398818,
           "title": "Call Me by Your Name",
           "original_title": "Call Me by Your Name",
           "overview": "In 1980s Italy, a relationship begins between seventeen-year-old teenage Elio and the older adult man hired as his father's research assistant.",
           "poster_path": "/mZ4gBdfkhP9tvLH1DO4m4HYtiyi.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             10749,
             18
           ],
           "popularity": 65.624,
           "release_date": "2017-07-28",
           "video": false,
           "vote_average": 8.1,
           "vote_count": 12117
         },
         {
           "backdrop_path": "/rRBD8ORo9y34tYkAQJVbn4Ml6tu.jpg",
           "id": 693134,
           "title": "Dune: Part Two",
           "original_title": "Dune: Part Two",
           "overview": "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
           "poster_path": "/6izwz7rsy95ARzTR3poZ8H6c5pp.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             878,
             12
           ],
           "popularity": 244.227,
           "release_date": "2024-02-27",
           "video": false,
           "vote_average": 8.2,
           "vote_count": 5977
         }
       ]
     },
     {
       "adult": false,
       "gender": 1,
       "id": 974169,
       "known_for_department": "Acting",
       "name": "Jenna Ortega",
       "original_name": "Jenna Ortega",
       "popularity": 147.861,
       "profile_path": "/q1NRzyZQlYkxLY07GO9NVPkQnu8.jpg",
       "known_for": [
         {
           "backdrop_path": "/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
           "id": 119051,
           "name": "Wednesday",
           "original_name": "Wednesday",
           "overview": "Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school where she attempts to master her psychic powers, stop a monstrous killing spree of the town citizens, and solve the supernatural mystery that affected her family 25 years ago — all while navigating her new relationships.",
           "poster_path": "/9PFonBhy4cQy7Jz20NpMygczOkv.jpg",
           "media_type": "tv",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             10765,
             9648,
             35
           ],
           "popularity": 258.067,
           "first_air_date": "2022-11-23",
           "vote_average": 8.445,
           "vote_count": 8772,
           "origin_country": [
             "US"
           ]
         },
         {
           "backdrop_path": "/ifUfE79O1raUwbaQRIB7XnFz5ZC.jpg",
           "id": 646385,
           "title": "Scream",
           "original_title": "Scream",
           "overview": "Twenty-five years after a streak of brutal murders shocked the quiet town of Woodsboro, a new killer has donned the Ghostface mask and begins targeting a group of teenagers to resurrect secrets from the town’s deadly past.",
           "poster_path": "/1m3W6cpgwuIyjtg5nSnPx7yFkXW.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             27,
             9648
           ],
           "popularity": 110.561,
           "release_date": "2022-01-12",
           "video": false,
           "vote_average": 6.671,
           "vote_count": 3338
         },
         {
           "backdrop_path": "/70Rm9ItxKuEKN8iu6rNjfwAYUCJ.jpg",
           "id": 760104,
           "title": "X",
           "original_title": "X",
           "overview": "In 1979, a group of young filmmakers set out to make an adult film in rural Texas, but when their reclusive, elderly hosts catch them in the act, the cast find themselves fighting for their lives.",
           "poster_path": "/lopZSVtXzhFY603E9OqF7O1YKsh.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             27,
             9648,
             53
           ],
           "popularity": 71.132,
           "release_date": "2022-03-17",
           "video": false,
           "vote_average": 6.754,
           "vote_count": 3330
         }
       ]
     },
     {
       "adult": false,
       "gender": 1,
       "id": 1152083,
       "known_for_department": "Acting",
       "name": "Sabrina Carpenter",
       "original_name": "Sabrina Carpenter",
       "popularity": 142.225,
       "profile_path": "/o0anvGEg34MzoNh6hbJHthB3paF.jpg",
       "known_for": [
         {
           "backdrop_path": "/oAcV4179Kdpvb2xk9TtS8Ewrp8q.jpg",
           "id": 612706,
           "title": "Work It",
           "original_title": "Work It",
           "overview": "A brilliant but clumsy high school senior vows to get into her late father's alma mater by transforming herself and a misfit squad into dance champions.",
           "poster_path": "/b5XfICAvUe8beWExBz97i0Qw4Qh.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             35,
             10402
           ],
           "popularity": 20.783,
           "release_date": "2020-08-07",
           "video": false,
           "vote_average": 7.548,
           "vote_count": 1165
         },
         {
           "backdrop_path": "/8wfPjfUgmGpqCIW6gS0pS0pixnA.jpg",
           "id": 625450,
           "title": "Tall Girl",
           "original_title": "Tall Girl",
           "overview": "Jodi, the tallest girl in her high school, has always felt uncomfortable in her own skin. But after years of slouching, being made fun of, and avoiding attention at all costs, Jodi finally decides to find the confidence to stand tall.",
           "poster_path": "/m0clsFEXidLVJ0TueqWOvvImOMh.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             35,
             18,
             10749
           ],
           "popularity": 25.863,
           "release_date": "2019-09-13",
           "video": false,
           "vote_average": 6.318,
           "vote_count": 1869
         },
         {
           "backdrop_path": "/L7DIiAdP8DnNqOh7454ZrTYspR.jpg",
           "id": 630566,
           "title": "Clouds",
           "original_title": "Clouds",
           "overview": "Young musician Zach Sobiech discovers his cancer has spread, leaving him just a few months to live. With limited time, he follows his dream and makes an album, unaware that it will soon be a viral music phenomenon.",
           "poster_path": "/d0OdD1I8qAfETvE9Rp9Voq7R8LR.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             10402,
             18,
             10749
           ],
           "popularity": 26.457,
           "release_date": "2020-10-09",
           "video": false,
           "vote_average": 8.253,
           "vote_count": 1007
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 64,
       "known_for_department": "Acting",
       "name": "Gary Oldman",
       "original_name": "Gary Oldman",
       "popularity": 136.359,
       "profile_path": "/2v9FVVBUrrkW2m3QOcYkuhq9A6o.jpg",
       "known_for": [
         {
           "backdrop_path": "/y2DB71C4nyIdMrANijz8mzvQtk6.jpg",
           "id": 49026,
           "title": "The Dark Knight Rises",
           "original_title": "The Dark Knight Rises",
           "overview": "Following the death of District Attorney Harvey Dent, Batman assumes responsibility for Dent's crimes to protect the late attorney's reputation and is subsequently hunted by the Gotham City Police Department. Eight years later, Batman encounters the mysterious Selina Kyle and the villainous Bane, a new terrorist leader who overwhelms Gotham's finest. The Dark Knight resurfaces to protect a city that has branded him an enemy.",
           "poster_path": "/hr0L2aueqlP2BYUblTTjmtn0hw4.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             28,
             80,
             18,
             53
           ],
           "popularity": 78.076,
           "release_date": "2012-07-17",
           "video": false,
           "vote_average": 7.784,
           "vote_count": 22847
         },
         {
           "backdrop_path": "/x5f2uTfw0Pqc5QI4ch5AHICee2o.jpg",
           "id": 155,
           "title": "The Dark Knight",
           "original_title": "The Dark Knight",
           "overview": "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",
           "poster_path": "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             18,
             28,
             80,
             53
           ],
           "popularity": 133.607,
           "release_date": "2008-07-16",
           "video": false,
           "vote_average": 8.518,
           "vote_count": 33185
         },
         {
           "backdrop_path": "/tyBkBHKDrJyVUeCs550kMr61jnq.jpg",
           "id": 6114,
           "title": "Bram Stoker's Dracula",
           "original_title": "Bram Stoker's Dracula",
           "overview": "In 19th century England, Count Dracula travels to London and meets Mina Harker, a young woman who appears as the reincarnation of his lost love.",
           "poster_path": "/scFDS0U5uYAjcVTyjNc7GmcZw1q.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             10749,
             27
           ],
           "popularity": 55.737,
           "release_date": "1992-11-13",
           "video": false,
           "vote_average": 7.5,
           "vote_count": 5157
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 131,
       "known_for_department": "Acting",
       "name": "Jake Gyllenhaal",
       "original_name": "Jake Gyllenhaal",
       "popularity": 134.704,
       "profile_path": "/btORQRDyGCF0KNweGGYpmQXZK3P.jpg",
       "known_for": [
         {
           "backdrop_path": "/msCHK5Kh1YbdZ0zPJ2nzPUhhSN9.jpg",
           "id": 141,
           "title": "Donnie Darko",
           "original_title": "Donnie Darko",
           "overview": "After narrowly escaping a bizarre accident, a troubled teenager is plagued by visions of a large bunny rabbit that manipulates him to commit a series of crimes.",
           "poster_path": "/6FKym4sm5LcqUC80HNpn2ejVoro.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             14,
             18,
             9648
           ],
           "popularity": 56.792,
           "release_date": "2001-01-19",
           "video": false,
           "vote_average": 7.772,
           "vote_count": 12498
         },
         {
           "backdrop_path": "/y4M5L9N2XVAajvLFj1UO3jz48Zg.jpg",
           "id": 242582,
           "title": "Nightcrawler",
           "original_title": "Nightcrawler",
           "overview": "When Lou Bloom, desperate for work, muscles into the world of L.A. crime journalism, he blurs the line between observer and participant to become the star of his own story. Aiding him in his effort is Nina, a TV-news veteran.",
           "poster_path": "/gYPIRu0jX2CGYdeO422cq3N78ju.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             80,
             18,
             53
           ],
           "popularity": 74.037,
           "release_date": "2014-10-23",
           "video": false,
           "vote_average": 7.708,
           "vote_count": 10810
         },
         {
           "backdrop_path": "/elzsm8vIpYVh0s6ztFEKElqgXqe.jpg",
           "id": 1949,
           "title": "Zodiac",
           "original_title": "Zodiac",
           "overview": "The zodiac murders cause the lives of Paul Avery, David Toschi and Robert Graysmith to intersect.",
           "poster_path": "/6YmeO4pB7XTh8P8F960O1uA14JO.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             80,
             18,
             9648,
             53
           ],
           "popularity": 56.031,
           "release_date": "2007-03-02",
           "video": false,
           "vote_average": 7.525,
           "vote_count": 10564
         }
       ]
     },
     {
       "adult": false,
       "gender": 2,
       "id": 80981,
       "known_for_department": "Acting",
       "name": "Choi Seung-hyun",
       "original_name": "최승현",
       "popularity": 134.017,
       "profile_path": "/TVMPz9YPf4eVtd2up9kZnUMzQn.jpg",
       "known_for": [
         {
           "backdrop_path": "/alo20exRRwPj1vhqrjbmaee9op9.jpg",
           "id": 235704,
           "title": "Commitment",
           "original_title": "동창생",
           "overview": "The son of a North Korean spy decides to follow in his father's footsteps to protect his little sister. After his father's botched espionage mission, North Korean Myung-hoon and his young sister Hye-in are sent to a labor prison camp. In order to save his sister's life, Myung-hoon volunteers to become a spy and infiltrates the South as a teenage defector. While attending high school in the South, he meets another girl named Hye-in, and rescues her when she comes under attack.",
           "poster_path": "/ybM400b3vesnoNzOlTlAmHeEYPq.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "ko",
           "genre_ids": [
             18,
             28,
             53
           ],
           "popularity": 21.652,
           "release_date": "2013-11-05",
           "video": false,
           "vote_average": 7.221,
           "vote_count": 122
         },
         {
           "backdrop_path": "/pPcgtojMTIMkRT9I6wacHBxpnyW.jpg",
           "id": 51200,
           "title": "71: Into the Fire",
           "original_title": "포화 속으로",
           "overview": "In August 1950, waiting for UN troops to arrive, the South Korean army assembled to protect Nakdong River. Only 71 student-soldiers are left behind to guard the city of Pohang. Now they are on a mission to defend the country from North Korean troops.",
           "poster_path": "/3p8nZAGiw8LT8TFpYOn7uoTUdvI.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "ko",
           "genre_ids": [
             10752
           ],
           "popularity": 18.467,
           "release_date": "2010-06-16",
           "video": false,
           "vote_average": 7.5,
           "vote_count": 188
         },
         {
           "backdrop_path": "/tW8H0Bn1vptVAS2SZASmkkl2K5P.jpg",
           "id": 290865,
           "title": "Tazza: The Hidden Card",
           "original_title": "타짜: 신의 손",
           "overview": "Dae-gil has been skilled with his hands and has shown a strong desire for winning ever since he was a child. He will succeed his uncle and jump into the world of Tazza, risking his life in competition.",
           "poster_path": "/lWiOBlD8NSuOJRQAZHOzPRFrwa5.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "ko",
           "genre_ids": [
             80,
             18
           ],
           "popularity": 26.676,
           "release_date": "2014-09-03",
           "video": false,
           "vote_average": 7,
           "vote_count": 85
         }
       ]
     },
     {
       "adult": false,
       "gender": 1,
       "id": 550627,
       "known_for_department": "Acting",
       "name": "Miho Nomoto",
       "original_name": "野本美穂",
       "popularity": 133.991,
       "profile_path": "/ego6I5PWMZRJGYyu8aPjiNwsz3l.jpg",
       "known_for": [
         {
           "backdrop_path": "/scMU7yDvzZdqpqb24WcuQB0i4fb.jpg",
           "id": 36282,
           "title": "Fudoh: The New Generation",
           "original_title": "極道戦国志 不動",
           "overview": "In order to settle a business dispute, a mob leader murders one of his own teenage sons. The surviving son vows to avenge his brother's death, and organizes his own gang of teenage killers to destroy his father's organization.",
           "poster_path": "/kRlmTuDdZEGPbbXavNmiafUYYka.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "ja",
           "genre_ids": [
             28,
             53,
             80,
             35
           ],
           "popularity": 6.49,
           "release_date": "1996-10-12",
           "video": false,
           "vote_average": 6.6,
           "vote_count": 64
         },
         {
           "backdrop_path": "/1XUjqfCCgoqGiJYV6hfPlHOxC59.jpg",
           "id": 36274,
           "title": "Deadly Outlaw: Rekka",
           "original_title": "実録・安藤昇侠道（アウトロー）伝 烈火",
           "overview": "After Kunisada's Yakuza leader and father figure is brutally murdered, he and his best friend go on a two-man mission to avenge his death, killing other Yakuza leaders leading to a final confrontation by the old man's killers.",
           "poster_path": "/2r4WNCpwAQzekbaZwoCcOv1GJuO.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "ja",
           "genre_ids": [
             28,
             18,
             53
           ],
           "popularity": 3.365,
           "release_date": "2002-09-21",
           "video": false,
           "vote_average": 6.7,
           "vote_count": 28
         },
         {
           "backdrop_path": null,
           "id": 792589,
           "title": "Intimate Desire",
           "original_title": "女歡",
           "overview": "Female modeling and lesbian interest",
           "poster_path": "/6owpqEOBcnDJ6r6GEoV4xZcdolo.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "cn",
           "genre_ids": [
             18
           ],
           "popularity": 5.576,
           "release_date": "1998-01-01",
           "video": false,
           "vote_average": 1.5,
           "vote_count": 2
         }
       ]
     },
     {
       "adult": false,
       "gender": 1,
       "id": 1902690,
       "known_for_department": "Acting",
       "name": "Michelle Randolph",
       "original_name": "Michelle Randolph",
       "popularity": 126.454,
       "profile_path": "/hbe4RPaEzZCvLvyWxV6tvwcFQo4.jpg",
       "known_for": [
         {
           "backdrop_path": "/3Z8TQeeB4wC5zEXw4XugyO0upLV.jpg",
           "id": 480157,
           "title": "House of the Witch",
           "original_title": "House of the Witch",
           "overview": "A group of high-school kids set out to play a Halloween prank at an abandoned house, but once they enter they become victims of a demonic witch who has set her wrath upon them.",
           "poster_path": "/fSvhp22gCoHgFMDSnyhrmlo3M0k.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             27,
             10770
           ],
           "popularity": 9.26,
           "release_date": "2017-10-07",
           "video": false,
           "vote_average": 4.8,
           "vote_count": 130
         },
         {
           "backdrop_path": "/t7nUJ8aLDkGejeLiqrGCN3OGmnD.jpg",
           "id": 810271,
           "title": "The Resort",
           "original_title": "The Resort",
           "overview": "Four friends head to Hawaii to investigate reports of a haunting at an abandoned resort in hopes of finding the infamous Half-Faced Girl. When they arrive, they soon learn you should be careful what you wish for.",
           "poster_path": "/bXZUVJP8Fr3RId7SSsV4RXvjnIh.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             27
           ],
           "popularity": 24.883,
           "release_date": "2021-04-30",
           "video": false,
           "vote_average": 5.6,
           "vote_count": 253
         },
         {
           "backdrop_path": "/9I6LgZ5110ycg4pyobJxGTFWFCF.jpg",
           "id": 157744,
           "name": "1923",
           "original_name": "1923",
           "overview": "Follow a new generation of the Dutton family during the early twentieth century when pandemics, historic drought, the end of Prohibition and the Great Depression all plague the mountain west, and the Duttons who call it home.",
           "poster_path": "/zgZRJZvZn5cpsWAB0zMUdad3iZd.jpg",
           "media_type": "tv",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             18,
             37
           ],
           "popularity": 115.848,
           "first_air_date": "2022-12-18",
           "vote_average": 8.085,
           "vote_count": 396,
           "origin_country": [
             "US"
           ]
         }
       ]
     },
     {
       "adult": false,
       "gender": 1,
       "id": 224513,
       "known_for_department": "Acting",
       "name": "Ana de Armas",
       "original_name": "Ana de Armas",
       "popularity": 125.68,
       "profile_path": "/5Qne374OM0ewMM7uSN9eq9jNrWq.jpg",
       "known_for": [
         {
           "backdrop_path": "/3bWUP9kyf9BxVc0hmZdqXB2w4UP.jpg",
           "id": 335984,
           "title": "Blade Runner 2049",
           "original_title": "Blade Runner 2049",
           "overview": "Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what's left of society into chaos. K's discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years.",
           "poster_path": "/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             878,
             18
           ],
           "popularity": 112.323,
           "release_date": "2017-10-04",
           "video": false,
           "vote_average": 7.572,
           "vote_count": 13745
         },
         {
           "backdrop_path": "/4HWAQu28e2yaWrtupFPGFkdNU7V.jpg",
           "id": 546554,
           "title": "Knives Out",
           "original_title": "Knives Out",
           "overview": "When renowned crime novelist Harlan Thrombey is found dead at his estate just after his 85th birthday, the inquisitive and debonair Detective Benoit Blanc is mysteriously enlisted to investigate. From Harlan's dysfunctional family to his devoted staff, Blanc sifts through a web of red herrings and self-serving lies to uncover the truth behind Harlan's untimely death.",
           "poster_path": "/pThyQovXQrw2m0s9x82twj48Jq4.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             35,
             80,
             9648
           ],
           "popularity": 126.702,
           "release_date": "2019-11-27",
           "video": false,
           "vote_average": 7.846,
           "vote_count": 12488
         },
         {
           "backdrop_path": "/oNoprEND25zXR6Fns8cIZUkuoMc.jpg",
           "id": 308266,
           "title": "War Dogs",
           "original_title": "War Dogs",
           "overview": "Based on the true story of two young men, David Packouz and Efraim Diveroli, who won a $300 million contract from the Pentagon to arm America's allies in Afghanistan.",
           "poster_path": "/mDcPRjZC1bb6LavFU3gwsWdVfCM.jpg",
           "media_type": "movie",
           "adult": false,
           "original_language": "en",
           "genre_ids": [
             35,
             80,
             18
           ],
           "popularity": 38.932,
           "release_date": "2016-08-18",
           "video": false,
           "vote_average": 6.922,
           "vote_count": 4932
         }
       ]
     }
   ],
   "total_pages": 190484,
   "total_results": 3809663
 }
 */
