@archive lans_room
@size 5

script 0 mmbn6 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"Lan,read your mail!"
	keyWait
		any = false
	end
}

script 1 mmbn6 {
  flagSet
		flag = 0x130F
  end
}

script 2 mmbn6 {
  end
}

script 3 mmbn6 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	We did it!
	"""
	keyWait
		any = false
	clearMsg
	"""
	Nice work,
	Lan!
	"""
	keyWait
		any = false
	flagClear
		flag = 0x130F
	end
}

script 4 mmbn6 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	Dang it...
	"""
	keyWait
		any = false
	clearMsg
	"""
	Let's try harder
	next time,OK,Lan?!
	"""
	keyWait
		any = false
	flagClear
		flag = 0x130F
	end
}