@isTest
private class SearchCourses_CC_Test {
    
    @testSetup
    private static void loadTestData() {
        
        // TODO #1:
        // Load the test data. Use the LoadDataTestFactory class to load User, Certification and Course records (in that order)
        List<User> users = LoadDataTestFactory.createUsers();
        List<Certification__c> certs = LoadDataTestFactory.loadCertifications();
        List<Course__c> courses = LoadDataTestFactory.loadCourses();

    }
    
    @isTest
    private static void testSearchCoursesNavigation() {
              
	// TODO #2: Set the current page

        Pagereference testPage = Page.SearchCoursesPage;
        test.setCurrentPage(testPage);
        // Do the test
        Test.startTest();
        
        // TODO #3: Instantiate the controller
        SearchCourses_CC sc = new SearchCourses_CC();

        
        // TODO #4: Get the list of CourseWrapper elements
        List<SearchCourses_CC.CourseWrapper> wrappers = sc.courseList;
        
        // TODO #5: Modify the list by checking all the elements
        for(SearchCourses_CC.CourseWrapper wrapper: wrappers){
            wrapper.checked = true;
        }
        
        // TODO #6: Set modified list back to controller

        sc.courseList = wrappers;
        // TODO #7: Navigate to ListResultsPage by callng the listDeliveries method - capture the resulting url
        String lrp = sc.listDeliveries().getUrl();
        
        Test.stopTest();
        
        // Verify the results
        
        // TODO #8: Check that all the elements have the boolean "checked" set to true
        List<SearchCourses_CC.CourseWrapper> updatedWrappers = sc.courseList;
        Integer i = 0;
        for(SearchCourses_CC.CourseWrapper w: updatedWrappers){
            if(!w.checked){
                i++;
            }
        }
        System.assertEquals(i, 0);
        // TODO #9: Check the correct navigation to ListCourseDeliveriesPage
        System.assertEquals(Page.ListCourseDeliveriesPage.getUrl(), lrp);

    }
}