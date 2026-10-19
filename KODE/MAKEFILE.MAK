##################################################################
# MORTAL KOMBAT III MAKEFILE
#
# (C) WILLIAMS ENTERTAINMENT, 1994
#
# BY: DAVID SCHWARTZ
##################################################################

#
# MACROS
#

DEBUG = -g
#DEBUG =
#OPTIMIZE = -O0
OPTIMIZE = -O2
#WIMP = -Wimplicit
WIMP =

ORGADDR = $80010000

CC = ccpsx -comments-c++ $(WIMP) -Wreturn-type -c  $(OPTIMIZE) $(DEBUG) $&.c -o $*.o
ASM = asmpsx /l $&,$*.o
DASM = asmpsx /l /zd $&,$*.o
PALCVT = palcvt palsrc\$&.mas


SBST = obj\bkgdsbst.o obj\mksbst.o
TEMPLE = obj\bkgdtemp.o obj\mktemp.o
BRIDGE = obj\bkgdbrig.o obj\mkbrig.o
#BALCONY = obj\bkgdbalc.o obj\mkbalc.o
BELL = obj\bkgdbell.o obj\mkbell.o
GRAVE = obj\bkgdgrav.o obj\mkgrav.o
SOUL = obj\bkgdsoul.o obj\mksoul.o
PIT  = obj\bkgdpit.o obj\mkpit.o
MOCKPIT  = obj\bkgdmock.o obj\mkmock.o
#BANK = obj\bkgdbank.o obj\mkbank.o
CITY = obj\bkgdcity.o obj\mkcity.o
PORTAL = obj\bkgdport.o obj\mkportal.o
SKEND = obj\bkgdsken.o obj\mkskend.o

BIO = obj\mkbiodt.o

ENDING = obj\mkenddt.o

ATTRACT =	obj\mkpsel.o obj\mkverse.o obj\mkhscore.o \
		obj\mkbuydt.o obj\mkcoin.o obj\mktitle.o obj\mkdteam.o \
		obj\mkoption.o obj\mkselvic.o obj\mkgrad.o \
		obj\mkstry2.o obj\mkstry3.o obj\mkknstry.o obj\mkszstry.o obj\mklkstry.o

MISC = obj\mkcontro.o obj\mkfight.o obj\mktextdt.o obj\mkfont.o obj\mkbloodt.o \
	obj\mkoptp.o obj\loading.o obj\mkmarkdt.o
#obj\mkanimdt.o
#obj\mkfatald.o
#obj\mkfriedt.o

PALETTE = obj\mkpalrgb.o obj\mkpalnts.o

CHARS = obj\mkexplod.o obj\mknames.o

OPTIONS = $(PALETTE) obj\mkoption.o
FIGHT = $(PALETTE) obj\mkfight.o
EXPLODE = $(PALETTE) obj\mkexplode.o

OBJS = 	obj\moves.o obj\mkutil.o obj\mkos.o obj\mksony.o obj\mkobj.o obj\mkinit.o \
	obj\mkmain.o obj\mkamode.o obj\mkbkgd.o obj\mkglobal.o obj\mkpal.o \
	obj\context.o obj\mkbt.o obj\mksel.o obj\mkjoy.o obj\mkguys.o obj\mkdrone.o \
	obj\mkstk.o obj\mkreact.o obj\mkfx.o obj\mkrepell.o \
	obj\mkslam.o obj\mkblood.o obj\mkani.o obj\mkprop.o obj\mkstat.o obj\mkzap.o obj\mkcombo.o obj\mkbug.o \
	obj\mkcanned.o obj\mkbonus.o  obj\mkscore.o obj\mksound.o obj\mkbuyin.o \
	obj\mkscombo.o 	obj\valloc.o obj\mktext.o obj\mkfatal.o obj\mkfade.o obj\mkr1.o \
	obj\mkladder.o obj\mkfile.o obj\mkbio.o obj\mkboss.o obj\mkvs.o \
	obj\heaparea.o obj\mkopt.o obj\psxsnd.o obj\psxcd.o obj\loadaddr.o obj\snmain.o \
	obj\mkanimal.o obj\mkfriend.o obj\mkend.o obj\mkmark.o obj\mkhstd.o


#
# LINK
#
all:	mk3.cpe	\
		bkgds\artsbst.bin bkgds\arttemp.bin bkgds\artbrig.bin \
		bkgds\artbell.bin bkgds\artgrav.bin bkgds\artsoul.bin bkgds\artpit.bin bkgds\artporta.bin \
		bkgds\artcity.bin bkgds\controlp.bin bkgds\font.bin bkgds\loading.bin bkgds\artmock.bin\
		attract\artbuyin.bin attract\artpsel.bin vs\artverse.bin \
		attract\artcoin.bin attract\arttitle.bin bkgds\artskend.bin \
		attract\artstry2.bin attract\artstry3.bin attract\artstryl.bin attract\artstrys.bin attract\artstryk.bin \
		attract\artopt.bin attract\opttext.bin attract\arthscor.bin \
		palette\mkpalrgb.bin palette\mkpalnts.bin $(CHARS)

#
# MAIN EXECUTABLE
#
mk3.cpe: mk3.lnk $(OBJS) $(PALETTE) $(MISC) $(ATTRACT) \
		$(SBST) $(TEMPLE)	\
		$(BRIDGE) $(CHARS)\
		$(BELL) $(GRAVE) \
		$(SOUL) $(PIT) $(MOCKPIT) $(PORTAL) $(SKEND) \
		$(CITY) $(BIO) $(ENDING)
   psylink /b /m /g /c /q /o$(ORGADDR) @mk3.lnk,mk3.cpe,mk3.sym,mk3.map

