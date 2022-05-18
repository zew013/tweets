	clear

    set more off
    capture log close
	cd
    cd "Desktop/Lumnus/Big/"
    log using shall.log, replace
    import excel "Stata reg.xlsx", firstrow clear
	describe
	tab Weekday, gen(Weekdaydummy)
	tab timeinteval, gen(timedummy)
	
	
	tab Gender, gen(Genderdummy)
	
	gen log_reach = log(Reach)
	reg log_reach length Sentiment Weekdaydummy* timedummy* Genderdummy*
	
	*** might be wrong in the future
	
	
	*reg Likes Sentiment Weekdaydummy* timedummy* Genderdummy*
	*avplot timedummy1
	rename timedummy1 Afternoon
	rename timedummy7 Noon
	rename (timedummy2) (Early_morning)
	rename (timedummy3) (Early_night)
	rename timedummy4 Evening
	rename (timedummy5) (Late_morning)
	rename (timedummy6) (Late_night)
