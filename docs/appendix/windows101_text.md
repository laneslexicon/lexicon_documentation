````
name=Windows Arabic(101) Keyboard
levels=2
groups=1
button width=110
button height=100
css=".arabic { font-family : Amiri;font-size: 30px} .latin { font-size: 24px} .inherited { font-family : Amiri;font-size : 30px} .common { font-size : 30px}"
horizontal%20spacing=5
vertical%20spacing=5

START_KEYS
### row 1
1,1,ذ:ّ,[level2/vpos=20]
1,2,0x31:0x21
1,3,0x32:0x40
1,4,0x33:0x23
1,5,0x34:0x24
1,6,0x35:0x25
1,7,0x36:0x5e
1,8,0x37:0x26
1,9,0x38:0x2a
1,10,0x39:0x29
1,11,0x30:0x28
1,12,-:0x5f
1,13,=:0x2b
1,14,<Backspace>,Back
#
# row
#
2,1,<Tab>,Tab
2,2,ض:َ,[level2/vpos=20]
2,3,ص:ً,[level2/vpos=20]
2,4,ث:ُ,[level2/vpos=20]
2,5,ق:ٌ,[level2/vpos=20]
# 2,6  shift key gives lam + alef with hamza below (0x644,0x625)
2,6,ف:0x0644;0x0625,ف:لإ
2,7,غ:0x2018,[level1/vpos=-10]
2,8,ع:0x00f7,[level1/vpos=-10]
2,9,ه:ئ
2,10,خ:0x00d7,[level1/vpos=-10]
2,11,ح:0x061b,[level1/vpos=-10]
2,12,ج:0x003c,ج:<,[level1/vpos=-10]
2,13,د:0x003e
2,14,\:0x007c
#### row 3
3,1,<CapsLock>,Caps lock,[toggle=true,type=level2]
# 671 == alef wasla
3,2,ش:ِ,[level2/vpos=10]
3,3,س:ٍ,[level2/vpos=10]
3,4,ي:0x005d

3,5,ب:0x005b
#3,6 shift lam + alef with hamza above (0x644,0x623)
3,6,ل:0x0644;0x0623,ل:لأ
3,7,ا:أ
3,8,ت:0x0640
3,9,ن:0x060c
3,10,م:0x002f
3,11,ك:0x003a
3,12,ط:0x0022
3,13,<Enter>,Enter,[span=2]
########
### row 4
########
4,1,,Shift,[sticky=true,type=level2]
4,2,0x0626:0x007e
4,3,0x0621:0x0652,[level2/vpos=20]
4,4,0x0624:0x007d
4,5,ر:0x007b
# alef lam with alef with madda above (0x644,0x622)
4,6,0x0644;0x0627:0x0644;0x0622,لا:لآ

4,7,ى:0x0622
4,8,ة:0x2019
4,9,و:0x002c
4,10,ز:0x002e
4,11,ظ:؟
4,12,,Shift,[sticky=true,type=level2,span=3]
#####
5,1,0x20,[span=3]
5,4,0x20,Space,[span=9]
5,13,<AltGr>,Alt Gtr,[type=level3,sticky=true,span=2]

````