##############################################################################
# Bios
##############################################################################
#
# BIO DATA
#
obj\mkbiodt.o: mkbiodt.s mkbkgd.inc \
	..\attract\bio\subzero\subbio.mod ..\attract\bio\subzero\subbio.ctp palsrc\biosz.mas \
	..\attract\bio\kano\kanobio.mod ..\attract\bio\kano\kanobio.ctp palsrc\biokano.mas \
	..\attract\bio\sonya\sonyabio.mod ..\attract\bio\sonya\sonyabio.ctp palsrc\biosonya.mas \
	..\attract\bio\lkang\kangbio.mod ..\attract\bio\lkang\kangbio.ctp palsrc\biolkang.mas \
	..\attract\bio\shang\shangbio.mod ..\attract\bio\shang\shangbio.ctp palsrc\bioshang.mas \
	..\attract\bio\femgoro\shevabio.mod ..\attract\bio\femgoro\shevabio.ctp palsrc\biosg.mas  \
	..\attract\bio\swat\copbio.mod ..\attract\bio\swat\copbio.ctp palsrc\bioswat.mas \
	..\attract\bio\lia\sinbio.mod ..\attract\bio\lia\sinbio.ctp palsrc\biolia.mas \
	..\attract\bio\robo1\sekbio.mod ..\attract\bio\robo1\sekbio.ctp palsrc\biorobo1.mas \
	..\attract\bio\robo2\cyraxbio.mod ..\attract\bio\robo2\cyraxbio.ctp palsrc\biorobo2.mas \
	..\attract\bio\lao\kungbio.mod ..\attract\bio\lao\kungbio.ctp palsrc\biolao.mas \
	..\attract\bio\tusk\kabbio.mod ..\attract\bio\tusk\kabbio.ctp palsrc\biotusk.mas \
	..\attract\bio\indian\indibio.mod ..\attract\bio\indian\indibio.ctp palsrc\bioind.mas \
	..\attract\bio\jax\jaxbio.mod ..\attract\bio\jax\jaxbio.ctp palsrc\biojax.mas
	$(ASM)

#
# GRADIENT (NOT BIOS BUT USED ABOUT THE SAME)
#
obj\mkgrad.o: mkgrad.s mkbkgd.inc ..\attract\gradient\gradient.mod ..\attract\gradient\gradient.ctp \
	palsrc\gradient.mas
	$(ASM)

##############################################################################
# Endings
##############################################################################
#
# All characters
#
obj\mkenddt.o: mkenddt.s mkbkgd.inc \
	palsrc\endkano.mas ..\attract\end\kano\kanoend.mod ..\attract\end\kano\kanoend.ctp \
	palsrc\endsonya.mas ..\attract\end\sonya\sonyaend.mod ..\attract\end\sonya\sonyaend.ctp \
	palsrc\endjax.mas ..\attract\end\jax\jaxend.mod ..\attract\end\jax\jaxend.ctp \
	palsrc\endindy.mas ..\attract\end\indian\indyend.mod ..\attract\end\indian\indyend.ctp \
	palsrc\endszero.mas ..\attract\end\subzero\subend.mod ..\attract\end\subzero\subend.ctp \
	palsrc\endswat.mas ..\attract\end\stryker\copend.mod ..\attract\end\stryker\copend.ctp \
	palsrc\endlia.mas ..\attract\end\sindel\sinend.mod ..\attract\end\sindel\sinend.ctp \
	palsrc\endrobo1.mas ..\attract\end\sektor\sekend.mod ..\attract\end\sektor\sekend.ctp \
	palsrc\endrobo2.mas ..\attract\end\cyrax\cyraxend.mod ..\attract\end\cyrax\cyraxend.ctp \
	palsrc\endlao.mas ..\attract\end\kung\kungend.mod ..\attract\end\kung\kungend.ctp \
	palsrc\endtusk.mas ..\attract\end\kabal\kabalend.mod ..\attract\end\kabal\kabalend.ctp \
	palsrc\endsg.mas ..\attract\end\sheeva\shevaend.mod ..\attract\end\sheeva\shevaend.ctp \
	palsrc\endshang.mas ..\attract\end\shang\shangend.mod ..\attract\end\shang\shangend.ctp \
	palsrc\endlkang.mas ..\attract\end\kang\kangend.mod ..\attract\end\kang\kangend.ctp \
	palsrc\endsmoke.mas ..\attract\end\smoke\smokeend.mod ..\attract\end\smoke\smokeend.ctp \
	palsrc\endgods.mas ..\attract\gods\gods.mod ..\attract\gods\gods.ctp
	$(ASM)

############################################################################
# Chars
############################################################################
#
# EXPLOSIONS
#
obj\mkexplod.o: mkexplod.s ..\chars\explode\mkexp.psx ..\chars\explode\mkexp.psi
	$(ASM)

#
# NAMES FOR CONTROL PANEL
#
obj\mknames.o: mknames.s ..\attract\misc\mkbgname.psi
	$(ASM)

############################################################################
# Bkgd
############################################################################

###################################
# SUBWAY/STREET BKGD
###################################
obj\mksbst.o: mksbst.s mkchar.inc mkbkgd.inc palsrc\sbstpal.mas \
		  ..\bkgd\subway\mksubway.mod ..\bkgd\floors\subway\subflor.asm \
		  ..\bkgd\street\mkstreet.mod ..\bkgd\floors\street\street.asm
	$(ASM)

obj\artsbst.o: artsbst.s mkchar.inc mkbkgd.inc ..\bkgd\subway\multi.ctp
	$(ASM)

obj\bkgdsbst.o: bkgdsbst.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h mkreact.h mkguys.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl0 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artsbst.bin: obj\artsbst.o
	psylink /c /m /q /o$(ORGADDR) @sbst.lnk,bkgds\bgtemp,,bkgds\sbst.map

###################################
# SOUL BKGD
###################################
obj\mksoul.o: mksoul.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\soul\mksoul.mod ..\bkgd\floors\soul\soflor.asm palsrc\soulpal.mas \
		  ..\bkgd\balcony2\mkbalc2.mod ..\bkgd\floors\balcony2\balcflr.asm
	$(ASM)

obj\artsoul.o: artsoul.s mkchar.inc mkbkgd.inc ..\bkgd\soul\multi.ctp
	$(ASM)

obj\bkgdsoul.o: bkgdsoul.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl5 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artsoul.bin: obj\artsoul.o
	psylink /c /m /q /o$(ORGADDR) @soul.lnk,bkgds\bgtemp,,bkgds\soul.map

###################################
# PIT BKGD
###################################
obj\mkpit.o: mkpit.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\throne\mkthrone.mod palsrc\pitpal.mas \
		  ..\bkgd\bgani\pit\pitfatal.psi \
		  ..\bkgd\bgani\pit\wall80.psi \
		  ..\chars\blood\mkguts.psi
	$(ASM)

obj\artpit.o: artpit.s mkchar.inc mkbkgd.inc ..\bkgd\throne\multi.ctp
	$(ASM)

