use v6;

# 000000075000080094000500600010000200009000570060030400010000230800000006063240000
constant separator = '+---+---+---+';

sub MAIN($sudoku) {
    my $substituted = $sudoku.trans: '0' => ' ';

    for $substituted.comb(9) -> $line {
        say separator if $++ %% 3;
        say '|', $line.comb(3).join('|'), '|';
    }
    say separator;
}
