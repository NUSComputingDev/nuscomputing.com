# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
events = Event.create([{name: "Halloween Celebrations", img: "halloween.jpg", link:"halloween", description: "Long description of event. Long description of event. "},
                       {name: "Welfare Pack Giveaway", img: "welfarepack.png", link:"welfare-pack", description: "Long description of event. Long description of event. "},
                       {name: "Committee Recruitment", img: "recruitment.jpg", link:"recruitment", description: "Long description of event. Long description of event. "}]);
                       
mcwings = McWing.create({wingid: 0, wingname: "Yo"});
mcmembers = McMember.create({name: "Thenaesh", position: "Boss", wingid: 0, wingrank: 0, cellrank: 0, course: "DDP", year: 3, description: "Hello!", casualimg: "Thenaesh", formalimg:"Thenaesh"});