obj\bkgdpit.o: bkgdpit.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h mkreact.h mkguys.h moves.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl9 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artpit.bin:  obj\artpit.o
	psylink /c /m /q /o$(ORGADDR) @pit.lnk,bkgds\bgtemp,,bkgds\pit.map

###################################
# MOCK BKGD
###################################
obj\mkmock.o: mkmock.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\mockpit\mockpit.mod palsrc\mockpal.mas
	$(ASM)

obj\artmock.o: artmock.s mkchar.inc mkbkgd.inc ..\bkgd\mockpit\mockpit.ctp
	$(ASM)

obj\bkgdmock.o: bkgdmock.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl26 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artmock.bin:  obj\artmock.o
	psylink /c /m /q /o$(ORGADDR) @mock.lnk,bkgds\bgtemp,,bkgds\mock.map

###################################
# PORTAL BKGD
###################################
obj\mkportal.o: mkportal.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\hidden\mkhidden.mod
	$(ASM)

obj\artporta.o: artporta.s mkchar.inc mkbkgd.inc ..\bkgd\hidden\multi.ctp
	$(ASM)

obj\bkgdport.o: bkgdport.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl22 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artporta.bin:  obj\artporta.o
	psylink /c /m /q /o$(ORGADDR) @portal.lnk,bkgds\bgtemp,,bkgds\portal.map

###################################
# SKEND BKGD
###################################
obj\mkskend.o: mkskend.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\shao\mkshao1.mod \
		  ..\bkgd\shao\shaodie.mod
	$(ASM)

obj\artskend.o: artskend.s mkchar.inc mkbkgd.inc ..\bkgd\shao\multi.ctp
	$(ASM)

obj\bkgdsken.o: bkgdsken.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl24 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artskend.bin:  obj\artskend.o
	psylink /c /m /q /o$(ORGADDR) @skend.lnk,bkgds\bgtemp,,bkgds\skend.map


###################################
# BRIDGE BKGD
###################################
obj\mkbrig.o: mkbrig.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\bridge\bridge.mod ..\bkgd\floors\bridge\brgroad.asm palsrc\brigpal.mas
	$(ASM)

obj\artbrig.o: artbrig.s mkchar.inc mkbkgd.inc ..\bkgd\bridge\multi.ctp
	$(ASM)

obj\bkgdbrig.o: bkgdbrig.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl4 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artbrig.bin: obj\artbrig.o
	psylink /c /m /q /o$(ORGADDR) @brig.lnk,bkgds\bgtemp,,bkgds\brig.map

###################################
# TEMPLE BKGD
###################################
obj\mktemp.o: mktemp.s mkchar.inc mkbkgd.inc \
		..\bkgd\temple\mktemple.mod ..\bkgd\floors\temple\tempfl.asm palsrc\temppal.mas
	$(ASM)

obj\arttemp.o: arttemp.s mkchar.inc mkbkgd.inc ..\bkgd\temple\multi.ctp
	$(ASM)

obj\bkgdtemp.o: bkgdtemp.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl7 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\arttemp.bin: obj\arttemp.o
	psylink /c /m /q /o$(ORGADDR) @temp.lnk,bkgds\bgtemp,,bkgds\temp.map

###################################
# GRAVE YARD BKGD
###################################
obj\mkgrav.o: mkgrav.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\grave\mkgrave.mod ..\bkgd\floors\grave\cemflr.asm palsrc\gravpal.mas
	$(ASM)

obj\artgrav.o: artgrav.s mkchar.inc mkbkgd.inc ..\bkgd\grave\multi.ctp
	$(ASM)

obj\bkgdgrav.o: bkgdgrav.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h mk3snd.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl8 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artgrav.bin: obj\artgrav.o
	psylink /c /m /q /o$(ORGADDR) @grav.lnk,bkgds\bgtemp,,bkgds\grav.map

###################################
# BELL BKGD
###################################
obj\mkbell.o: mkbell.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\bell\mkbell.mod ..\bkgd\floors\bell\bellflor.asm palsrc\bellpal.mas \
		  ..\bkgd\bell\mkbell2.mod
	$(ASM)

obj\artbell.o: artbell.s mkchar.inc mkbkgd.inc ..\bkgd\bell\multi.ctp
	$(ASM)

obj\bkgdbell.o: bkgdbell.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h  mk3snd.h mkreact.h mkguys.h mkfatal.h mkblood.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl6 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artbell.bin: obj\artbell.o
	psylink /c /m /q /o$(ORGADDR) @bell.lnk,bkgds\bgtemp,,bkgds\bell.map

###################################
# CITY BKGD
###################################
obj\mkcity.o: mkcity.s mkchar.inc mkbkgd.inc \
	palsrc\citypal.mas ..\bkgd\city\mkcity.mod ..\bkgd\floors\city\ruuf.asm ..\bkgd\bank\mkbank80.mod
	$(ASM)

obj\artcity.o: artcity.s mkchar.inc mkbkgd.inc ..\bkgd\city\multi.ctp
	$(ASM)

obj\bkgdcity.o: bkgdcity.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
		mkutil.h mkfx.h valloc.h mksound.h  mk3snd.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl2 $(OPTIMIZE) $&.c -o obj\$&.o

bkgds\artcity.bin: obj\artcity.o
	psylink /c /m /q /o$(ORGADDR) @city.lnk,bkgds\bgtemp,,bkgds\city.map

###################################
# BALCONY BKGD
###################################
#obj\mkbalc.o: mkbalc.s mkchar.inc mkbkgd.inc \
#		  ..\bkgd\balcony2\mkbalc2.mod ..\bkgd\floors\balcony2\balcflr.asm palsrc\balcpal.mas
#	$(ASM)
#
#obj\artbalc.o: artbalc.s mkchar.inc mkbkgd.inc ..\bkgd\soul\multi.ctp
#	$(ASM)
#
#obj\bkgdbalc.o: bkgdbalc.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
#		mkutil.h mkfx.h valloc.h mksound.h  mk3snd.h
#		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl3 $(OPTIMIZE) $&.c -o obj\$&.o
#
#bkgds\artbalc.bin: obj\artbalc.o
#	psylink /c /m /q /o$(ORGADDR) @balc.lnk,bkgds\bgtemp,,bkgds\balc.map

