@isTest
public class TestVerifyDate {

    @isTest
    public static void testCheckDates() {
        Date myDate = Date.newInstance(2001, 4, 1);
        Date anotherDate= Date.newInstance(2001, 4, 10);
        Date outOfMonthDate = Date.newInstance(2001, 5, 1);
        Integer totalDays = Date.daysInMonth(myDate.year(), myDate.month());
        Date lastDateOfMonth = Date.newInstance(myDate.year(), myDate.month(), totalDays);

        System.assertEquals(lastDateOfMonth, VerifyDate.CheckDates(myDate, outOfMonthDate));
        System.assertEquals(anotherDate, VerifyDate.CheckDates(myDate, anotherDate));
    }
}