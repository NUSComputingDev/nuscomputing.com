# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# { role: member }
{ 
	acad: ['acad', 'dy.acad'],
  ar: ['alumnirelations', 'dy.alumnirelations'],
  finance: ['finance', 'dy.finance'],
  fop: ['fop', 'dy.fop'],
  it: ['infotech', 'dy.infotech'],
  log: ['logistics', 'dy.logistics'],
  marketing: ['marketing', 'dy.marketing'],
  pcell: ['president', 'vp.extrel', 'vp.hrd', 'vp.ops', 'secretariat', 'dy.secretariat', 'studentrelations', 'dy.studentrelations'],
  publicity: ['publicity', 'dy.publicity'],
  sports: ['sports', 'dy.sports'],
  welfare: ['welfare', 'dy.welfare']
}.each do |role, members|
	rol = Role.create(name: role)
	if members.respond_to? :each
		members.each do |mem|
			email = "#{mem}@nuscomputing.com"
			rol.members.create(email: email)
		end
	else
		email = "#{members}@nuscomputing.com"
		rol.members.create(email: email)
	end
end



# Locker
# [A, B, C, D, E, F, G, H]
# [0, 1, 2, 3, 4, 5, 6, 7]
{ 
	0 => ["3137-3168", "3173-3208", "3529-3532"],
	1 => ["3065-3136", "3473-3504", "3413-3472", "3372-3412"],
	2 => ["3209-3280"],
	3 => ["3513-3520", "3353-3372"],
	4 => ["2069-2136", "2137-2200", "3281-3340", "3349-3352"],
	5 => ["2205-2272"],
	6 => ["2001-2068"],
	7 => ["3533-3544", "3169-3172", "2505-2512", "3521-3528"]
}.each do |loc, number_ranges|
	number_ranges.each do |range|
		range_num = range.split('-').map { |x| x.to_i } #range_num[0] is the starting number and range_num[1] is ending
		(range_num[0]..range_num[1]).each do |num|
			Locker.create location: loc, number: num.to_s, status: 0 #status: 0 - vacant, 1 - occupied
		end
	end
end



events = Event.create(
    [
        {
            name: "FOP 2016",
            img: "http://i.imgur.com/rtLLChl.jpg",
            link:"fop-2016",
            externalpage: "http://freshmen.nuscomputing.com",
            description: "Are you an incoming freshman who wants to find out more about the school? Or do you simply want to make some friends and have fun?

NUS Computing Freshmen Orientation Projects (FOP) 2016 presents to you Virtutem Quattuor. With an exciting lineup of events, we will help you integrate into our Computing family in no time. At FOP, not only do you get the opportunity to meet other incoming freshmen, you will also meet seniors who will provide valuable advice to follow you through your University years. Join us this summer for the best freshmen experience you’ll ever have!",
            featured: true
        },
        {
            name: "LoveBytes",
            img: "http://i.imgur.com/DASd3lF.jpg",
            link:"lovebytes",
            externalpage: "https://mysurvey.nus.edu.sg/EFM/se.ashx?s=54CCD14B7E4B65F8",
            description: "Orders are closing soon for LoveBytes2016! Order now if you want SoCupids to send your message for you! :3

Are you Wi-Fi?

Because I'm feeling the connection

Looking to show your appreciation for people that have always stood by you?

SoC LoveBytes orders are open now at AMAZING prices! Visit http://tiny.cc/LoveBytes2016 now to make your orders! Don't miss the chance to show your appreciation to your loved ones and friends this Valentine's Day!",
            featured: true
        },
        {
            name: "FOP Recruitment 2016",
            img: "http://i.imgur.com/SGpr15e.jpg",
            link:"fop-recruitment-2016",
            externalpage: "https://mysurvey.nus.edu.sg/EFM/se.ashx?s=54CCD14B095CC4E6",
            description: "Are you looking for an exciting activity to participate in the summer? Want to relive your Orientation experience? Wait no further! Join Freshmen Orientation Projects(FOP) as an OGL / House Head / Helper(OHH)!
We are recruiting Photographers as well! (A workshop will be provided, so if you are interested but lack the skills, you still can sign up!)

Sign up at tiny.cc/OHH2016 or click the external link button.
Signup closes at the end of week 5, so sign up fast!
Join our family and let's have fun together! :D",
            featured: false
        },
        {
            name: "Welfare Night AY15/16 S2",
            img: "http://i.imgur.com/hwRe4Z3.jpg",
            link:"welfare-night-ay1516-s2",
            externalpage: "https://www.facebook.com/nuscomputing/photos/904991259569092/",
            description: "Feeling the blues after a great vacation? Dread coming back to school? Stay back this Friday night from 7.00pm onwards for Welfare Night! We have consoles set up for you in our Student Lounge, Steam games such as DOTA 2, L4D2, Team Fortress 2 ready to play in Programming Lab 6, board games and carom boards free to loan, and karaoke sessions too! All these plus complementary snacks and drinks for your enjoyment! What are you waiting for? Grab your friends and have some fun before this hectic semester begins!

Hope to see you there!",
            featured: true
        },
        {
            name: "Halloween Celebrations 2015",
            img: "http://i.imgur.com/7GesAmY.jpg",
            link:"halloween-celebrations-2015",
            externalpage: "https://www.facebook.com/nuscomputing/photos/869736583094560/",
            description: "Computing Club's Welfare Cell proudly presents... Halloween Celebration 2015: The Monster Invasion. We will be giving out free candies to SoC students on that day. Stand to win additional prizes if you take part in our Photo-booth Contest and Oculus Rift Hub.

Last but not least... Shirt Sales are back!

See you there!",
            featured: false
        },
        {
            name: "Welfare Pack Giveaway AY15/16 S1",
            img: "http://i.imgur.com/wpSK675.png",
            link:"welfare-pack-giveaway-ay1516-s1",
            externalpage: "https://www.facebook.com/nuscomputing/photos/875257525875799/",
            description: "Exam Welfare Pack Distribution is coming to you soon!

Remember to complete the survey at least ONE DAY before you come and collect the goodies! http://tiny.cc/welfarepack15sem1",
            featured: false
        },
        {
            name: "Christmas Party 2015",
            img: "http://i.imgur.com/U2vHwZP.jpg",
            link:"christmas-party-2015",
            externalpage: "https://www.facebook.com/events/1177463648949180/",
            description: "Christmas just around the corner! The Computing Club has exciting plans to spread joy to all of NUS Computing, Students or Staff during this festive season!

To celebrate the spirit of giving, we are going to give everyone the opportunity to be givers in a Secret Santa Gift Exchange! On top of that, we are also organising a potluck dinner for that night! If you're interested, do join us!

~~Please read below for more details~~

Event Date: 23 December 2015
Registration: 1830 - 1900H (Participants without gifts will not need to register)
Event Start / End Time: 1900 - 2230H (You may leave early if you want)
Venue: COM1, Level 2, Lobby (Outside SR1 / Student Lounge)

Highlights
1) Potluck (No food will be provided, so bring and share food or order food with your peers)
2) Interesting Games (may have prizes)
3) Secret Santa (Gift exchange! If interested please bring along a gift that cost between $5 to $10. You are discouraged to bring any gifts that cost beyond the recommended price range)
4) Console games will be set-up in the Student Lounge so you may bring along XBox 360 titles or Wii titles! We have some game titles of our own as well.
5) Board games will be avaible for loan to play as well!