###################################
# BANK BKGD
###################################
#obj\mkbank.o: mkbank.s mkchar.inc mkbkgd.inc \
#	..\bkgd\floors\city\ruuf.asm ..\bkgd\bank\mkbank80.mod palsrc\bankpal.mas
#	$(ASM)
#
#obj\artbank.o: artbank.s mkchar.inc mkbkgd.inc
#	$(ASM)
#
#obj\bkgdbank.o: bkgdbank.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h \
#		mkutil.h mkfx.h valloc.h mksound.h  mk3snd.h
#		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl1 $(OPTIMIZE) $&.c -o obj\$&.o
#
#bkgds\artbank.bin: obj\artbank.o
#	psylink /c /m /q /o$(ORGADDR) @bank.lnk,bkgds\bgtemp,,bkgds\bank.map

############################################################################
# Palettes
############################################################################

#obj\mkpalrgb.o: mkpalrgb.s mkpalrpt.inc palsrc\imgpal.rgb palsrc\mkbkpal.rgb
#	$(ASM)

obj\mkpalnts.o: mkpalnts.s mkpalrpt.inc palsrc\imgpal.nts palsrc\mkbkpal.nts
	$(ASM)

obj\mkpalrgb.o: obj\mkpalnts.o
	copy obj\mkpalnts.o obj\mkpalrgb.o

#palsrc\imgpal.rgb: palsrc\imgpal.mas
#	copy palsrc\$&.mas palsrc\$&.rgb

#palsrc\imgpal.nts: palsrc\imgpal.mas
#	$(PALCVT)

#palsrc\mkbkpal.rgb: palsrc\mkbkpal.mas
#	copy palsrc\$&.mas palsrc\$&.rgb

#palsrc\mkbkpal.nts: palsrc\mkbkpal.mas
#	$(PALCVT)

palette\mkpalrgb.bin: obj\mkpalrgb.o rgb.lnk
	psylink /c /m /q /o$(ORGADDR) @rgb.lnk,palette\bgtemp,,palette\rgb.map

palette\mkpalnts.bin: obj\mkpalnts.o ntsc.lnk
	psylink /c /m /q /o$(ORGADDR) @ntsc.lnk,palette\bgtemp,,palette\nts.map

############################################################################
# Attract
############################################################################

#
# Options Screens
#
obj\mkoption.o: mkoption.s ..\attract\options\mk33dlog.psi \
		palsrc\option.mas ..\attract\options\logobg.mod ..\attract\options\mk3coin.mod
	$(ASM)

obj\artopt.o: artopt.s mkchar.inc mkbkgd.inc ..\attract\options\multi.ctp
	$(ASM)

obj\mkoptp.o: mkoptp.s mkchar.inc mkbkgd.inc \
		  ..\attract\options\optextbg.asm
	$(ASM)

attract\artopt.bin: obj\artopt.o
	psylink /c /m /q /o$(ORGADDR) @opt.lnk,attract\bgtemp,,attract\opt.map

attract\opttext.bin: obj\mkoptp.o
	psylink /c /m /q /o$(ORGADDR) @opttext.lnk,attract\bgtemp,,attract\opttext.map

#
# Buyin Screens
#
obj\mkbuydt.o: mkbuydt.s mkchar.inc mkbkgd.inc \
		  ..\attract\buyin\mkbuyin.mod palsrc\buyinpal.mas
	$(ASM)

obj\artbuyin.o: artbuyin.s mkchar.inc mkbkgd.inc ..\attract\buyin\mkbuyin.ctp
	$(ASM)

attract\artbuyin.bin: obj\artbuyin.o
	psylink /c /m /q /o$(ORGADDR) @buyin.lnk,attract\bgtemp,,attract\buyin.map

#
# Player Select Screens
#
obj\mkpsel.o: mkpsel.s mkchar.inc mkbkgd.inc \
		  ..\attract\select\select80.mod palsrc\selpal.mas \
		  ..\attract\ladder\mkladder.mod palsrc\laddrpal.mas
	$(ASM)

obj\artpsel.o: artpsel.s mkchar.inc mkbkgd.inc ..\attract\select\multi.ctp
	$(ASM)

obj\mkselvic.o: mkselvic.s \
	..\chars\sonya\pselect\mksonyap.psx \
	..\chars\sonya\pselect\mksonyap.psi \
	..\chars\kano\pselect\mkkanop.psx \
	..\chars\kano\pselect\mkkanop.psi \
	..\chars\jax\pselect\mkjaxp.psx \
	..\chars\jax\pselect\mkjaxp.psi \
	..\chars\lia\pselect\mkliap.psx \
	..\chars\lia\pselect\mkliap.psi \
	..\chars\lkang\pselect\mklkp.psx \
	..\chars\lkang\pselect\mklkp.psi \
	..\chars\shang\pselect\mkstp.psx \
	..\chars\shang\pselect\mkstp.psi \
	..\chars\indian\pselect\mkindp.psx \
	..\chars\indian\pselect\mkindp.psi \
	..\chars\femgoro\pselect\mksgp.psx \
	..\chars\femgoro\pselect\mksgp.psi \
	..\chars\robo1\pselect\mkrobo1p.psx \
	..\chars\robo1\pselect\mkrobo1p.psi \
	..\chars\robo2\pselect\mkrobo2p.psx \
	..\chars\robo2\pselect\mkrobo2p.psi \
	..\chars\lao\pselect\mklaop.psx \
	..\chars\lao\pselect\mklaop.psi \
	..\chars\subzero\pselect\mkszp.psx \
	..\chars\subzero\pselect\mkszp.psi \
	..\chars\swat\pselect\mkswatp.psx \
	..\chars\swat\pselect\mkswatp.psi \
	..\chars\tusk\pselect\mktuskp.psx \
	..\chars\tusk\pselect\mktuskp.psi
	$(ASM)

attract\artpsel.bin: obj\artpsel.o
	psylink /c /m /q /o$(ORGADDR) @psel.lnk,attract\bgtemp,,attract\psel.map

#
# Ladder Screens
#
#obj\mkladdr.o: mkladdr.s mkchar.inc mkbkgd.inc \
#      ..\attract\vs\steelvs.mod
#	$(ASM)
#
#obj\artladdr.o: artladdr.s mkchar.inc mkbkgd.inc ..\attract\ladder\multi.ctp
#	$(ASM)
#
#attract\artladdr.bin: obj\artladdr.o
#	psylink /c /m /q /o$(ORGADDR) @laddr.lnk,attract\bgtemp,,attract\laddr.map
#
#
# High Score Screens
#
obj\mkhscore.o: mkhscore.s mkchar.inc mkbkgd.inc \
		  ..\attract\vs\steelvs.mod palsrc\mkvspal.mas
	$(ASM)

