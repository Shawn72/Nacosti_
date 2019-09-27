using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using  Nacosti_;
namespace NacostiUniTests
{
    [TestClass]
    public class UnitTestClass
    {
        [TestMethod]
        public void ConfirmAttendanceTest()
        {
            var ktest = new Meetings();
            ktest._ConfirmMeetingAttendance();

        }
    }
}