All SoC students and staff are welcomed to join.

If you are preparing homemade food, please prepare a list of ingredients you will be using for other participants to check for their allergens on that evening!

The theme for the attire is HUMAN XMAS TREE =)",
            featured: false
        },
        {
            name: "Sports Camp 2015",
            img: "http://i.imgur.com/l4CamhV.jpg",
            link:"sports-camp-2015",
            externalpage: "https://www.facebook.com/nuscomputing/photos/876412282426990/",
            description: "Want to find somewhere to bond, chillax and play sports at the same time? SoC Sports Cell invites you to Sports Camp 16! We have fun and exciting programs such as PARKOUR, LACROSSE and NIGHT CYCLING in store for you. Most importantly, don't forget the highlight of the camp, PAINTBALL!

SoC Sports Camp will be held on 6-8 Jan 2016 at a price of $50 per camper.",
            featured: false
        }
    ]
);



sponsors = Sponsor.create(
    [
        {
            name: "90s Candy Society",
            website: "http://www.90s.com.sg",
            img: "http://i.imgur.com/EV6sGLH.png",
            description: "No description available."
        },
        {
            name: "Accenture",
            website: "https://www.accenture.com/sg-en",
            img: "http://i.imgur.com/VhXYBUf.png",
            description: "Accenture is a leading global professional services company, providing a broad range of services and solutions in strategy, consulting, digital, technology and operations."
        },
        {
            name: "Aptus",
            website: "http://www.aptus.com.sg",
            img: "http://i.imgur.com/9R84G3z.png",
            description: "No description available."
        },
        {
            name: "Atlantic Optical",
            website: "http://www.atlanticoptical.com.sg/",
            img: "http://i.imgur.com/AmuWXdX.png",
            description: "Atlantic Optical is a specialised and fully equipped eyecare concept store with wide selections of sunglasses, frames and contact lenses, daily disposable, cosmetic, rigid gas permeable lenses & multi focal contact lenses.

	Providing complete eye examinations, including cataract detection, intra­ocular pressure measurement, retinal photography, macular degeneration and visual field screening, ophthalmoscopy, pediatric vision management and binocular vision test."
        },
        {
            name: "Ban Choon",
            website: "http://www.banchoon.com.sg/",
            img: "http://i.imgur.com/xsIJZsQ.png",
            description: "Ban Choon Marketing Pte Ltd is founded in 1988 by the Managing Director Mr C H Tan. Though the company was officially founded in 1988 by Mr Tan, the name \"Ban Choon\" has existed since the 1950s, when Mr Tan's grandfather ran a trading business in Singapore.

	Ban Choon's core business is in the import and distribution of fresh produce – fruits and vegetables, supplying to major supermarkets, catering centres (Singapore Airlines Terminal Services, Changi International Airport Services and ship chandlers), hotels and restaurants."
        },
        {
            name: "BNP Paribas",
            website: "http://www.bnpparibas.com.sg/",
            img: "http://i.imgur.com/UW3PGFF.png",
            description: "BNP Paribas established its presence in Singapore in 1968 and employs over 2,000 employees.

	BNP Paribas Singapore is the regional hub for South East Asia and is responsible for the branches or fully owned subsidiaries in Indonesia, Malaysia, Philippines, Thailand and Vietnam.

	We offer products and services in Corporate and Institutional Banking (Advisory and Capital Markets, and Financing Solutions), Wealth Management, Asset Management and Securities Services.

	Our clients include large multinationals, local and regional corporations, Financial Institutions and High net worth individuals."
        },
        {
            name: "Botak Jones",
            website: "http://www.botakjones.com/",
            img: "http://i.imgur.com/8SZPuhE.png",
            description: "BOTAK JONES® was born out of the idea that everyone should have access to well­made food of all types. Seeing a lack of good, well­made western food in the industrial and heartland areas, the good people at BOTAK JONES® deemed it timely to carve a market niche and take the heartlands by storm! We’ve not looked back since!"
        },
        {
            name: "Bubble Bump",
            website: "http://www.bubblebump.sg/",
            img: "http://i.imgur.com/nVbnIUA.png",
            description: "No description available."
        },
        {
            name: "Community Health Assessment Team",
            website: "https://www.chat.mentalhealth.sg/",
            img: "http://i.imgur.com/xl1rCIs.png",
            description: "Community Health Assessment Team (CHAT) is a national outreach and mental health check programme under the Institute of Mental Health (IMH). Our team includes doctors, youth workers, outreach workers, and mental health advocates. Since 2009, we have been helping and supporting young people with mental health concerns."
        },
        {
            name: "CrimsonLogic",
            website: "http://www.crimsonlogic.com.sg/",
            img: "http://i.imgur.com/aHBzseC.png",
            description: "CrimsonLogic is a trusted partner working closely with governments around the world to develop innovative and sustainable eGovernment solutions to collaborate more seamlessly with their citizens and ecosystem.

	Headquartered in Singapore and with over two decades of experience, we have a deep understanding of the way agencies work, interact and deliver services. TradeNet®, eJudiciary, eStamping and CertOfOrigin are some of our world’s first innovations being used every day by government agencies worldwide.

	Our solutions span across the globe ­ Bahrain, Canada, Chile, China, Ghana, India, Madagascar, Mauritius, Mozambique, Panama, Saudi Arabia, Singapore, Trinidad & Tobago, the United Arab Emirates, and many other countries."
        },
        {
            name: "CSIT",
            website: "http://www.csit.gov.sg/",
            img: "http://i.imgur.com/Bf1ZS0G.png",
            description: "The Centre for Strategic Infocomm Technologies (CSIT) is an agency in the Ministry of Defence (MINDEF) that focuses on R&D and solutions development in information and communications technologies to fulfil the strategic needs of Singapore.

	Formed on 1 Feb 2003, CSIT has deep in­house technological expertise spanning a good spectrum of disciplines within the infocomm field to address a wide range of technological problems.

	In its efforts to develop robust solutions for the country’s strategic needs, CSIT leverages on commercial expertise and works closely with local research institutions, defence R&D and support organisations."
        },
        {
            name: "DSO",
            website: "https://www.dso.org.sg/",
            img: "http://i.imgur.com/U6CfmdK.png",
            description: "No description available."
        },
        {
            name: "Forest Adventure",
            website: "https://forestadventure.com.sg",
            img: "http://i.imgur.com/Q4jebO0.png",
            description: "No description available."
        },
        {
            name: "Glints",
            website: "https://glints.com/",
            img: "http://i.imgur.com/uqp17wy.png",
            description: "No description available."
        },
        {
            name: "GoGoVan",
            website: "https://www.gogovan.sg/",
            img: "http://i.imgur.com/5N6pS3C.png",
            description: "No description available."
        },
        {
            name: "Goro Goro",
            website: "https://www.facebook.com/GoroGoro.Asia/",
            img: "http://i.imgur.com/4fgxn2g.png",
            description: "No description available."
        },
        {
            name: "Gumtree",
            website: "http://www.gumtree.sg/",
            img: "http://i.imgur.com/HUtWnbu.png",
            description: "No description available."
        },
        {
            name: "Happi",
            website: "http://happi.sg/en",
            img: "http://i.imgur.com/oPF5Sp1.png",
            description: "Happi is a new social shopping platform that provides you with special deals, chances to win those things entirely free, and donates to a cause/ charity/ group you support - all without spending a dime. Simply by tapping on the Smiley button on each offering, you download a free discount coupon and automatically enters into a lucky draw contest.

Each week, we reward selected users who have 'smiled' 10 times or more with giveaways from our app.
(see our FB page for weekly give-away results)"
        },
        {
            name: "Ippin",
            website: "http://www.ippin-jpc.com/",
            img: "http://i.imgur.com/4nflD15.png",
            description: "No description available."
        },
        {
            name: "Je t’aime Perfumery Singapore",
            website: "https://www.jetaime-singapore.com/",
            img: "http://i.imgur.com/xfMfXHt.png",
            description: "We established this place, so you can express yourself in another medium.

	We know how expensive it can be to buy a basic set of 'olfactory material', especially if you are looking for high­quality. So we decided to gather the best available material for you, which we can share to create 'Olfactory art', 'Mixed­Media' work, Signature Fragrances and more.

	Our work and talk were well received by Singapore Art Museum (SAM) in 2014. We will be part of Heritage Festival 2015 and our work will be featured in National Museum Singapore in 2015."
        },
        {
            name: "Jet Brains",
            website: "https://www.jetbrains.com/",
            img: "http://i.imgur.com/AZpW503.png",
            description: "At JetBrains, code is our passion. For over 15 years we have strived to make the strongest, most effective developWe help developers work faster by automating common, repetitive tasks to enable them to stay focused on code design and the big picture. We provide tools to explore and familiarize with code bases faster. Our products make it easy for you to take care of quality during all stages of development and spend less time on maintenance tasks."
        },
        {
            name: "I’m Kim Korean BBQ",
            website: "https://www.facebook.com/imkim.asia/?ref=stream",
            img: "http://i.imgur.com/jdA4CV6.png",
            description: "No description available."
        },
        {
            name: "KOKOMAMA",
            website: "https://www.facebook.com/kokomama.marketplace",
            img: "http://i.imgur.com/LPoc7ir.png",
            description: "KOKOMAMA is ​a hip fusion cafe that sells different varieties of food and beverages ­ french bakery, chilli crab/curry/clam chowder bread bowls, rice bowls, coffee (latte etc), traditional kopi/ teh and dessert such as waffles and korean bingsu. And also affordable bread for people to take away!"
        },
        {
            name: "Laffio",
            website: "https://www.facebook.com/laffio.sg/",
            img: "http://i.imgur.com/jtrZYoZ.png",
            description: "No description available."
        },
        {
            name: "Manhattan Fish Market",
            website: "http://www.manhattanfishmarket.com/",
            img: "http://i.imgur.com/0y4c8KB.png",
            description: "At The Manhattan FISH MARKET, our guests are served with lip­smacking American­style seafood such as the famous Manhattan Fish n’ Chips, the all­time favourite Garlic Herb Mussels and the legendary Manhattan Flaming Seafood Platter.

	We have come a long way with more than 50 restaurants in Asia and the Middle East, including Singapore, Malaysia, Indonesia, Thailand, Sri Lanka, Myanmar, Oman, India and Japan. We attribute our success and regional popularity to our fresh, flavourful and innovative offerings. To meet our fans' insatiable appetite for delicious seafood, we are constantly expanding and evolving with brand new restaurant interiors inspired by the famous Fulton Fish Market. Every restaurant is tastefully appointed to evoke the colourful and dynamic spirit of the iconic market!"
        },
        {
            name: "Matchaya",
            website: "http://www.matchaya.sg/",
            img: "http://i.imgur.com/LxpL7NP.png",
            description: "No description available."
        },
        {
            name: "MGP",
            website: "https://mgplabel.com/",
            img: "http://i.imgur.com/IumlkBy.png",
            description: "No description available."
        },
        {
            name: "Milkcow",
            website: "https://www.facebook.com/MilkCow.Sg/",
            img: "http://i.imgur.com/f57dRZj.png",
            description: "Milkcow, Korean Organic Soft Serve Ice­cream, is here in Singapore.

	Milkcow is another Korean craze that seems to be taking the nation by storm. It’s like K­pop, everything Korean is in nowadays, and that includes Korean food. Milkcow is a Koreansoft serve ice cream chain. The milk is supposed to be 100% from Italy and they only have 1 flavor – which is milk soft serve ice cream. They’re famous for topping it with 100% organic honeycomb from Australia, giving it a healthy twist."
        },
        {
            name: "Paper Innovation Pte Ltd",
            website: "http://print-it.com.sg/",
            img: "http://i.imgur.com/pIN7pE1.png",
            description: "With a combined skillset of over 30 years in the printing industries, Paper Innovation has expanded into the role of a quick response printer and has distinguished ourselves by offering:

			­ On Time Delivery
			­ Competitive Rates
			­ Quality Products

	We provide graphic design, offset printing, letterpress and corporate gifts."
        },
        {
            name: "Playnation",
            website: "http://playnation.com.sg/",
            img: "http://i.imgur.com/JITeo5v.png",
            description: "Previously Known as The Hangout, Play Nation is founded with the vision of creating a cosy and comfortable place where youths (and the young at heart) would have a place to play, bond, and socialize over fun and engaging games. Besides having over 200 designer board and card games in stock, Play Nation also has more than 100 hand­picked console game titles for the XBox 360 and Nintendo Wii platform."
        },
        {
            name: "Pokka",
            website: "http://www.pokka.com.sg/",
            img: "http://i.imgur.com/n5DmuMQ.png",
            description: "Established in January 1977 by Pokka Sapporo Food & Beverage Limited (previously known as Pokka Corporation Japan), Pokka is a leading food and beverage group in Singapore and the Asia Pacific. The company manufactures and markets a wide range of beverages under the reputed brand name \"Pokka\" and also owns and operates restaurant chains, serving varied culinary delights.

	Today, Pokka is an undeniable presence in the ready­to­drink beverage market with a brand name that symbolises health, vitality and freshness. The Group has had successful expansion plans executed in over 50 countries across Asia, the Middle East and Europe and is constantly looking for new opportunities."
        },
        {
            name: "300% Positive",
            website: "http://www.300positive.com/",
            img: "http://i.imgur.com/rYoLjcb.png",
            description: "300 Percent Positive Energy Pte Ltd is a values driven organization established to make the world a better place!

	We provide exclusive workshops for individuals and organizations to instill 300% Positive Mindset/Culture/Environment: Positive Thoughts, Positive Speech, and Positive Actions!

	Being 300% Positive will create major improvements in our lives: health, work, relationships family and future!"
        },
        {
            name: "Singapore Pub Crawl",
            website: "http://www.singaporepubcrawl.com.sg",
            img: "http://i.imgur.com/lc5OsuT.png",
            description: "No description available."
        },
        {
            name: "Shopback",
            website: "https://www.shopback.sg/",
            img: "http://i.imgur.com/OOHAWIX.png",
            description: "ShopBack is a Singaporean­headed e­commerce startup that utilises the cashback reward program. It allows online shoppers to take a portion of their cash back when they buy products through the service. They also provide discount coupons and voucher codes for online shopping. It is currently affiliated with over 300 merchants from all over the world, including online retail giants Taobao, ZALORA, Lazada_Group, Rakuten and Groupon."
        },
        {
            name: "STA Travel",
            website: "http://www.statravel.com.sg/",
            img: "http://i.imgur.com/ohFiaeE.png",
            description: "STA Travel is the largest student and young person travel company in the world. It is the preferred travel company for over 6 million people worldwide.  With 2 retail locations in Singapore and an online presence at statravel.com.sg, anyone looking to 'experience the world face to face' has access to comprehensive travel products and services including airfares, accommodations and tours, discount cards, travel insurance, volunteer projects, working holidays and more through STA Travel."
        },
        {
            name: "Triple Dry",
            website: "http://www.triple-dry.com/",
            img: "http://i.imgur.com/qMBSsvJ.png",
            description: "Triple Dry contains a blend of three highly efficacious and proven anti­perspirant actives (Aluminium Sesquichlorohydrate, Aluminium Chlorohydrate, Aluminium Chlorohydrex PG) which are designed to provide effective, long lasting and responsive protection.

	It is this highly effective combination of three actives which gives Triple Dry the ability to keep heavy perspirers dry for up to 72 hours."
        },
        {
            name: "Uber",
            website: "https://www.uber.com/",
            img: "http://i.imgur.com/SP7oI1v.png",
            description: "Uber is evolving the way the world moves. By seamlessly connecting riders to drivers through our apps, we make cities more accessible, opening up more possibilities for riders and more business for drivers. From our founding in 2009 to our launches in hundreds of cities today, Uber's rapidly expanding global presence continues to bring people and their cities closer."
        },
        {
            name: "ViewQwest",
            website: "https://www.viewqwest.com/",
            img: "http://i.imgur.com/iweG4MH.png",
            description: "ViewQwest  strives to empower our  subscribers with the freedom to access entertainment  content and to surf with no limitations.

	With  Freedom  VPN,  users  are  empowered  to  watch  hundreds,  if  not  thousands,  of  Movies,  TV shows and more, from a plethora of online streaming services such as Netflix, Hulu, PPTV China.

	We pride ourselves as the innovative ISP that pioneered the removal of restrictive industry practices like  international  bandwidth  caps  and  traffic  shaping.  At  the  same  time,  we  implemented  best practices such as latency based routing, ensuring that subscribers get exactly what they pay for –  ultra­fast internet access."
        },
        {
            name: "WOODS'",
            website: "http://www.woods-singapore.com/",
            img: "http://i.imgur.com/2yKXaJ5.png",
            description: "WOODS’ has been a trusted Cough Syrup specialist and leading provider for Expel Phlegm Fast and Relieving Cough for more than 100 years since it’s first introduced in Year 1905. It is our commitment to provide consumers with a fast and safe cough solutions whenever it is needed."
        },
        {
            name: "Singapore World Water Day",
            website: "http://www.singaporeworldwaterday.com",
            img: "http://i.imgur.com/96UoZa0.png",
            description: "test"
        },
        {
            name: "Yakult Singapore",
            website: "https://yakult.com.sg/",
            img: "http://i.imgur.com/j6FYxOi.png",
            description: "Yakult was first introduced to Singaporeans in 1979 with the incorporation of Yakult Singapore in 1978.

	Although Yakult Singapore started humbly in three containers at Hillview Avenue, it operates today from a multi­million dollar ultra­modern plant at Senoko Avenue.

	As  Yakult  is  produced  locally,  our  customers  can  be  assured  of  the  highest  quality  and  freshness  of Yakult sold in Singapore.

	Yakult Singapore perseveres to continue its healthy journey to spread to all people in Singapore on the awareness of the benefits of its unique probiotics, L. casei strain Shirota along the principles of Shirotaism."
        },
        {
            name: "Zalora",
            website: "http://www.zalora.sg/",
            img: "http://i.imgur.com/i2hMgsF.png",
            description: "Asia’s leading online fashion destination! Gone are the days where you had to trawl through malls and stores in Singapore to find that perfect outfit. Now that fashion item that you need is just a few clicks away when you shop with ZALORA Singapore. Choose from our extensive collection of brands, both international and local, where you can mix and match between them to create the outfit that expresses your personality. ZALORA Singapore brings you the top brands where you can select the best and stay ahead of the fashion curve. Get decked out from head to foot in the latest trends; from shoes to shirts, dresses and skirts, lingerie, swimwear, outerwear and accessories too! Looking great also means taking care of your skin. Face masks, serums and creams. You name, we have it. All your needs to look great and feel great is right here when you shop with us, at ZALORA Singapore."
        },
        {
            name: "Zookal",
            website: "https://www.zookal.com.sg/",
            img: "http://i.imgur.com/TgnEi6M.png",
            description: "Zookal was created by university students in Australia in 2011. After personally experiencing the pain of expensive textbooks, the founders decided that they would create a better option for students. Here was born the idea of textbook rental, allowing students to save up to 70% off on their required course materials ­ saving students hundreds and even thousands of dollars throughout their degree.

	Having started the company to positively impact the lives of university students and quickly grown to serve hundreds of thousands of students in Australia, the founders have now dreamed of even bigger goals — leveraging technology to enhance the modern university experience for students. Zookal’s new video platform will allow university students thorughout Asia to share knowledge and discover the supplementary educational resources they need to learn faster and be more successful."
        }
    ]
);