obj\arthscor.o: arthscor.s mkchar.inc mkbkgd.inc ..\attract\vs\steelvs.ctp
	$(ASM)

attract\arthscor.bin: obj\arthscor.o
	psylink /c /m /q /o$(ORGADDR) @hscore.lnk,attract\bgtemp,,attract\hscore.map


#
# VS Screens
#
obj\mkverse.o: mkverse.s mkchar.inc mkbkgd.inc palsrc\mkvspal.mas \
      ..\attract\vs\steelvs.mod ..\attract\vs\mkbgvs.psi \
	..\attract\vs\vskano.psi ..\attract\vs\vssonya.psi \
	..\attract\vs\vsjax.psi ..\attract\vs\vsindian.psi \
	..\attract\vs\vssz.psi ..\attract\vs\vsrobo3.psi \
	..\attract\vs\vsswat.psi ..\attract\vs\vslao.psi \
	..\attract\vs\vslia.psi ..\attract\vs\vstusk.psi \
	..\attract\vs\vsrobo1.psi ..\attract\vs\vslkang.psi \
	..\attract\vs\vsrobo2.psi ..\attract\vs\vsst.psi
	asmpsx /l $&,$*.o

obj\artverse.o: artverse.s mkchar.inc mkbkgd.inc ..\attract\vs\steelvs.ctp
	$(ASM)

vs\artverse.bin: obj\artverse.o
	psylink /c /m /q /o$(ORGADDR) @verse.lnk,vs\bgtemp,,vs\verse.map

#
# Coin Screens
#
obj\mkcoin.o: mkcoin.s mkchar.inc mkbkgd.inc \
		  ..\attract\coin\mk3coin.mod palsrc\coinpal.mas
	$(ASM)

obj\artcoin.o: artcoin.s mkchar.inc mkbkgd.inc ..\attract\coin\mk3coin.ctp
	$(ASM)

attract\artcoin.bin: obj\artcoin.o
	psylink /c /m /q /o$(ORGADDR) @coin.lnk,attract\bgtemp,,attract\coin.map

#
# Title Screens
#
obj\mktitle.o: mktitle.s mkchar.inc mkbkgd.inc \
		  ..\attract\title\raidfly.mod \
		  ..\attract\title\titlepg.mod  palsrc\titlepal.mas \
		  ..\attract\title\legal.mod
	$(ASM)

obj\arttitle.o: arttitle.s mkchar.inc mkbkgd.inc ..\attract\title\multi.ctp
	$(ASM)

attract\arttitle.bin: obj\arttitle.o
	psylink /c /m /q /o$(ORGADDR) @title.lnk,attract\bgtemp,,attract\title.map


#
# Story 2
#
obj\mkstry2.o: mkstry2.s mkchar.inc mkbkgd.inc \
		..\attract\story\story2\grnkahn.mod \
		..\attract\story\story2\lia.mod \
		..\attract\story\story2\earth.mod \
		palsrc\stry2pal.mas
	$(ASM)

obj\artstry2.o: artstry2.s mkchar.inc mkbkgd.inc ..\attract\story\story2\multi.ctp
	$(ASM)

attract\artstry2.bin: obj\artstry2.o
	psylink /c /m /q /o$(ORGADDR) @story2.lnk,attract\bgtemp,,attract\story2.map

#
# Story 3
#
obj\mkstry3.o: mkstry3.s mkchar.inc mkbkgd.inc \
		..\attract\story\story3\city.mod \
		..\attract\story\story3\souls.mod \
		..\attract\story\story3\heroes.mod \
		..\attract\story\story3\centaurs.mod \
		palsrc\stry3pal.mas
	$(ASM)

obj\artstry3.o: artstry3.s mkchar.inc mkbkgd.inc ..\attract\story\story3\multi.ctp
	$(ASM)

attract\artstry3.bin: obj\artstry3.o
	psylink /c /m /q /o$(ORGADDR) @story3.lnk,attract\bgtemp,,attract\story3.map


#
# Story Kano
#
obj\mkknstry.o: mkknstry.s mkchar.inc mkbkgd.inc \
		..\attract\story\kanostor\escape.mod \
		palsrc\strykpal.mas
	$(ASM)

obj\artstryk.o: artstryk.s mkchar.inc mkbkgd.inc ..\attract\story\kanostor\escape.ctp
	$(ASM)

attract\artstryk.bin: obj\artstryk.o
	psylink /c /m /q /o$(ORGADDR) @storyk.lnk,attract\bgtemp,,attract\storyk.map


#
# Story Subzero
#
obj\mkszstry.o: mkszstry.s mkchar.inc mkbkgd.inc \
		..\attract\story\szstory\subrobo.mod \
		palsrc\stryspal.mas
	$(ASM)

obj\artstrys.o: artstrys.s mkchar.inc mkbkgd.inc ..\attract\story\szstory\subrobo.ctp
	$(ASM)

attract\artstrys.bin: obj\artstrys.o
	psylink /c /m /q /o$(ORGADDR) @storys.lnk,attract\bgtemp,,attract\storys.map


#
# Story Liu Kang
#
obj\mklkstry.o: mklkstry.s mkchar.inc mkbkgd.inc \
		..\attract\story\lkstory\kangkung.mod \
		palsrc\strylpal.mas
	$(ASM)

obj\artstryl.o: artstryl.s mkchar.inc mkbkgd.inc ..\attract\story\lkstory\kangkung.ctp
	$(ASM)

attract\artstryl.bin: obj\artstryl.o
	psylink /c /m /q /o$(ORGADDR) @storyl.lnk,attract\bgtemp,,attract\storyl.map

#
# DREAM TEAM SHOTS
#
obj\mkdteam.o: mkdteam.s mkchar.inc mkbkgd.inc ..\attract\faces\mk3team.psi ..\attract\chicteam\mkteam.psi
	$(ASM)

############################################################################
# Misc
############################################################################

#
# CONTROL PANEL TPAGE
#
obj\mkcontro.o: mkcontro.s mkchar.inc mkbkgd.inc \
		  ..\attract\misc\tpages\cptpage.asm
	$(ASM)

bkgds\controlp.bin: obj\mkcontro.o
	psylink /c /m /q /o$(ORGADDR) @controlp.lnk,bkgds\bgtemp,,bkgds\controlp.map

