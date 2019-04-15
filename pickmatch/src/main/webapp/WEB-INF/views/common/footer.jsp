<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div>
<style>
	footer
	{
		color : grey;
	}
	ul, ol
	{
		list-style-type: none;
		padding-left: 0;
	}
	#copyright
	{
		position : relative;
		background-color : black;
		padding : 35px 0;
	}
	.web-size
	{
		position : relative;
		max-width : 1024px;
		margin : 0 auto;
	}
	.copyright-logo
	{
		position : absolute;
		left : 14px;
		top : 25px;
	}
	
	.copyright-logo > p
	{
		font-family: Amaranth;
		font-size:35px;
	}
	
	.copyright-btn
	{
		overflow : hidden;
		padding-left: 190px;
	}
	.copyright-btn li:first-child
	{
		border: 0;
		padding-left: 0;
	}
	.copyright-btn li
	{
		float : left;
		padding: 0 12px;
		line-height: 100%;
	}
	
	.copyright-btn li:first-child a
	{
		color : #C10A00;
	}
	.copyright-btn li a
	{
		text-decoration : none;
		font-size : 1.05em;
		color : grey;
		line-height: 120%;
		cursor: pointer;
	}
	
	.copyright-txt
	{
		position : relative;
		padding-left: 190px;
	}
	
	.copyright-txt address
	{
		clear: both;
		font-style:normal;
		font-size: 1em;
		line-height: 160%;
		padding: 15px 0;
	}
	.copyright-txt .copy
	{
		font-size: 1em;
		line-height: 160%;
	}
</style>
<footer>
	<div id="copyright">
		<div class="web-size">
			<div class="copyright-logo">
				<p>pickmatch</p>
			</div>
			<div class="copyright-btn">
				<ul>
					<li>
						<a href="#" data-fade="fade">개인정보처리방침</a>
					</li>
					<li>
						<a href="#" data-fade="fade">이용약관</a>
					</li>
					<li>
						<a href="#" data-fade="fade">이메일무단수집거부</a>
					</li>
				</ul>
			</div>
			<div class="copyright-txt">
				<address>
					<span>상호명  : 픽매치(PICKMATCH) / </span>
					<span>대표 : 김동현</span>
					<br>
					<span>서울시 강남구 테헤란로 14길 6 남도빌딩 4F / </span>
					<span>전화 : 010-1111-1111</span>
					<br>
					<span>사업자 등록번호 : 400-00-00000</span>
				</address>
				<p class="copy">
					CopyRightⓒ 2019
					<b> PICK Match.</b>
					All rights reserved. e-mail : pickmatch@pickmatch.com
				</p>
			</div>		
		</div>
	
	</div>
	
	
	
	
</footer>


</body>
</html>