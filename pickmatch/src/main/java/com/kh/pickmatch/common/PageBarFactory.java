package com.kh.pickmatch.common;

public class PageBarFactory {

	public static String getPageBar(int total, int cPage, int numPerPage, String url)
	{
		String pageBar="";
		int totalPage = (int)Math.ceil((double)total/numPerPage); // 토탈페이지
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo == 1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		while(!(pageNo > pageEnd || pageNo > totalPage))
		{
			if(cPage == pageNo)
			{
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+ "</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage)
		{
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link'>다음</a>";
			pageBar+="</li>";
		}

		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage;";
		pageBar+="}</script>";
		
		
		return pageBar;
	}
	
}