#
# FONT TPAGE
#
obj\mkfont.o: mkfont.s mkchar.inc mkbkgd.inc \
		  ..\bkgd\font\mkfonts.asm
	$(ASM)

bkgds\font.bin: obj\mkfont.o
	psylink /c /m /q /o$(ORGADDR) @font.lnk,bkgds\bgtemp,,bkgds\font.map

obj\loading.o: loading.s mkchar.inc mkbkgd.inc \
		  ..\attract\loading\loading.asm
	$(ASM)

bkgds\loading.bin: obj\loading.o
	psylink /c /m /q /o$(ORGADDR) @loading.lnk,bkgds\bgtemp,,bkgds\loading.map


#
# OTHERS
#
obj\mktextdt.o: mktextdt.s mkchar.inc mkbkgd.inc
	$(ASM)

obj\mkfight.o: mkfight.s mkchar.inc \
	..\chars\intros\finher\mkbherf.psi \
	..\chars\intros\finhim\mkbhimf.psi \
	..\chars\intros\fight\mkbfghtf.psi \
	..\chars\intros\mercy\mercyf.psi
	$(ASM)

#obj\mkanimdt.o: mkanimdt.s mkchar.inc \
#	..\chars\animality\mkanimal.psx \
#	..\chars\animality\mkanimal.psi
#	$(ASM)

#obj\mkfatald.o: mkfatald.s mkchar.inc \
#	..\chars\fatality\mkfatal.psx \
#	..\chars\fatality\mkfatal.psi
#	$(DASM)

#obj\mkfriedt.o: mkfriedt.s mkchar.inc \
#	..\chars\friendsh\mkfriend.psx \
#	..\chars\friendsh\mkfriend.psi
#	$(ASM)

obj\mkmarkdt.o: mkmarkdt.s mkchar.inc \
	..\attract\arcade\arcade.psi
	$(ASM)

obj\mkbloodt.o: mkbloodt.s ..\chars\blood\mkblood.psx ..\chars\blood\mkblood.psi mkchar.inc \
						..\chars\blood\mkguts.psx
	$(ASM)

############################################################################
# OBJS
############################################################################
obj\context.o: context.s
	$(DASM)

obj\heaparea.o: heaparea.s
	asmpsx /l $&,$*.o

obj\loadaddr.o: loadaddr.s
	asmpsx /l $&,$*.o

obj\mkscombo.o: mkscombo.s mkchar.inc
	$(DASM)

obj\mkbt.o: mkbt.s mkbkgd.inc
	$(ASM)

obj\mkstk.o: mkstk.s
	$(ASM)

obj\moves.o: moves.c system.h mksony.h moves.h mkos.h mkbkgd.h mkfile.h \
		mkutil.h mkgame.h mkjoy.h mkobj.h mkguys.h mkani.h \
		mkinit.h mkreact.h mkzap.h mkprop.h mkfx.h mkslam.h \
		mksound.h mkfatal.h mkdrone.h  mk3snd.h mkstat.h mkcanned.h \
		mkmain.h mkfriend.h mkanimal.h mkend.h
	$(CC)

obj\mkutil.o: mkutil.c system.h mksony.h mkutil.h mkos.h mkbkgd.h mkjoy.h mkpal.h mkfile.h \
		mkgame.h mkguys.h mkobj.h mkani.h valloc.h mkscore.h moves.h mkfx.h mkmain.h \
		mksound.h
	$(CC)

obj\valloc.o: system.h mksony.h valloc.c valloc.h mkos.h mkbkgd.h
	ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -O2 $(DEBUG) $&.c -o $*.o

obj\mkani.o: mkani.c system.h mksony.h mkutil.h mkos.h mkbkgd.h mkjoy.h mkpal.h \
		mkgame.h mkguys.h mkobj.h mkani.h valloc.h mksound.h mk3snd.h mkprop.h mk3snd.h mkani.h
	$(CC)

obj\mkhstd.o: mkhstd.c system.h mksony.h mkutil.h mkos.h mkbkgd.h mkjoy.h mkpal.h \
		mkgame.h mkguys.h mkobj.h mkani.h valloc.h mk3snd.h mksound.h mkprop.h mk3snd.h mkani.h mkbio.h \
		mkmain.h mkinit.h
		$(CC)

obj\mkos.o: mkos.c system.h mksony.h mkos.h mkutil.h mkbkgd.h mkani.h mkgame.h mkmain.h
	$(CC)

obj\mkfile.o: mkfile.c system.h mksony.h mkfile.h psxcd.h mkos.h mkbkgd.h psxcdabs.h
	$(CC)

obj\mksony.o: mksony.c system.h mksony.h mkinit.h mkos.h mkgame.h mkobj.h mkbkgd.h \
		mkpal.h mkmain.h
	ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -O2 $(DEBUG) $&.c -o $*.o

obj\mkobj.o: mkobj.c system.h mksony.h mkobj.h mkinit.h mkbkgd.h mkgame.h mkos.h mkutil.h valloc.h mkmain.h
	ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -O2 $(DEBUG) $&.c -o $*.o

obj\mkinit.o: mkinit.c system.h mksony.h mkinit.h mkos.h mkutil.h mkgame.h mkamode.h \
		 mkobj.h mkbkgd.h mkmain.h mkjoy.h mkani.h mkinit.h mkbug.h mkscore.h mkinit.h \
		 mkguys.h mkfile.h psxsnd.h psxcd.h mksound.h wessapi.h
	$(CC)

obj\mkmain.o: mkmain.c system.h mksony.h mkinit.h mkos.h mkutil.h mkgame.h \
		 mkobj.h mkbkgd.h mkmain.h mksel.h mkjoy.h mkguys.h mkamode.h \
		 mkrepell.h mkani.h mkvs.h mkbonus.h mkscore.h mktext.h mksound.h mk3snd.h mkfx.h \
		mkbonus.h mkpal.h mkladder.h mkfade.h mkopt.h mk3snd.h psxsnd.h \
		 mkfile.h psxcd.h mkend.h mkmark.h mkhstd.h psxspu.h
	$(CC)

obj\mkguys.o: mkguys.c system.h mksony.h mkos.h mkgame.h mkani.h \
		 mkobj.h mkbkgd.h mkjoy.h mkguys.h mkinit.h mkdrone.h mkutil.h mkpal.h \
		 mkfile.h psxcd.h
	$(CC)

