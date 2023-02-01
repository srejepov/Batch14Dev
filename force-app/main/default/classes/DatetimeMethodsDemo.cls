public class DatetimeMethodsDemo {
    public void calculateAgeInMonths() {
        date birthDate = date.newInstance(1981, 12, 4);

        date todayDate = date.today();

        integer ageInMonths = birthDate.monthsBetween(todayDate);
        system.debug('Sapa age in months is ==> ' + ageInMonths);

        integer ageInDays = birthDate.daysBetween(todayDate);
        system.debug('Sapa age in days is ==> ' + ageInDays);
    }

    public void printSubscriptionEndDate(){
        date subscriptionStartDate = date.today();

        date subscriptionEndDate = subscriptionStartDate.addDays(1000);
        system.debug('subscription end date is ==> ' + subscriptionEndDate);

        integer endDateYear = subscriptionEndDate.year();
        system.debug('year of end date is ==> ' + endDateYear);

        integer endDateMonth = subscriptionEndDate.month();
        system.debug('month of end date is ==> ' + endDateMonth);
    }

    public void printOfferEndDate(){
        datetime offerStart = datetime.now();
        datetime offerEnd = offerStart.addHours(51);

        system.debug('offer end datetime is ' + offerEnd);

        Date offerEndDate = offerEnd.date();
        system.debug('offer enddate is ' + offerEndDate);
    }

    public void birthDateInMs(){
        datetime birthDT = datetime.newInstance(1981, 12, 4, 5, 20, 00);
        long birthDateMS = birthDT.getTime();
        system.debug('Sapa birth datetime in milliseconds ==> ' + birthDateMS);
    }
}