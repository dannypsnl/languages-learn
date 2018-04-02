use v6;
my $sudoku = '000000075000080094000500600010000200009000570060030400010000230800000006063240000';
$sudoku = $sudoku.trans('0' => ' ');

sub chunks(Str $s, Int $chars) {
    gather loop (my $idx = 0; $idx < $s.chars; $idx += $chars) {
        take substr($s, $idx, $chars);
    }
}

my $separator = '+---+---+---+';
for chunks($sudoku, 9) -> $line {
    say $separator if $++ %% 3;
    say '|', chunks($line, 3).join('|'), '|';
}
say $separator;
