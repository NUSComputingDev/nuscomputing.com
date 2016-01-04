# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

events = Event.create([{name: "Halloween Celebrations", img: "halloween.jpg", link:"halloween", description: "Long description of event. Long description of event. ", featured: true},
                       {name: "Welfare Pack Giveaway", img: "welfarepack.png", link:"welfare-pack", description: "Long description of event. Long description of event. ", featured: true},
                       {name: "Committee Recruitment", img: "recruitment.jpg", link:"recruitment", description: "Long description of event. Long description of event. ", featured: true},
                       {name: "Christmas Party", img: "christmas.jpg", link:"christmas", description: "Long description of event. Long description of event. ", featured: true},
                       {name: "Sports Camp", img: "sportscamp.jpg", link:"sports-camp", description: "Long description of event. Long description of event. ", featured: true},
                       {name: "Sports Camp 16", img: "sportscamp2.jpg", link:"sports-camp-2", description: "Long description of event. Long description of event. ", featured: true},
                       {name: "Academic Feedback", img: "acadfeedback.png", link:"acad-feedback", description: "Long description of event. Long description of event. ", featured: true}]);

sponsors = Sponsor.create([{name: "Grabtaxi", link: "http://www.grabtaxi.com", img: "grabtaxi.png"},
													 {name: "IMH", link: "https://www.imh.com.sg", img: "imh.jpg"},
													 {name: "CSIT", link: "http://www.csit.gov.sg", img: "csit.jpg"},
													 {name: "Garena", link: "http://www.garena.sg", img: "garena.png"},
													 {name: "Meiji", link: "http://www.meiji.com.sg", img: "meiji.jpg"},
													 {name: "NTUC", link: "https://www.ntuc.org.sg", img: "ntuc.jpg"},
													 {name: "London Choco Roll", link: "http://www.lbbg.com.my/lbb/products/londonroll.php", img: "london.png"}]);

mcwings = McWing.create(
[
  {
    wingid: 0,
    wingname: "Presidential Wing"
  },
  {
    wingid: 1,
    wingname: "Human Resource and Development Wing"
  },
  {
    wingid: 2,
    wingname: "External Relations Wing"
  },
  {
    wingid: 3,
    wingname: "Operations and Projects Wing"
  }
]);

