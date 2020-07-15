package review;


public class Paging {

	private int totalCount; // 전체 글 개수
	private int totalPage; // 전체 페이지 수

	private int pageNumber; // 페이지 번호
	private int pageSize = 3; // 한 페이지당 글 개수
	private int beginRow; // 한 페이지 시작 행
	private int endRow; // 한 페이지 마지막 행

	private int pageCount = 3; // 버튼 없이 시작~마지막 페이지 숫자 ex) 1~10페이지
	private int beginPage; // 버튼 없이 시작 페이지 숫자 ex) 1~10페이지가 있다면 1페이지
	private int endPage; // 버튼 없이 마지막 페이지 숫자 ex) 1~10페이지가 있다면 10페이지

	private String url; // list.jsp
	private String pagingHtml; // 버튼까지 포함한 시작~마지막 페이지 숫자 버튼
	private String pagingStatus; // 현재 보고있는 상태값
	
	
	// getter
	public int getBeginRow() {
		return beginRow;
	}

	public int getEndRow() {
		return endRow;
	}
	

	public int getPageNumber() {
		return pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public String getPagingStatus() {
		return pagingStatus;
	}
	
	
	//생성자
	public Paging(String pageNumber, String pageSize, int totalCount, String url) {
		if (pageNumber == null || pageNumber.equals("null")) { // jsp는 파라미터를 받을 때 문자열로 받음
			pageNumber = "1";
		}

		if (pageSize == null || pageSize.equals("null")) {
			pageSize = "3";
		}

		this.pageNumber = Integer.parseInt(pageNumber); // 문자열을 정수로 바꿈
		this.pageSize = Integer.parseInt(pageSize);

		this.url = url;
		this.totalCount = totalCount;

		this.totalPage = (int) Math.ceil((double)totalCount / this.pageSize);

		this.beginRow = this.pageSize * (this.pageNumber - 1) + 1;
		this.endRow = this.pageSize * this.pageNumber;

		// 마지막 열행 마지막이면
		if (this.endRow > this.totalCount) {
			this.endRow = this.totalCount;
		}

		this.beginPage = (this.pageNumber - 1) / this.pageCount * this.pageCount + 1;
		this.endPage = this.beginPage + this.pageCount - 1;

		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}

		this.pagingHtml = get_html();
		this.pagingStatus = "총 " + this.totalCount + "건(" + this.pageNumber + "/" + this.totalPage + ")";
	}

	
	private String get_html() {
		String result = "";

		result += "<ul class='pagination pagination-sm'>";
		
		if (this.pageNumber <= pageCount) {
//			result += "맨처음&nbsp;&nbsp;";
//			result += "이전&nbsp;&nbsp;";
			
		} else {
			result += "<li><a href='" + url + "&pageNumber=" + 1 + 
					"&pageSize=" + this.pageSize + "'>맨처음</a></li>&nbsp;&nbsp;"; //href는 외따옴표('), 자바는 쌍따옴표("")
			
			result += "<li><a href='" + url + "&pageNumber=" + (beginPage-1) + 
					"&pageSize=" + this.pageSize + "'>이전</a></li>&nbsp;&nbsp;"; 
			
		}

		for (int i=this.beginPage; i <= this.endPage; i++) {
			//현재 페이지 빨간색 폰트 강조
			if(i == this.pageNumber) {
				result += "<li class='active'><a href='#'>" + i + "</a></li>&nbsp;&nbsp;";
			} else {
				result += "<li><a href='" + url + "&pageNumber=" + i + 
						"&pageSize=" + this.pageSize + "'>" + i + "</a></li>&nbsp;&nbsp;"; 
				
			}
		}

		if (this.pageNumber >= (totalPage/pageCount * pageCount + 1)) {
//			result += "다음&nbsp;&nbsp;";
//			result += "맨끝&nbsp;&nbsp;";
		} else {
			result += "<li><a href='" + url + "&pageNumber=" + (endPage+1) + 
					"&pageSize=" + this.pageSize + "'>다음</a></li>&nbsp;&nbsp;";
			
			result += "<li><a href='" + url + "&pageNumber=" + totalPage + 
					"&pageSize=" + this.pageSize + "'>맨끝</a></li>&nbsp;&nbsp;";
			
		}
		result += "</ul>";

		return result;
	}

	public void getInfomation() {
		System.out.println("totalCount : " + totalCount);
		System.out.println("totalPage : " + totalPage);
		System.out.println("pageNumber : " + pageNumber);
		System.out.println("pageSize : " + pageSize);
		System.out.println("beginRow : " + beginRow);
		System.out.println("endRow : " + endRow);
		System.out.println("pageCount : " + pageCount);
		System.out.println("beginPage : " + beginPage);
		System.out.println("endPage : " + endPage);
		System.out.println("url : " + url);
		System.out.println("pagingStatus : " + pagingStatus);
		System.out.println("================================");
		System.out.println("pagingHtml : " + pagingHtml);		
	}

}