obj\mkamode.o: mkamode.c system.h mksony.h mkamode.h mkos.h mkbkgd.h mkgame.h mkmain.h mkutil.h mkani.h valloc.h \
		  mksound.h mk3snd.h mktext.h mkamode.h mkvs.h mkrepell.h mkbio.h mkhstd.h mk3snd.h
	$(CC)

obj\mkbkgd.o: mkbkgd.c system.h mksony.h mkbkgd.h mkgame.h mkos.h mkobj.h mkpal.h mkani.h mkmain.h psxspu.h \
		mkutil.h mkfx.h mkrepell.h mkscore.h valloc.h mksound.h mk3snd.h mkfile.h mkguys.h mk3snd.h psxcd.h
	$(CC)

obj\mkglobal.o: mkglobal.c system.h mksony.h mkinit.h mkos.h mkutil.h mkamode.h \
	moves.h mkobj.h mkbkgd.h mkgame.h mkmain.h mksel.h mkguys.h mkjoy.h \
	mkdrone.h mkpal.h mkreact.h mkrepell.h mkvs.h mkslam.h mkblood.h mkani.h \
	mkprop.h mkzap.h mksound.h mk3snd.h mkcanned.h mkbonus.h valloc.h mkscore.h mktext.h \
	mkfatal.h mkcombo.h mkfade.h mkladder.h  psxcd.h mkfile.h mkboss.h mkbio.h \
	mkopt.h mk3snd.h mkstat.h mkend.h mkanimal.h mkfriend.h
	$(CC)

obj\mksel.o: mksel.c system.h mksony.h mksel.h mkgame.h mkbkgd.h mkos.h mktext.h \
			mkutil.h mkani.h mkobj.h mkinit.h mkpal.h mkjoy.h mkguys.h mkcanned.h \
			mksound.h mk3snd.h mkfile.h psxcd.h
	$(CC)

obj\mkopt.o: mkopt.c system.h mksony.h mkbkgd.h mkobj.h mkos.h mkgame.h mkutil.h mkani.h \
			valloc.h mkjoy.h mktext.h mkfade.h mkopt.h mkinit.h  psxcd.h mkfile.h mkguys.h \
			mkpal.h mksound.h mk3snd.h
	$(CC)

obj\mkreact.o: mkreact.c system.h mksony.h mkreact.h mkobj.h mkbkgd.h mkos.h mkjoy.h \
		 	mkgame.h mkguys.h mkutil.h mkfx.h moves.h mkblood.h mkani.h mksound.h mk3snd.h mkdrone.h \
			mkblood.h mk3snd.h mkfatal.h valloc.h psxspu.h
	$(CC)

obj\mkjoy.o: mkjoy.c system.h mksony.h mkjoy.h mkbkgd.h mkobj.h mkos.h mkgame.h moves.h \
		mkutil.h mkguys.h mkreact.h mkani.h mkcanned.h mksound.h mkcombo.h mk3snd.h mkfx.h \
		mkstat.h mkscore.h
	$(CC)
#	ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -O1 $(DEBUG) $&.c -o $*.o

obj\mkdrone.o: mkdrone.c system.h mksony.h mkdrone.h mkbkgd.h mkobj.h mkos.h \
			 mkutil.h mkani.h mkjoy.h mkgame.h mkzap.h mkprop.h mkslam.h moves.h \
			 mkboss.h mkanimal.h mkstat.h mkfriend.h mkfatal.h mkcanned.h mkinit.h
	$(CC)

obj\mkboss.o: mkboss.c system.h mksony.h mkbkgd.h mkobj.h mkos.h mkgame.h mkutil.h mkani.h \
			  mkjoy.h mkpal.h mkboss.h moves.h valloc.h mkdrone.h mkguys.h mkslam.h mkfatal.h \
			  mkfx.h mkblood.h mkladder.h mkmain.h mksound.h mk3snd.h
	$(CC)

obj\mkpal.o: mkpal.c system.h mksony.h mkpal.h mkbkgd.h mkos.h
	$(CC)

obj\mkfx.o: mkfx.c system.h mksony.h mkbkgd.h mkobj.h mkos.h mkfx.h mkgame.h mkutil.h mkguys.h mkani.h mkfade.h \
		mkpal.h moves.h mksound.h mk3snd.h mkzap.h valloc.h mkmain.h mktext.h mk3snd.h mkfile.h psxcd.h mkfatal.h mkblood.h
	$(CC)

obj\mkrepell.o: mkrepell.c system.h mksony.h mkbkgd.h mkos.h mkrepell.h mkgame.h
	$(CC)

obj\mkvs.o: mkvs.c system.h mksony.h mkbkgd.h mkos.h mkvs.h mkgame.h mkfade.h \
			mkutil.h mkani.h mkmain.h mksound.h mk3snd.h mkobj.h valloc.h mkjoy.h mkinit.h \
			mkguys.h mkfile.h mk3snd.h psxcd.h
	$(CC)

obj\mkladder.o: mkladder.c system.h mksony.h mkbkgd.h mkos.h mkladder.h mkgame.h mkfade.h \
			mkutil.h mkani.h mkmain.h mksound.h mk3snd.h mkobj.h valloc.h mkjoy.h mkinit.h mkpal.h \
			mkguys.h mk3snd.h mksel.h mkvs.h
	$(CC)

obj\mkfatal.o: mkfatal.c system.h mksony.h mkbkgd.h mkos.h mkfatal.h mkgame.h \
			 	mkutil.h mkani.h mkguys.h mkfx.h mkobj.h mkpal.h mkcanned.h mkfade.h \
				mkblood.h moves.h mkjoy.h mksound.h mk3snd.h valloc.h mkfile.h psxspu.h
	$(CC)

obj\mkfriend.o: mkfriend.c system.h mksony.h mkbkgd.h mkos.h mkfriend.h mkgame.h \
			 	mkutil.h mkani.h mkguys.h mkfx.h mkobj.h mkpal.h mkfatal.h mk3snd.h mksound.h \
				valloc.h mkcanned.h mkanimal.h mkfile.h psxspu.h
	$(CC)

obj\mkanimal.o: mkanimal.c system.h mksony.h mkbkgd.h mkos.h mkanimal.h mkgame.h \
			 	mkutil.h mkani.h mkguys.h mkfx.h mkobj.h mkpal.h mkfatal.h \
				mkblood.h mkjoy.h mkcanned.h moves.h valloc.h mkfile.h psxspu.h
	$(CC)

