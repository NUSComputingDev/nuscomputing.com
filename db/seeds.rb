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

mcwings = McWing.create(
[
  {
    wingid: 0,
    wingname: "Presidential Wing"
  },
  {
    wingid: 1,
    wingname: ""
  },
  {
    wingid: 2,
    wingname: ""
  },
  {
    wingid: 3,
    wingname: ""
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
    formalimg:"jorel"
  }
]);
