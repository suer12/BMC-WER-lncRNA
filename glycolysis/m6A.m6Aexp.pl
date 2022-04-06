###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056
use strict;
use warnings;

my %hash=();

open(RF,"gene.txt") or die $!;
while(my $line=<RF>){
	chomp($line);
	$hash{$line}=1;
}
close(RF);

open(RF,"symbol.txt") or die $!;
open(WF,">m6Aexp.txt") or die $!;
while(my $line=<RF>){
	if($.==1){
		print WF $line;
		next;
	}
	my @arr=split(/\t/,$line);
	my @zeroArr=split(/\|/,$arr[0]);
	if($zeroArr[0] eq "VIRMA"){
		$line=~s/VIRMA/KIAA1429/g;
		print WF $line;
		delete($hash{"KIAA1429"});
	}
	elsif(exists $hash{$zeroArr[0]}){
		print WF $line;
		delete($hash{$zeroArr[0]});
	}
}
close(WF);
close(RF);

foreach my $key(keys %hash){
	print $key . "\n";
}

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056