package review;

public class PageTest {
	public static void main(String[] args) {
		String pageNumber="16";
		String pageSize = "10";
		int totalCount = 250;
		String url = "ReviewPage.jsp";
		
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url);
		
		pageInfo.getInfomation();
		
	}
}
