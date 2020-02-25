public class PaginationExampleController {
    public List<Case> caseList{get;set;}
    public Integer pageLimit = 10;
    
    public PaginationExampleController(){
        caseList = [SELECT Id, CaseNumber, Subject FROM Case limit :pageLimit];
    }
}