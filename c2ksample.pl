#!/usr/bin/perl -w
######################################################################
#
# c2ksample.pl - A sample program for conv2kr.pm.
# Copyright (C) 2009 Younghong "Hong" Cho <hongcho at sori dot org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#*********************************************************************
#
# == History
# 2009-06-26 Created.
######################################################################

use strict;
use lib '.';
use conv2kr;

######################################################################
# Constants.

my $ICONV = "/usr/bin/iconv";
my $TMP_PREFIX = "/tmp/temp.r2k.";

######################################################################

# Initialize the library environment.
conv2kr::configure($ICONV, $TMP_PREFIX);

# Input string in EUC-KR, which is the most common Korean character
# set encoding.
my $str_i = "알 거 없잖아
궁금해 하지마
내가 말했잖아
피곤하게 하지마 적당히
더 바라지마
내게 많은 것을 바라지마
나보다 나를 더 아는척하지마
웃기잖아
니 맘대로 와서
상처받았다니 어쨌다니
우리 사이가 뭐냐니
계속 그런 말 하려거든 가렴
어쩌면 난 너를 원했는지도 몰라
아냐 그랬나 봐 그래서 니가
이렇게 날 숨막히게 하나 봐
이런 또 내 탓인가 봐
미안하게 됐네
언제나 내가 망치게 되네
미안하긴 한데
상처받았다니 어쨌다니
우리 사이가 뭐냐니
그런 말할 거면
아예 모르는 사람처럼
지내는 게 나을걸
난 아무런 말로도
너에게 약속할 수 있는 게 없으니
내게 바라지마 아무것도 없으니
왜 난 아무렇지 않은 것처럼
너만 상처받았고
나는 또 괜찮아야 하나 봐
내 상처는 왜
그래 난 이런 사람이니까
나는 아무렇지도 않은 것처럼
보이니 참 밉겠네
날 그렇게 생각할 거면
나도 이렇게 해도 되잖아
그러니 이래라 저래라 마
말하기도 싫어 말할만한데도 없어
가끔 어쩌다 힘든 밤이면
술이라도 한잔 마시다 잠들면
지나갈 시간이니";

while($str_i =~ /([^\n]+)\n?/g){
       my $str_e = conv2kr::utf82euckr($1);
       my $str_j = conv2kr::euckr2Johab($str_e);
       my $str_r = conv2kr::johab2Mct($str_j);
       print "$str_r\n";
}
#my $str_i = conv2kr::utf82euckr($str_i);
#print("EUC-KR Input\t: $str_i\n");

# Convert the EUC-KR string to Johab first.
#my $str_j = conv2kr::euckr2Johab($str_i);
#print("Johab Input\t: $str_j\n");

# Convert the Johab input string to "MCT".
# This is where the actual rules are applied.
#my $str_r = conv2kr::johab2Mct($str_j);
#print("MCT result\t: $str_r\n");

# Convert the "MCT" result string back to Johab.
#my ($str_n, $str_n2) = conv2kr::mct2Johab($str_r, 1);
#print("Johab result\t: $str_n\n");
#print("Johab result2\t: $str_n2\n");

# Convert the Johab result string to HTML Unicode.
#my $str_h = conv2kr::johab2Html($str_n);
#print("HTML result\t: $str_h\n");

######################################################################
# End.
exit(0);
######################################################################
