ui_print " "
ui_print " "
ui_print "   Install RoundyUI, RectangUI?"
ui_print " "
ui_print "   Vol+ = yes, Vol- = no"
if $VKSEL; then
	ui_print " "
	ui_print " "
	ui_print "   RoundyUI or RectangUI?"
	ui_print " "
	ui_print "   Vol+ = RoundyUI, Vol- = RectangUI"
	RUI=true
	if $VKSEL; then
		ui_print " "
		ui_print " "
		ui_print "   Pick radius"
		ui_print " "
		ui_print "   Vol+ = 20dp, Vol- = 32dp"
		ROUI=true
		REUI=false
		if $VKSEL; then
			ui_print " "
			ui_print " "
			ui_print "   You choosed RoundyUI 20dp"
			ui_print "-------------------------------"
			ROUI20=true
			ROUI32=false
		else
			ui_print " "
			ui_print " "
			ui_print "   You choosed RoundyUI 32dp"
			ui_print "-------------------------------"
			ROUI20=false
			ROUI32=true
		fi
	else
		ui_print " "
		ui_print " "
		ui_print "   You choosed RectangUI"
		ui_print "---------------------------"
		ROUI=false
		REUI=true
	fi
else
	ui_print " "
	ui_print " "
	ui_print "   OK, but choose Tzuyu <3"
	ui_print "-----------------------------"
	RUI=false
fi

ui_print " "
ui_print " "
ui_print "   Install Status Bar Height (notch)?"
ui_print " "
ui_print "   Vol+ = yes, Vol- = no"
if $VKSEL; then
	ui_print " "
	ui_print " "
	ui_print "   Size list:"
	ui_print " - 30dp (Comfort looking)"
	ui_print " - 40dp (Match your lockscreen statusbar)"
	ui_print " - 48dp (Same height as your navbar)"
	ui_print " "
	ui_print " "
	ui_print "   Read above then pick height:"
	ui_print " "
	ui_print "   Vol+ = 30dp, Vol- = other sizes"
	SBH=true
	if $VKSEL; then
		ui_print " "
		ui_print " "
		ui_print "   You choosed Statusbar 30dp"
		ui_print "--------------------------------"
		SBH30=true
		SBH40=false
		SBH48=false
	else
		ui_print "   Pick remaining height:"
		ui_print " "
		ui_print "   Vol+ = 40dp, Vol- = 48dp"
		SBH30=false
		if $VKSEL; then
			ui_print " "
			ui_print " "
			ui_print "   You choosed Statusbar 40dp"
			ui_print "--------------------------------"
			SBH40=true
			SBH48=false
		else
			ui_print " "
			ui_print " "
			ui_print "   You choosed Statusbar 48dp"
			ui_print "--------------------------------"
			SBH40=false
			SBH48=true
		fi
	fi
else
	ui_print " "
	ui_print " "
	ui_print "   OK, but choose Tzuyu <3"
	ui_print "-----------------------------"
	SBH=false
fi

ui_print " "
ui_print " "
ui_print "-  Installing  -"

mkdir -p $TMPDIR/system/vendor/overlay
if $RUI; then
	if $ROUI; then
		if $ROUI20; then
			cp -f $TMPDIR/apk/RoundyUI20.apk $TMPDIR/system/vendor/overlay
		else
			cp -f $TMPDIR/apk/RoundyUI32.apk $TMPDIR/system/vendor/overlay
		fi
	else
		cp -f $TMPDIR/apk/RoundyUI2.apk $TMPDIR/system/vendor/overlay
	fi
fi

if $SBH; then
	if $SBH30; then
		cp -f $TMPDIR/apk/StatusBarHeight30.apk $TMPDIR/system/vendor/overlay
	elif $SBH40; then
		cp -f $TMPDIR/apk/StatusBarHeight40.apk $TMPDIR/system/vendor/overlay
	else
		cp -f $TMPDIR/apk/StatusBarHeight48.apk $TMPDIR/system/vendor/overlay
	fi
fi

rm $TMPDIR/system/vendor/overlay/placeholder

ui_print " "
ui_print " "
ui_print "  Done."