obj\mkend.o: mkend.c system.h mksony.h mkbkgd.h mkos.h mkend.h mkgame.h mkfile.h \
	     mkfade.h mkutil.h mkani.h mkguys.h mkfx.h mkobj.h mkpal.h mkmain.h \
				mkbuyin.h mkbio.h mkjoy.h mkamode.h mkinit.h mktext.h mkbkgd.h \
				mksound.h mk3snd.h valloc.h mkbonus.h mkladder.h mkboss.h
	$(CC)

obj\mkmark.o: mkmark.c system.h mksony.h mkbkgd.h mkos.h mkmark.h mkgame.h \
			 	mkutil.h mkani.h mkguys.h mkfx.h mkobj.h mkpal.h mkmain.h \
				mksound.h mk3snd.h mkamode.h valloc.h mkjoy.h mkinit.h mkbio.h
		ccpsx -comments-c++ $(WIMP) -Wreturn-type -c -g -Wa,sl27 $(OPTIMIZE) $&.c -o obj\$&.o

obj\mkscore.o: mkscore.c system.h mksony.h mkbkgd.h mkos.h mkscore.h mkgame.h \
			   mkani.h mkutil.h mkmain.h mkfile.h mkguys.h psxcd.h
	$(CC)

obj\mktext.o: mktext.c system.h mksony.h mkbkgd.h mkos.h mktext.h mkgame.h \
			   mkani.h mkutil.h mkmain.h mkobj.h mkpal.h mkguys.h mkfile.h psxcd.h
	$(CC)

obj\mkbonus.o: mkbonus.c system.h mksony.h mkbkgd.h mkos.h mkbonus.h mkgame.h mkfile.h psxspu.h \
			mkutil.h mkani.h mkblood.h mksound.h mk3snd.h mktext.h mkobj.h mkmain.h mkfx.h mk3snd.h
	$(CC)

obj\mkcanned.o: mkcanned.c system.h mksony.h mkcanned.h mkbkgd.h mkobj.h mkos.h mkgame.h  \
		mkutil.h mkguys.h mkani.h mkjoy.h mkfx.h mkdrone.h mkreact.h mkmain.h
		$(CC)

obj\mkbuyin.o: mkbuyin.c system.h mksony.h mkbkgd.h mkos.h mkbuyin.h mkgame.h  \
			mkutil.h mkpal.h mkjoy.h mkani.h mkobj.h mkinit.h mkmain.h mk3snd.h mksound.h \
			mktext.h mk3snd.h psxcd.h
	$(CC)

obj\mksound.o: mksound.c system.h mksony.h mkbkgd.h mkos.h mksound.h mkgame.h mk3snd.h \
		psxsnd.h mkobj.h psxcd.h
	$(CC)

obj\mkslam.o: mkslam.c system.h mksony.h mkbkgd.h mkos.h mkslam.h mkgame.h  \
		  mkutil.h mkani.h mkjoy.h mkguys.h moves.h mksound.h mkobj.h mk3snd.h
	$(CC)

obj\mkblood.o: mkblood.c system.h mksony.h mkbkgd.h mkos.h mkblood.h mkgame.h \
				mkobj.h mkutil.h mkani.h mkgame.h mkos.h valloc.h mkpal.h mksound.h \
				mkfatal.h mk3snd.h
	$(CC)

obj\mkprop.o: mkprop.c system.h mksony.h mkbkgd.h mkos.h mkprop.h mkgame.h \
	  mkfx.h mkjoy.h mkreact.h mkani.h mkutil.h moves.h mkguys.h mkbug.h \
	  mkobj.h mksound.h mkpal.h mk3snd.h
	$(CC)

obj\mkstat.o: mkstat.c system.h mksony.h mkbkgd.h mkos.h mkstat.h mkgame.h \
	  mkfx.h mkjoy.h mkreact.h mkani.h mkutil.h moves.h mkguys.h mkbug.h psxspu.h \
	  mkobj.h mksound.h mkpal.h mk3snd.h mkcanned.h mkgame.h valloc.h mkfile.h mkfatal.h
	$(CC)

obj\mkzap.o: mkzap.c system.h mksony.h mkbkgd.h mkos.h mkzap.h mkgame.h \
		 mkjoy.h mkreact.h mkani.h mkutil.h moves.h mkguys.h mkobj.h \
		 mkpal.h mkfx.h mkslam.h mksound.h mkprop.h valloc.h mk3snd.h \
		 mkboss.h
	$(CC)

obj\mkbug.o: mkbug.c system.h mksony.h mkbkgd.h mkos.h mkbug.h mkgame.h \
		 mkani.h mkutil.h mkinit.h mkobj.h
	$(CC)

obj\mkcombo.o: mkcombo.c system.h mksony.h mkcombo.h mkos.h mkbkgd.h mkjoy.h mkpal.h \
		mkgame.h mkguys.h mkobj.h mkani.h valloc.h mkscore.h mkutil.h moves.h mkreact.h \
		mkinit.h mkstat.h
	$(CC)

#obj\mkdiag.o: mkdiag.c system.h mksony.h mkbkgd.h mkobj.h mkos.h mkgame.h mkutil.h mkani.h mkdiag.h
#	$(CC)

obj\mkfade.o: mkfade.c system.h mksony.h mkbkgd.h mkobj.h mkos.h mkgame.h mkutil.h mkani.h mkpal.h \
			mkfade.h mkguys.h
	$(CC)

obj\mkr1.o: mkr1.c system.h mksony.h mkbkgd.h mkobj.h mkos.h mkgame.h mkutil.h mkani.h mktext.h \
	      mksound.h mkr1.h mkmain.h mkpal.h mkjoy.h mkbkgd.h mkscore.h
	$(CC)

obj\mkbio.o: mkbio.c system.h mksony.h mkbkgd.h mkobj.h mkos.h mkgame.h mkutil.h mkani.h \
			mkbio.h mktext.h mkfile.h psxcd.h
	$(CC)

obj\psxsnd.o: system.h psxsnd.c psxsnd.h wessapi.h seqload.h digload.h soundhw.h psxcd.h psxcdabs.h
	$(CC)

obj\psxcd.o: psxcd.c psxcd.h psxspu.h system.h psxcdabs.c psxcdabs.h
	$(CC)

obj\snmain.o: snmain.s
	$(ASM)