mcmembers = McMember.create(
[
  {
    name: "Tan Yongming",
    position: "President",
    wingid: 0,
    wingrank: 0,
    cellrank: 0,
    course: "Information Systems",
    year: 2,
    description: "Hi! I am Yongming! As the President of the 18th Management Committee, I aim to coordinate the efforts of my team to effectively improve the experience of each and every one of you during your time in School of Computing (SoC). From Freshmen Camps to Programming Workshops and Networking Sessions, we plan to deliver a variety of events and initiatives to meet the different aspirations of our Club members regardless of your year and course of study.",
    casualimg: "yongming",
    formalimg:"yongming"
  },
  {
    name: "Jia Siqi",
    position: "General Secretary",
    wingid: 0,
    wingrank: 1,
    cellrank: 0,
    course: "Information Systems",
    year: 2,
    description: "Hi! I'm Siqi and I'm a Year 2 in IS. When I'm not busy being a student, I can be found eating ice cream, downing coffee, pretending I know how to sing or running on the Utown treadmills (so I can chase people for deadlines). I may appear aloof sometimes but I'm actually very friendly! So feel free to approach me for a chat or if you want to know more about the MC!",
    casualimg: "siqi",
    formalimg:"siqi"
  },
  {
    name: "Chelsi Teo Xin Yi",
    position: "Deputy General Secretary",
    wingid: 0,
    wingrank: 1,
    cellrank: 1,
    course: "Electronic Commerce",
    year: 2,
    description: "Hello, I am Chelsi! Even though I may seem intimidating because of my height or my resting *stoned* face hahaha I promise I'm actually not! Asides from doing things like taking down minutes/collecting money from late people hehe, you can probably always find me eating (Hence, the picture :p) and *dreaming* of my next travel getaway. Anyways, feel free to approach me about any questions regarding the MC and cya around! :)",
    casualimg: "chelsi",
    formalimg:"chelsi"
  },
  {
    name: "Benedict S Suratanakavikul",
    position: "Student Relations Secretary",
    wingid: 0,
    wingrank: 2,
    cellrank: 0,
    course: "Computer Science",
    year: 3,
    description: "I love stories and I am here to seek out the hidden stories of SoC.
As the SRS, I will be the bridge between the club members and the management committee.
My team and I will do our best to find out what Computing students want and translate it into actions by the student leaders.
Tell us your tales and we will do our best to make them true!",
    casualimg: "ben",
    formalimg:"ben"
  },
  {
    name: "Tay Kai Teng, Jorel",
    position: "Deputy Student Relations Secretary",
    wingid: 0,
    wingrank: 2,
    cellrank: 1,
    course: "Computational Biology",
    year: 2,
    description: "Hello =), I'm Jorel. Following Freshman Orientation Week, I extended my contract with Ben. So here I am, joining SRS to hear the voices of the student body =).  So if you have any feedback, don't be shy! Just approach me or Ben or email us.",
    casualimg: "jorel",
    formalimg: "jorel"
  },
  {
    name: "Shao Hui",
    position: "Director of Finance",
    wingid: 0,
    wingrank: 3,
    cellrank: 0,
    course: "Computer Science",
    year: 1,
    description: "With a stranglehold on the club finances, Shao Hui strives to end the financial year in the green.

For any questions regarding finance simply contact him, following the steps detailed below.

Step 1: Send an e-meow to finance(at)nuscomputing.com
Step 2: Wait for his reply
Step 3: Profit",
    casualimg: "shaohui",
    formalimg: "shaohui"
  },
  {
    name: "Javier Leong Lu Sheng",
    position: "Computing Club NUSSU Representative",
    wingid: 0,
    wingrank: 4,
    cellrank: 0,
    course: "Computer Science",
    year: 2,
    description: "As a NUSSU representative of Computing Club, improving relationships between Computing Club and NUSSU EXCO will be a movement that I will be championing for. This allows me to better reach out to Computing Club and computing students to understand students' lives and the concerns that they may have. I strive to build and maintain a sturdy bridge between NUSSU EXCO and Computing Club.",
    casualimg: "javier",
    formalimg: "javier"
  },
  ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
  {
    name: "Thenaesh Elango",
    position: "Vice President (Human Resource & Development)",
    wingid: 1,
    wingrank: 0,
    cellrank: 0,
    course: "Computer Science",
    year: 2,
    description: "Hi, I'm Thenaesh! I'm honoured to be given the opportunity to serve as VP (HR). I hope to help build a cohesive and proud SoC community over my term in office. My wing and I are here to look after your welfare in all its different forms, be it academic help and advocacy, sports activities or social events for you to take a break after a busy day. Should you have any comments, suggestions or queries, feel free to send them to connect(at)nuscomputing.com or directly to me at vp.hrd(at)nuscomputing.com. :)",
    casualimg: "thenaesh",
    formalimg: "thenaesh"
  },
  {
    name: "Terence Chok",
    position: "Director of Welfare",
    wingid: 1,
    wingrank: 1,
    cellrank: 0,
    course: "Computer Science",
    year: 2,
    description: "Hi! I am Terence. I am the Chosen one, tasked to bring SoC Welfare to the next level. Which level? The sky is the limit!

Brace yourselves for the biggest Welfare Shower of your lives as we bring about constant bombardment of free goodies and fun events. Feel free to approach me if you are feeling down, because your Welfare is my Welfare.",
    casualimg: "terence",
    formalimg:"terence"
  },
  {
    name: "Huang Lie Jun",
    position: "Deputy Director of Welfare",
    wingid: 1,
    wingrank: 1,
    cellrank: 1,
    course: "Computer Science",
    year: 2,
    description: "Hey! I am Lie Jun but you may call me LJ, Larry or elf! I am your happiness engineer and my job is to put a smile on your pretty face! Hang on tight while we try our best to liven up your SOC experience! You can catch me in the club room, but please don't present any clothing to me. (I will be wearing clothes, don't worry)",
    casualimg: "larry",
    formalimg:"larry"
  },
  {
    name: "Lim Wei Ling",
    position: "Director of Academic Liaison",
    wingid: 1,
    wingrank: 2,
    cellrank: 0,
    course: "Computer Science",
    year: 1,
    description: "Hello! Most of my friends call me Zachary or Zac but Wei Ling is also fine! As the Director of Academic Liaison, it is my duty to help students enrich their student life academically! Feel free to drop me emails if you have ideas to value-add to your learning experiences in NUS! I will do my utmost best to implement it! Where there is demand, there is supply!",
    casualimg: "zac",
    formalimg:"zac"
  },
  {
    name: "Marcus Ng Wen Jian",
    position: "Deputy Director of Academic Liaison",
    wingid: 1,
    wingrank: 2,
    cellrank: 1,
    course: "Computer Science",
    year: 1,
    description: "Hello! Quiet as I may seem, but I am actually friendly as can be. Feel free to give us feedback on the changes you wish to see in SoC with regards to academics. We hope to support you in many different ways. Words speak purpose, but action transcend it. We shall do it!",
    casualimg: "marcus",
    formalimg:"marcus"
  },
  {
    name: "Jayden Shen",
    position: "Director of Sports",
    wingid: 1,
    wingrank: 3,
    cellrank: 0,
    course: "Computer Science",
    year: 3,
    description: "Sports is always been an important part of my university life. I love every aspect of sports, be it the competitiveness or the bonding that sports could bring to the table.
If anyone would like to discuss sports events or play sports, just approach me, I am more than willing to!
At the end of the day I hope that I could achieve/see
1) a proactive sports culture in SoC
2) and most importantly, the joy and laughter from SoCians via playing sports!",
    casualimg: "jayden",
    formalimg:"jayden"
  },
  {
    name: "Wong Kang Min",
    position: "Deputy Director of Sports",
    wingid: 1,
    wingrank: 3,
    cellrank: 1,
    course: "Computer Science",
    year: 2,
    description: "Hi there! My name is Kang Min! Playing sports is my passion, as it is a great way to keep myself fit, and to destress. I hope to help the sports cell in spreading the passion for sports to the whole of the SoC community! Let's create a healthy SoC lifestyle together!",
    casualimg: "kangmin",
    formalimg:"kangmin"
  },
  ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
  {
    name: "Koh Zheng Kang, Andrew",
    position: "Vice President (External Relations)",
    wingid: 2,
    wingrank: 0,
    cellrank: 0,
    course: "Computer Science",
    year: 4,
    description: "Hallo hallo! Andrew here. If you're reading this page I assume that you are looking for a point of contact. You can drop us an email at connect(at)nuscomputing.com for all matters, or if you're specifically looking for me, vp.extrel(at)nuscomputing.com is my email!

Oh I happen to be Vice President for External Relations for this academic year, and I look forward to solving problems for peers around me.",
    casualimg: "kzk",
    formalimg:"kzk"
  },
  {
    name: "Lim Hui Qi",
    position: "Director of Marketing",
    wingid: 2,
    wingrank: 1,
    cellrank: 0,
    course: "Computer Science",
    year: 1,
    description: "Hello! I'm Hui Qi, also known as the SoC Cat from RaG 2015~
Feel free to approach me via any platforms about anything as I won't bite you muahaha!
As the Marketing Director, I hope to get as much benefits for the student body as possible, and that includes you, who is reading this!
Don't be shy and just say hello!",
    casualimg: "huiqi",
    formalimg: "huiqi"
  },
  {
    name: "Chase Tiong YaoCong",
    position: "Deputy Director of Marketing",
    wingid: 2,
    wingrank: 1,
    cellrank: 1,
    course: "Computer Science",
    year: 1,
    description: "Hello, I'm Chase but I won't be chasing you around~~ . Even though, I may look fierce sometimes but I am actually not. Feel free to approach me for for a random chat or if you would like to know more about Marketing Committee or sponsors for the various events happening in SoC.",
    casualimg: "chase",
    formalimg: "chase"
  },
  {
    name: "Juliana Seng",
    position: "Director of Publicity",
    wingid: 2,
    wingrank: 2,
    cellrank: 0,
    course: "Information Security",
    year: 2,
    description: "Hello there, I'm Juliana and I like chicken nuggets! I want to increase the outreach to all of you kawaii SoC students, encourage involvement and spread happiness through our club events! I also hope to level up the design skillz of SoC students and our club members! Remember to like our Facebook page and follow us on Instagram for rainbows and magic! :3",
    casualimg: "juliana",
    formalimg: "juliana"
  },
  {
    name: "Tan Wee Chen, William",
    position: "Deputy Director of Publicity",
    wingid: 2,
    wingrank: 2,
    cellrank: 1,
    course: "Computer Science",
    year: 2,
    description: "Hello everyone, William here! This year will be a very exciting year as the 18th MC has many interesting events planned for SoC. I want to let the whole world know about all the fun we will have and how cool it is to be part of SoC Family! Don't be shy when you see me or our talented SoC photographers pointing our cameras at you and give us your biggest smile!",
    casualimg: "william",
    formalimg: "william"
  },
  {
    name: "Jia Lin",
    position: "Director of Alumni Relations",
    wingid: 2,
    wingrank: 3,
    cellrank: 0,
    course: "Computer Science",
    year: 2,
    description: "Hi I'm Jia Lin, your AR director aka minion! I seek to provide exciting opportunities for us to connect with the alumni as well as to enrich our time spent in SoC. If you have any suggestions, or want to know more about what Alumni Relations cell is up to, feel free to facebook message / talk to me anytime! I look fierce but people just label me as weird/FUNNY/UNGLAM, so there you go~",
    casualimg: "jialin",
    formalimg: "jialin"
  },
  {
    name: "Md Ashmawi Bin Md Jailani",
    position: "Deputy Director of Alumni Relations",
    wingid: 2,
    wingrank: 3,
    cellrank: 1,
    course: "Computer Science",
    year: 3,
    description: "Hi guys, Ash here. Maybe you've seen me around school, maybe you've seen Ashraf instead. Regardless, we're both friendly people hahaha, so feel free to just say hi! As Deputy Director of Alumni Relations, I hope to be able to provide opportunities for alumni and undergraduates to interact and learn more from each other! So if you guys have any suggestions, feedbacks or comments, pls do feel free to tell me! Hahaha",
    casualimg: "ash",
    formalimg: "ash"
  },
  ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
  {
    name: "Ng Zi Kai",
    position: "Vice President (Operations & Projects)",
    wingid: 3,
    wingrank: 0,
    cellrank: 0,
    course: "Information Security",
    year: 2,
    description: "Hello everyone! I'm Zi Kai! Thank you for giving me this opportunity to serve the SoC community as VP(Ops)!

Together with my wing, we aim to bring about new and exciting projects to enhance your experience as a student in SoC!

Meanwhile, if you have any comments/suggestion, feel free to contact me at vp.ops(at)nuscomputing.com!

Stay tuned! :)",
    casualimg: "zikai",
    formalimg: "zikai"
  },
  {
    name: "Sng Yong Jie, Dylan",
    position: "Director of Logistics",
    wingid: 3,
    wingrank: 1,
    cellrank: 0,
    course: "Computer Science",
    year: 1,
    description: "Hey, If you don't know how to de-stress, I suggest you to head to the The Deck (Arts Canteen) to have some Laksa ASAP!
Also, if you ever feel conflicted when making a decision, just think about how short life is and YOLO!
P.S. We have loads of games inside the clubroom available for you! :)
- Your friendly Sai Kang Warrior",
    casualimg: "dylan",
    formalimg: "dylan"
  },
  {
    name: "Chen Rui Wen",
    position: "Deputy Director of Logistics",
    wingid: 3,
    wingrank: 1,
    cellrank: 1,
    course: "Computer Science",
    year: 1,
    description: "Yohoo!! I am Rui Wen, deputy director of logistics. Feel free to approach me if you need anything from the store. I am also the one allocating lockers to SoC students, so if you need lockers, come bribe me with food ^^, joking la, for all SoC students, you may email me at dy.logistics(at)nuscomputing.com to use a locker for free!",
    casualimg: "ruiwen",
    formalimg: "ruiwen"
  },
  {
    name: "Low Wei Kit",
    position: "Director of Freshmen Orientation Projects",
    wingid: 3,
    wingrank: 2,
    cellrank: 0,
    course: "Computer Science",
    year: 2,
    description: "Hello everyone! University is not only an institute to learn, but also a second home where you have friends who take care of one another like their family. I hope that through the orientation programme, Freshmen will feel welcomed into the SoC family and make long-lasting friendships with their peers in the course!

If you have any suggestions to help us improve the orientation experience for the Freshmen next year, feel free to drop us an email at fop(at)nuscomputing.com!",
    casualimg: "weikit",
    formalimg: "weikit"
  },
  {
    name: "Te(Ting) Sze Ying",
    position: "Deputy Director of Freshmen Orientation Projects",
    wingid: 3,
    wingrank: 2,
    cellrank: 1,
    course: "Computer Science",
    year: 2,
    description: "Hello! I'm Sze Ying! As your FOP Deputy Director, I will be working with the FOP Director, Wei Kit, to make FOP 2016 an unforgettable experience for the freshmen and the seniors involved. If you want to join us in shaping the FOP 2016 experience, and get to know me better, feel free to approach me or Wei Kit! :)",
    casualimg: "szeying",
    formalimg: "szeying"
  },
  {
    name: "Nicholas Lum Aik Yong",
    position: "Director of Information Technology",
    wingid: 3,
    wingrank: 3,
    cellrank: 0,
    course: "Computer Science",
    year: 3,
    description: "Never have I taken on such an exciting role before. Going to school has always been a chore, but not now! To be able to exercise my passion for tech and also contribute to Computing Club is really pretty cool. Give me a call if you want to chat with a geek like yourself. You will be entertained, I bet! Up until you notice the first word of each sentence...",
    casualimg: "nicholas",
    formalimg: "nicholas"
  },
  {
    name: "Kenneth Ho Chee Chong",
    position: "Deputy Director of Information Technology",
    wingid: 3,
    wingrank: 3,
    cellrank: 1,
    course: "Computer Science",
    year: 2,
    description: "Hello I'm Kenneth. I'm glad to have this opportunity to serve as the Deputy Director of IT. Together with the Director of IT and our team, we seek to improve IT related matters of the Computing Club. If you have any suggestions, or wish to know more about the IT cell, feel free to contact Nicholas or me anytime!",
    casualimg: "kenneth",
    formalimg: "kenneth"
  }
]);
