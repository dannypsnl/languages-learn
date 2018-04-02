use v6;
my $sudoku = '000000075000080094000500600010000200009000570060030400010000230800000006063240000';
$sudoku = $sudoku.trans: '0' => ' ';

my $separator = '+---+---+---+';
for $sudoku.comb(9) -> $line {
    say $separator if $++ %% 3;
    say '|', $line.comb(3).join('|'), '|';
}
say $separator;
