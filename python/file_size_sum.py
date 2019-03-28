#!/usr/bin/python

import sys,os,glob

def find_all_files(directory):
  for root, dirs, files in os.walk(directory):
    yield root
    for file in files:
      yield os.path.join(root, file)


def PrintUsage():
  print "./file_size_sum.py <directory name>"


if __name__ == '__main__':
  
  if len(sys.argv)!=2:
    PrintUsage()
    exit(0)

  target       = sys.argv[1]
  current_path = os.path.dirname(os.path.abspath(__file__))
  target_path = "%s/%s"%(current_path,target)

  if not os.path.isdir(target_path):
    print "No such a directory"
    exit(0)

  size_sum = 0
  size_max = 0
  for f in find_all_files(target_path):
    size = os.path.getsize(f)
    size_sum += size
    if size > size_max:
      size_max = size

  print "===================================================="
  print "Target directory  : ",target_path
  print "Total file size   : ",size_sum,"(%2.1fK,%2.1fM,%2.1fG,%2.1fT)"%(
      size_sum/1e+3,
      size_sum/1e+6,
      size_sum/1e+9,
      size_sum/1e+12)
  print "Maximum file size : ",size_max,"(%2.1fK,%2.1fM,%2.1fG,%2.1fT)"%(
      size_max/1e+3,
      size_max/1e+6,
      size_max/1e+9,
      size_max/1e+12)
  print "===================================================="


