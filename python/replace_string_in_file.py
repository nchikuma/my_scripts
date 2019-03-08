#!/opt/python-2.7/bin/python


import sys,re

if not len(sys.argv)==2:
  print "Usage:",sys.argv[0]," <.C filename>"
  print "Do NOT select a filename which contains '_c'"
  exit(0)


filename = sys.argv[1]
print "Input filename:", filename

suff = re.findall(r'\.C',filename)
if not len(suff)==1:
  print "Set a '.C' filename"
  exit(0)
suff = re.findall(r'\_c',filename)
if len(suff)>0:
  print "Do NOT select a filename which contains '_c'"
  exit(0)

macroname  = filename[:-2].strip()
macroname2 = macroname  + "_c"
ofilename  = macroname2 + ".C"
print "Output filename:", ofilename


with open(filename,"r") as f:
  changename = False
  oline = []
  while True:
    line = f.readline()
    if not line:
      break
    #print line

    if not changename:
      tmp = macroname.split('/')
      name = tmp[len(tmp)-1]
      tmp = macroname2.split('/')
      name2 = tmp[len(tmp)-1]
      match1 = re.findall(name ,line)
      match2 = re.findall(name2,line)
      if len(match1)>0 and len(match2)<1:
        line = line.replace(name,name2)
      changename = True

    iterator = re.finditer(r'\_\_',line)
    offset = 0
    for it in iterator:
      pos = int(it.end())-offset
      check1 = line[pos+0:pos+1].isdigit()
      check2 = line[pos+1:pos+2].isdigit()
      check3 = line[pos+2:pos+3].isdigit()

      if not check1:
        print "ERROR: No digits after '__'"
        exit(0)
      elif check3:
        print "WARNING: 3 digits or more after '__'. This software cannot handle it"
        exit(0)
      elif not check2:
        line = line[0:pos-2] + line[pos+1:]
        offset = 3
      elif check2:
        line = line[0:pos-2] + line[pos+2:]
        offset = 4

    oline.append(line)


with open(ofilename,"w") as of:
  for l in oline:
    of.write(l)

