#!/usr/bin/perl

$simulation = 1; # 0 => data , 1 => simulation

$start_runid = $ARGV[0];
$start_acqid = $ARGV[1];
$stop_runid  = $ARGV[2];
$stop_acqid  = $ARGV[3];
$step        = $ARGV[4];
$current_dir = "/gpfs/fs03/t2k/beam/work/nchikuma/wagasci_software/job_submit";
#$script      = $current_dir."/Recon_HitTiming.pl";
#$script      = $current_dir."/HitEff_submit.pl";
#$script      = $current_dir."/AnaAll_submit.pl";
$script      = $current_dir."/merge_INGRID_BSD.pl";

$datadir     = "/gpfs/fs03/t2k/beam/work/nchikuma/wagasci_software/data";
$daqdatadir  = $datadir."/daqdata";  

if(
    $start_runid eq "" or 
    $start_acqid eq "" or
    $stop_runid  eq "" or
    $stop_acqid  eq "" or
    $step        eq "")
{
  print "start_runid=ARGV[0]\n";
  print "start_acqid=ARGV[1]\n";
  print "stop_runid =ARGV[2]\n";
  print "stop_acqid =ARGV[3]\n";
  print "step       =ARGV[4]\n";
  exit(0);
}

print "start_runid=".$start_runid."\n";
print "start_acqid=".$start_acqid."\n";
print "stop_runid =".$stop_runid ."\n";
print "stop_acqid =".$stop_acqid ."\n";
print "script     =".$script     ."\n";
print "step       =".$step       ."\n";
print "Are you sure to submit jobs? [Yes(y)/No(n)]\n";
my $yesno = <STDIN>;
chomp($yesno);
if($yesno ne "y" and $yesno ne "Y" and $yesno ne "yes" and $yesno ne "Yes"){
  print "exit\n";
  exit(0);
}
print "do\n";


my $runid = $start_runid;
my $acqid1 = $start_acqid;
my $acqid2 = $acqid1 + $step;
if($runid eq $stop_runid and $acqid2>=$stop_acqid){$acqid2 = $stop_acqid; }

while( 
    (not $runid>$stop_runid) and 
    (not ($runid==$stop_runid and $acqid1>=$stop_acqid))
    )
{
  #$cmd = $script." $runid $acqid1 $acqid2 now 1";
  $cmd = $script." $runid $acqid1 $acqid2";
  print $cmd."\n";
  system("bsub $cmd");
#  system("$cmd");
  $acqid1 = $acqid2;
  if($acqid1>600){ $runid+=1; $acqid1=0; $acqid2=0;}
  $acqid2 = $acqid2+$step;
  if($runid==$stop_runid and $acqid2>=$stop_acqid){$acqid2 = $stop_acqid;}
  if($acqid2>600){ $acqid2 = 601; }
}
