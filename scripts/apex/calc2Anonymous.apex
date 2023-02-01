integer sum1 = CalculatorSt.add(5, 15);
system.debug(sum1);
integer sum2 = CalculatorSt.add(5, 15, 25);
system.debug(sum2);

List<integer> listInteger = new List<integer>();
listInteger.add(10);
listInteger.add(15);
listInteger.add(21);
listInteger.add(15);
listInteger.add(15);
CalculatorSt.add(listInteger);