mcwings = McWing.create(
    [
        {
            wingid: 1,
            wingname: 'Presidential Wing'
        },
        {
            wingid: 2,
            wingname: 'Human Resource and Development Wing'
        },
        {
            wingid: 3,
            wingname: 'External Relations Wing'
        },
        {
            wingid: 4,
            wingname: 'Operations and Projects Wing'
        }
    ]
);



mcmembers = McMember.create(
    [
        {
            name: "Tan Yongming",
            position: "President",
            wingid: 1,
            wingrank: 0,
            cellrank: 0,
            course: "Information Systems",
            year: 2,
            description: "Hi! I am Yongming! As the President of the 18th Management Committee, I aim to coordinate the efforts of my team to effectively improve the experience of each and every one of you during your time in School of Computing (SoC). From Freshmen Camps to Programming Workshops and Networking Sessions, we plan to deliver a variety of events and initiatives to meet the different aspirations of our Club members regardless of your year and course of study.",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/yongming.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/yongming.jpg"
        },
        {
            name: "Jia Siqi",
            position: "General Secretary",
            wingid: 1,
            wingrank: 1,
            cellrank: 0,
            course: "Information Systems",
            year: 2,
            description: "Hi! I'm Siqi and I'm a Year 2 in IS. When I'm not busy being a student, I can be found eating ice cream, downing coffee, pretending I know how to sing or running on the Utown treadmills (so I can chase people for deadlines). I may appear aloof sometimes but I'm actually very friendly! So feel free to approach me for a chat or if you want to know more about the MC!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/siqi.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/siqi.jpg"
        },
        {
            name: "Chelsi Teo Xin Yi",
            position: "Deputy General Secretary",
            wingid: 1,
            wingrank: 1,
            cellrank: 1,
            course: "Electronic Commerce",
            year: 2,
            description: "Hello, I am Chelsi! Even though I may seem intimidating because of my height or my resting *stoned* face hahaha I promise I'm actually not! Asides from doing things like taking down minutes/collecting money from late people hehe, you can probably always find me eating (Hence, the picture :p) and *dreaming* of my next travel getaway. Anyways, feel free to approach me about any questions regarding the MC and cya around! :)",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/chelsi.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/chelsi.jpg"
        },
        {
            name: "Benedict S Suratanakavikul",
            position: "Student Relations Secretary",
            wingid: 1,
            wingrank: 2,
            cellrank: 0,
            course: "Computer Science",
            year: 3,
            description: "I love stories and I am here to seek out the hidden stories of SoC.

As the SRS, I will be the bridge between the club members and the management committee.

My team and I will do our best to find out what Computing students want and translate it into actions by the student leaders.

Tell us your tales at studentrelations@nuscomputing.com and we will do our best to make them true!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/ben.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/ben.jpg"
        },
        {
            name: "Tay Kai Teng, Jorel",
            position: "Deputy Student Relations Secretary",
            wingid: 1,
            wingrank: 2,
            cellrank: 1,
            course: "Computational Biology",
            year: 2,
            description: "Hello =), I'm Jorel. Following Freshman Orientation Week, I extended my contract with Ben. So here I am, joining SRS to hear the voices of the student body =).  So if you have any feedback, don't be shy! Just approach me or Ben or email us.",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/jorel.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/jorel.jpg"
        },
        {
            name: "Shao Hui",
            position: "Director of Finance",
            wingid: 1,
            wingrank: 3,
            cellrank: 0,
            course: "Computer Science",
            year: 1,
            description: "With a stranglehold on the club finances, Shao Hui strives to end the financial year in the green.

	For any questions regarding finance simply contact him, following the steps detailed below.

	Step 1: Send an e-meow to finance(at)nuscomputing.com
	Step 2: Wait for his reply
	Step 3: Profit",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/shaohui.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/shaohui.jpg"
        },
        {
            name: "Tan Wei",
            position: "Deputy Director of Finance",
            wingid: 1,
            wingrank: 3,
            cellrank: 1,
            course: "Computer Science",
            year: 1,
            description: "Hello, I'm Tan Wei and I'm the way to go! Just kidding. Please look for me only when you have serious questions, like how does Computing Club manage its finance or can we hang out together? :P

I love money, photography and badminton. If you are interested in sharing a life - uhm, I mean interests - with me, feel free to contact me at dy.finance(at)nuscomputing.com. I'll be more than happy to get back to you!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/tanwei.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/tanwei.jpg"
        },
        {
            name: "Javier Leong Lu Sheng",
            position: "Computing Club NUSSU Representative",
            wingid: 1,
            wingrank: 4,
            cellrank: 0,
            course: "Electronic Commerce",
            year: 2,
            description: "As a NUSSU representative of Computing Club, improving relationships between Computing Club and NUSSU EXCO will be a movement that I will be championing for. This allows me to better reach out to Computing Club and computing students to understand students' lives and the concerns that they may have. I strive to build and maintain a sturdy bridge between NUSSU EXCO and Computing Club.",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/javier.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/javier.jpg"
        },
        ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
        {
            name: "Thenaesh Elango",
            position: "Vice President (Human Resource & Development)",
            wingid: 2,
            wingrank: 0,
            cellrank: 0,
            course: "Computer Science",
            year: 2,
            description: "Hi, I'm Thenaesh! I'm honoured to be given the opportunity to serve as VP (HR). I hope to help build a cohesive and proud SoC community over my term in office. My wing and I are here to look after your welfare in all its different forms, be it academic help and advocacy, sports activities or social events for you to take a break after a busy day. Should you have any comments, suggestions or queries, feel free to send them to connect(at)nuscomputing.com or directly to me at vp.hrd(at)nuscomputing.com. :)",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/thenaesh.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/thenaesh.jpg"
        },
        {
            name: "Terence Chok",
            position: "Director of Welfare",
            wingid: 2,
            wingrank: 1,
            cellrank: 0,
            course: "Computer Science",
            year: 2,
            description: "Hi! I am Terence. I am the Chosen one, tasked to bring SoC Welfare to the next level. Which level? The sky is the limit!

	Brace yourselves for the biggest Welfare Shower of your lives as we bring about constant bombardment of free goodies and fun events. Feel free to approach me if you are feeling down, because your Welfare is my Welfare.",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/terence.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/terence.jpg"
        },
        {
            name: "Huang Lie Jun",
            position: "Deputy Director of Welfare",
            wingid: 2,
            wingrank: 1,
            cellrank: 1,
            course: "Computer Science",
            year: 2,
            description: "Hey! I am Lie Jun but you may call me LJ, Larry or elf! I am your happiness engineer and my job is to put a smile on your pretty face! Hang on tight while we try our best to liven up your SOC experience! You can catch me in the club room, but please don't present any clothing to me. (I will be wearing clothes, don't worry)",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/larry.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/larry.jpg"
        },
        {
            name: "Lim Wei Ling",
            position: "Director of Academic Liaison",
            wingid: 2,
            wingrank: 2,
            cellrank: 0,
            course: "Computer Science",
            year: 1,
            description: "Hello! Most of my friends call me Zachary or Zac but Wei Ling is also fine! As the Director of Academic Liaison, it is my duty to help students enrich their student life academically! Feel free to drop me emails if you have ideas to value-add to your learning experiences in NUS! I will do my utmost best to implement it! Where there is demand, there is supply!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/zac.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/zac.jpg"
        },
        {
            name: "Marcus Ng Wen Jian",
            position: "Deputy Director of Academic Liaison",
            wingid: 2,
            wingrank: 2,
            cellrank: 1,
            course: "Computer Science",
            year: 1,
            description: "Hello! Quiet as I may seem, but I am actually friendly as can be. Feel free to give us feedback on the changes you wish to see in SoC with regards to academics. We hope to support you in many different ways. Words speak purpose, but action transcend it. We shall do it!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/marcus.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/marcus.jpg"
        },
        {
            name: "Jayden Shen",
            position: "Director of Sports",
            wingid: 2,
            wingrank: 3,
            cellrank: 0,
            course: "Computer Science",
            year: 3,
            description: "Sports is always been an important part of my university life. I love every aspect of sports, be it the competitiveness or the bonding that sports could bring to the table.
	If anyone would like to discuss sports events or play sports, just approach me, I am more than willing to!
	At the end of the day I hope that I could achieve/see
	1) a proactive sports culture in SoC
	2) and most importantly, the joy and laughter from SoCians via playing sports!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/jayden.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/jayden.jpg"
        },
        {
            name: "Wong Kang Min",
            position: "Deputy Director of Sports",
            wingid: 2,
            wingrank: 3,
            cellrank: 1,
            course: "Computer Science",
            year: 2,
            description: "Hi there! My name is Kang Min! Playing sports is my passion, as it is a great way to keep myself fit, and to destress. I hope to help the sports cell in spreading the passion for sports to the whole of the SoC community! Let's create a healthy SoC lifestyle together!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/kangmin.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/kangmin.jpg"
        },
        ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
        {
            name: "Koh Zheng Kang, Andrew",
            position: "Vice President (External Relations)",
            wingid: 3,
            wingrank: 0,
            cellrank: 0,
            course: "Computer Science",
            year: 4,
            description: "Hallo hallo! Andrew here. If you're reading this page I assume that you are looking for a point of contact. You can drop us an email at connect(at)nuscomputing.com for all matters, or if you're specifically looking for me, vp.extrel(at)nuscomputing.com is my email!

	Oh I happen to be Vice President for External Relations for this academic year, and I look forward to solving problems for peers around me.",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/kzk.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/kzk.jpg"
        },
        {
            name: "Lim Hui Qi",
            position: "Director of Marketing",
            wingid: 3,
            wingrank: 1,
            cellrank: 0,
            course: "Computer Science",
            year: 1,
            description: "Hello! I'm Hui Qi, also known as the SoC Cat from RaG 2015~
	Feel free to approach me via any platforms about anything as I won't bite you muahaha!
	As the Marketing Director, I hope to get as much benefits for the student body as possible, and that includes you, who is reading this!
	Don't be shy and just say hello!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/huiqi.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/huiqi.jpg"
        },
        {
            name: "Chase Tiong YaoCong",
            position: "Deputy Director of Marketing",
            wingid: 3,
            wingrank: 1,
            cellrank: 1,
            course: "Computer Science",
            year: 1,
            description: "Hello, I'm Chase but I won't be chasing you around~~ . Even though, I may look fierce sometimes but I am actually not. Feel free to approach me for for a random chat or if you would like to know more about Marketing Committee or sponsors for the various events happening in SoC.",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/chase.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/chase.jpg"
        },
        {
            name: "Juliana Seng",
            position: "Director of Publicity",
            wingid: 3,
            wingrank: 2,
            cellrank: 0,
            course: "Information Security",
            year: 2,
            description: "Hello there, I'm Juliana and I like chicken nuggets! I want to increase the outreach to all of you kawaii SoC students, encourage involvement and spread happiness through our club events! I also hope to level up the design skillz of SoC students and our club members! Remember to like our Facebook page and follow us on Instagram for rainbows and magic! :3",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/juliana.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/juliana.jpg"
        },
        {
            name: "Tan Wee Chen, William",
            position: "Deputy Director of Publicity",
            wingid: 3,
            wingrank: 2,
            cellrank: 1,
            course: "Computer Science",
            year: 2,
            description: "Hello everyone, William here! This year will be a very exciting year as the 18th MC has many interesting events planned for SoC. I want to let the whole world know about all the fun we will have and how cool it is to be part of SoC Family! Don't be shy when you see me or our talented SoC photographers pointing our cameras at you and give us your biggest smile!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/william.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/william.jpg"
        },
        {
            name: "Jia Lin",
            position: "Director of Alumni Relations",
            wingid: 3,
            wingrank: 3,
            cellrank: 0,
            course: "Computer Science",
            year: 2,
            description: "Hi I'm Jia Lin, your AR director aka minion! I seek to provide exciting opportunities for us to connect with the alumni as well as to enrich our time spent in SoC. If you have any suggestions, or want to know more about what Alumni Relations cell is up to, feel free to facebook message / talk to me anytime! I look fierce but people just label me as weird/FUNNY/UNGLAM, so there you go~",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/jialin.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/jialin.jpg"
        },
        {
            name: "Md Ashmawi Bin Md Jailani",
            position: "Deputy Director of Alumni Relations",
            wingid: 3,
            wingrank: 3,
            cellrank: 1,
            course: "Computer Science",
            year: 3,
            description: "Hi guys, Ash here. Maybe you've seen me around school, maybe you've seen Ashraf instead. Regardless, we're both friendly people hahaha, so feel free to just say hi! As Deputy Director of Alumni Relations, I hope to be able to provide opportunities for alumni and undergraduates to interact and learn more from each other! So if you guys have any suggestions, feedbacks or comments, pls do feel free to tell me! Hahaha",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/ash.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/ash.jpg"
        },
        ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
        {
            name: "Ng Zi Kai",
            position: "Vice President (Operations & Projects)",
            wingid: 4,
            wingrank: 0,
            cellrank: 0,
            course: "Information Security",
            year: 2,
            description: "Hello everyone! I'm Zi Kai! Thank you for giving me this opportunity to serve the SoC community as VP(Ops)!

	Together with my wing, we aim to bring about new and exciting projects to enhance your experience as a student in SoC!

	Meanwhile, if you have any comments/suggestion, feel free to contact me at vp.ops(at)nuscomputing.com!

	Stay tuned! :)",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/zikai.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/zikai.jpg"
        },
        {
            name: "Sng Yong Jie, Dylan",
            position: "Director of Logistics",
            wingid: 4,
            wingrank: 1,
            cellrank: 0,
            course: "Computer Science",
            year: 1,
            description: "Hey, If you don't know how to de-stress, I suggest you to head to the The Deck (Arts Canteen) to have some Laksa ASAP!
	Also, if you ever feel conflicted when making a decision, just think about how short life is and YOLO!
	P.S. We have loads of games inside the clubroom available for you! :)
	- Your friendly Sai Kang Warrior",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/dylan.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/dylan.jpg"
        },
        {
            name: "Chen Rui Wen",
            position: "Deputy Director of Logistics",
            wingid: 4,
            wingrank: 1,
            cellrank: 1,
            course: "Computer Science",
            year: 1,
            description: "Yohoo!! I am Rui Wen, deputy director of logistics. Feel free to approach me if you need anything from the store. I am also the one allocating lockers to SoC students, so if you need lockers, come bribe me with food ^^, joking la, for all SoC students, you may email me at dy.logistics(at)nuscomputing.com to use a locker for free!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/ruiwen.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/ruiwen.jpg"
        },
        {
            name: "Low Wei Kit",
            position: "Director of Freshmen Orientation Projects",
            wingid: 4,
            wingrank: 2,
            cellrank: 0,
            course: "Computer Science",
            year: 2,
            description: "Hello everyone! University is not only an institute to learn, but also a second home where you have friends who take care of one another like their family. I hope that through the orientation programme, Freshmen will feel welcomed into the SoC family and make long-lasting friendships with their peers in the course!

	If you have any suggestions to help us improve the orientation experience for the Freshmen next year, feel free to drop us an email at fop(at)nuscomputing.com!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/weikit.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/weikit.jpg"
        },
        {
            name: "Te(Ting) Sze Ying",
            position: "Deputy Director of Freshmen Orientation Projects",
            wingid: 4,
            wingrank: 2,
            cellrank: 1,
            course: "Computer Science",
            year: 2,
            description: "Hello! I'm Sze Ying! As your FOP Deputy Director, I will be working with the FOP Director, Wei Kit, to make FOP 2016 an unforgettable experience for the freshmen and the seniors involved. If you want to join us in shaping the FOP 2016 experience, and get to know me better, feel free to approach me or Wei Kit! :)",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/szeying.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/szeying.jpg"
        },
        {
            name: "Nicholas Lum Aik Yong",
            position: "Director of Information Technology",
            wingid: 4,
            wingrank: 3,
            cellrank: 0,
            course: "Computer Science",
            year: 3,
            description: "Never have I taken on such an exciting role before. Going to school has always been a chore, but not now! To be able to exercise my passion for tech and also contribute to Computing Club is really pretty cool. Give me a call if you want to chat with a geek like yourself. You will be entertained, I bet! Up until you notice the first word of each sentence...",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/nicholas.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/nicholas.jpg"
        },
        {
            name: "Kenneth Ho Chee Chong",
            position: "Deputy Director of Information Technology",
            wingid: 4,
            wingrank: 3,
            cellrank: 1,
            course: "Computer Science",
            year: 2,
            description: "Hello I'm Kenneth. I'm glad to have this opportunity to serve as the Deputy Director of IT. Together with the Director of IT and our team, we seek to improve IT related matters of the Computing Club. If you have any suggestions, or wish to know more about the IT cell, feel free to contact Nicholas or me anytime!",
            casualimg: "http://cdn.nuscomputing.com/mc/casual/kenneth.jpg",
            formalimg: "http://cdn.nuscomputing.com/mc/formal/kenneth.jpg"
        }
    ]
);