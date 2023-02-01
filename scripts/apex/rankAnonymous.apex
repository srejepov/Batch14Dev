RankHandler rh2 = new RankHandler();
system.debug('prize1 is => ' + rh2.rankPrizeSwitch(1));
system.debug('prize2 is => ' + rh2.rankPrizeSwitch(2));
system.debug('prize3 is => ' + rh2.rankPrizeSwitch(3));
system.debug('prize5 is => ' + rh2.rankPrizeSwitch(5));
system.debug('prize11 is => ' + rh2.rankPrizeSwitch(11));

RankHandler rh = new RankHandler();
system.debug('p1 is => ' + rh.rankPrize(1));
system.debug('p2 is => ' + rh.rankPrize(2));
system.debug('p3 is => ' + rh.rankPrize(3));
system.debug('p5 is => ' + rh.rankPrize(5));
system.debug('p11 is => ' + rh.rankPrize(11));