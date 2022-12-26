<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	    <title>코딩 전문가를 만들기 위한 온라인 강의 시스템</title>
	    <meta charset="UTF-8">
	    <title>공지사항목록</title>
	    <style>
	    	#visual .content-container{	
		        height:inherit;
		        display:flex; 
		        align-items: center;
		        
		        background: url("/images/mypage/visual.png") no-repeat center;
		    }
	    	.content-container {	
				margin-left: auto;
				margin-right: auto;
			    width: 960px;
				height: inherit;
			    position:relative;
			}
			
			#body{
				min-height: 300px;
				border-top:5px solid #8CBA34;
				margin-top:1px;	
			}
			
			
			#body.content-container{   
				display: flex;
			}
			
			#aside {
			    /*-ms-grid-row:1;
			    -ms-grid-column:1;*/
			    width: 205px;
				
			    height: inherit;    
				/*float: left;*/
			}
			
			#main {
			    /*-ms-grid-row:1;
			    -ms-grid-column:2;*/
			    width: 755px;
			
			    position: relative;
				height: inherit;	
				/*float: left;*/    
			}
			/* 요소(element) 여백 초기화  */
			html, body,
			div, span,
			dl, dt, dd, ul, ol, li,
			h1, h2, h3, h4, h5, h6,
			blockquote, p, address, pre, cite,
			form, fieldset, input, textarea, select,
			table, th, td {
				margin:0;
				padding:0;
				}
			
			/* 제목요소 */
			h1, h2, h3, h4, h5, h6 {  
				font-size:inherit;   
				font-weight:inherit;   
				} 
			
			/* 테두리 없애기 */
			fieldset, img, abbr,acronym { border:0 none; } 
			
			/* 목록 */
			ol, ul { list-style:none; margin: 0; padding: 0;}
			
			/* 테이블 - 마크업에 'cellspacing="0"' 지정 함께 필요 */
			table {
				border-collapse: separate;
				border-spacing:0;
				border:0 none;
				}
			caption, th, td {
				text-align:left;
				font-weight: normal;
			}
			
			/* 텍스트 관련 요소 초기화 */
			address, caption, strong, em, cite {
				font-weight:normal;
				font-style:normal;
				}
			ins { text-decoration:none; }
			del { text-decoration:line-through; }
			
			/* 인용문 */
			blockquote:before, blockquote:after, q:before, q:after { content:""; }
			blockquote,q { quotes:"" ""; }
			
			/* 수평선*/
			hr { display:none; }
			
			blockquote {
			    margin: 0 0 1rem;
			}
			
			/* 하이퍼링크*/
			a{
				text-decoration: none;
				color:inherit;
			}
			a:hover{
				text-decoration: underline;
			}
					
			/* === <Component Style For All Media>=================================================== */
			
			/* ----#main-menu--------------------------------------- */
			
			#main-menu{		
				display: inline-block;	
			}
			
			#main-menu a {
				font-family: "맑은 고딕";
				font-weight: bold;
				font-size: 15px;
				
				color: #000;
				text-decoration: none;
			}
			
			#main-menu a:hover {
				color: #ff6a00;	
			}
			
			#main-menu > h1{
				display: none;
			}
			
			#main-menu > ul{	
				overflow: auto;
			}
			
			#main-menu > ul > li{
				float: left;	
				padding-left: 24px;
				background: url("../images/bg-main-menu-vsp.png") no-repeat 13px center;	
			}
			
			#main-menu > ul > li:first-child{		
				padding-left: 0px;
				background: none;	
			}
		
			/* -----#search-form-------------------------------------- */
			#search-form{
				border:5px solid #8cba34;
				display: inline-block;
				overflow: auto;
			}
			
			#search-form h1,
			#search-form legend{
				display: none;
			}
			
			#search-form label{	
				height: 25px;	
				line-height:25px;
				display: block;	
				float:left;
				
				font-family: "돋움", Arial, sans-serif;
				font-size: 11px;
				font-weight:bold;
				color:#979797;
				
				background: #ffffff;
				padding-left:5px;
				padding-right:5px;
			}
			
			#search-form input[type="text"]{
				width:222px;
				height: 25px;
				border:0px;	
				display: block;
				float:left;
				text-indent: 5px;
			}
			
			#search-form input[type=submit]{
				background: url("../images/btn-zoom.png") no-repeat center;
				width:31px;
				height: 25px;
				border: 0px;
				vertical-align: middle;
				display: block;	
				float:left;
				border-left:1px solid #8cba34;
				
				text-indent: -999px;
			}
		
		
			/* === <Desktop Only> ===================================================================== */
			
			/* @media all and (min-width:961px){	 */
				
			#header {
				position: static;
				display: block;
				height: 70px;
				padding: 0px;
				border-bottom: 3px solid #8CBA34;
			}
			
			#header .content-container {
				display: block;
				width: 960px;
				box-sizing: border-box;
				position: relative;
				margin-left: auto;
				margin-right: auto;
			}
			
			#header .hamburger-button {
				display: none;
			}
			#header .search-button {
				display: none;
			}
			#header .content-container {
				text-align: unset;
				position: relative;
				margin-left: auto;
				margin-right: auto;
				height: inherit;
			}
			#header .content-container .logo {
				display: inline-block;
				position: absolute;
				left: 0px;
				top: 23px;
			}
			#header .content-container .main-menu {
				
			}
			.sub-menu.top h1 {
				
			}
			
			
			#header .content-container{
				position: relative;
				align-items: center;
			}
			
			.hamburger-button,
			.search-button,
			.more-vert-button
			{
				display: none;
			}
			
			#logo{	
				position: absolute;
				left:0px;
				top:23px;
			}
			
			/* ----#main-menu--------------------------------------- */
			
			#main-menu{			
				position: absolute;
				left:200px;
				top:27px;
			}
			
			/* -----#search-form----------------------------- */
			#search-form{
				position: absolute;
				left:468px;
				top:21px;
			}
			
			/* -----#acount-menu------------------------------- */
			#acount-menu{
						
				position: absolute;
				right:0px;
				top:20px;
			}
			
			#acount-menu a{
				
				display: inline-block;
				font-family: "맑은 고딕", "고딕", sans-serif;
				font-size: 10px;
				font-weight: bold;	
				
				color:#979797;
				text-decoration: none;
			}
			
			#acount-menu a:hover{
				text-decoration:underline;
			}
			
			#acount-menu > ul{	
				overflow: auto;
			}
			
			#acount-menu > ul > li{
				float:left;
				padding-left: 9px;
				background: url("../images/bg-member-menu-sp.png") no-repeat 5px center; 
			}
			
			#acount-menu > ul > li:first-child{	
				padding-left: 0px;
				background: none; 
			}
			
			/* ------#member-menu-------------------------------- */
			
			#member-menu{
				position: absolute;
				right:0px;
				top:40px;
			}
		
		/* } */
					/*--- reset style -----------------------------------------------------------*/
			body{
				margin:0px;
			}
			
			h1{
				margin:0px;
			}
			
			ul{
				padding:0px;	
				margin:0px;
			}
			
			li{
				display: block;
			}
			
			a{
				text-decoration: none;
				color:inherit;
			}
			
			table{
				border-spacing: 0px;
				table-layout: fixed;
			}
			
			
			/*--- -------------- -----------------------------------------------------------*/
			
			.h-60px{
				height: 60px;
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			/*--- common style -----------------------------------------------------------*/
			* {
				box-sizing: border-box;
			}
			
			body {
				font-family: 돋움, Arial, sans-serif;
				font-size: 11px;
				color: #979797;
			}
			
			/* a:hover{
				text-decoration: underline;
			} */
			
			.cursor-pointer{
				cursor: pointer;
			}
			
			.clearfix:after {
				content: ".";
				display: block;
				clear: both;
				visibility: hidden;
				line-height: 0;
				height: 0;
			}
			
			.hidden {
				display: none;
			}
			
			.hidden-first {
				display: none !important;
			}
			
			/* --- color ---------------------------------------------- */
			.color-warning{
				color: #ff6a00;
			}
			
			.color-notice{
				color: #0080ff;
			}
			
			.color-light{
				color: #b6ff00;
			}
			
			.color-highlight{
				color: #8cba34;
			}
			
			.hover-color-orange:hover{
				color:#ff6a00;
			}
			
			.hover-underline:hover{
				text-decoration: underline;
			}
			
			.color-red {
				color: #ff0000;
			}
			
			/* ------------------------------ */
			
			.deprecated {
				text-decoration: line-through;
			}
			
			.line-height{
				height: 30px;
				line-height: 30px;
			}
			
			.line-height-20{
				height: 20px;
				line-height: 20px;
			}
			
			.width-match-parent{
				width:100%;
			}
			
			.font-size-13{
				font-size: 13px;	
			}
			
			/* --- text ---------------------------------------------- */
			.text-indent{
				text-indent: 10px;
			}
			
			.text-ellipsis{
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
			
			.text-align-left{
				text-align: left;
			}
			
			.text-align-center{
				text-align: center;
			}
			
			.text-align-right{
				text-align: right;
			}
			
			.text-valign-middle{
				vertical-align: middle;
			}
			
			.text-indent{
				text-indent: 10px;
			}
			
			.text-underline{
				text-decoration: underline;
			}
			
			.color-notice,
			.text-red,
			.color-red{
				color: #ff0000;
			}
			
			.color-highlight,
			.text-orange,
			.color-orange{	
				color: #ff6a00;	
			}
			
			.color-bright,
			.text-green,
			.color-green{
				color: #8cba34;
			}
			
			.color-light-green{
				color:#b6ff00;
			}
			
			.text-blue,
			.color-blue{
				color: #2572aa;
			}
			
			.text-red,
			.color-red{
				color: #ff0000;
			}
			
			.text-lightblack,
			.color-lightblack{
				color: #707070;
			}
			
			.text-black,
			.color-black{
				color: #000000;
			}
			
			.text-white,
			.color-white{
				color: #ffffff;
			}
			
			/* new --------------------------- */
			.text-strong{
				font-weight: bold;
			}
			
			.text-cancel{
				text-decoration: line-through;
			}
			
			.text-disable{
				
			}
			/* ------------------------------ */
			
			
			
			input.disabled{
				border-width: 2px;
			    border-style: inset;
			    border-color: initial;
			    border-image: initial;
			    background: #e1e1e1;
			}
			
			input.vertical-center,
			img.vertical-center{
				vertical-align: middle;
			}
			
			.cursor-pointer{
				cursor: pointer;
			}
			
			.bg-none{
				background: none;
			}
			
			.bg-beige{
				background: beige;
			}
			
			.bg-dark-gray{
				background: #808080;
			}
			
			.bg-gray{
				background: #f5f5f5;
			}
			
			.bg-light-gray{
				background: #f1f1f1;
			}
			
			.bg-yellow{
				background: #ffffa8;
			}
			
			.no-border{
				border:none;
			}
			
			.border{
				border:1px solid #d3d3d3;
			}
			
			.border-ver{
				border-top:1px solid #d3d3d3;
				border-bottom:1px solid #d3d3d3;
			}
			
			.border-top-white{
				border-top: 1px solid #ffffff;
			}
			
			.border-top-none{
				border:0px solid none;
			}
			
			.border.gray{
				border-color: #d3d3d3;
			}
			
			.border-gray{
				border: 1px solid #d3d3d3;
			}
			
			.border.solid{
				border-style:solid;
			}
			
			.border.thick{
				border-width: 3px;
			}
			
			.border-thick{
				border-width: 3px;
			}
			
			.border-radius-10{
				border-radius: 10px;
			}
			
			.padding{
				padding:10px;
			}
			
			.padding-hor-5{
				padding-left:5px;
				padding-right: 5px;
			}
			
			.padding-ver-15{
				padding-top:15px;
				padding-bottom:15px;
			}
			
			.margin-hor{
				margin-left:10px;
				margin-right:10px;
			}
			
			.margin-left{
				margin-left:10px;
			}
			
			.vertical-middle{
				vertical-align: middle;
			}
			
			.padding-5{
				padding:5px;
			}
			
			.padding-hr-5{
				padding-left:5px;
				padding-right:5px;
			}
			
			.padding-hr-10{
				padding-left:10px;
				padding-right:10px;
			}
			
			
			/* --- buttons style ----------------------------------------------------------------------- */
			
			
			/*--- list Style------------------------------------------------------------------------------------------*/
			.list{
				
			}
			
			.list>ul{
				display: flex;
			}
			
			/* ---------------------- */
			
			.list.list-horizontal>ul{
				flex-direction: row;
			}
			
			/* ---------------------- */
			
			.list.list-vertical>ul{
				flex-direction: column;
			}
			
			
			/* ---  ----------------------------------------------------------------------- */
			
			
			.-list-{
				display: flex;
			}
			
			.-list-.horizontal{
				flex-direction: row;
			}
			
			.-list-.horizontal.center{
				justify-content: center;
			}
			
			.-list-.vertical{
				flex-direction: column;
			}
			
			.-list-.wrap{
				flex-wrap: wrap;
			}
			
			.-list-.nowrap{
				flex-wrap: nowrap;
			}
			
			.-list-.wrap-reverse{
				flex-wrap: wrap-reverse;
			}
			
			
			/*--- Layout Style------------------------------------------------------------------------------------------*/
			.linear-layout {
				display: flex;
			}
			
			.linear-layout .expand{
				flex-grow : 1;
			}
			
			.linear-layout,
			.linear-layout.horizontal {
				flex-direction: row;
			}
			
			.linear-layout.center,
			.linear-layout.horizontal.center {
				justify-content: center;
			}
			
			.linear-layout.vertical-center,
			.linear-layout.horizontal.vertical-center {
				align-items:center;	
			}
			
			.linear-layout.space-between,
			.linear-layout.horizontal.space-between{
				justify-content: space-between;
			}
			
			.linear-layout.vertical-center,
			.linear-layout.horizontal.vertical-center {
				
			}
			
			.linear-layout .expand
			.linear-layout.horizontal .expand {
				flex-grow:1;
			}
			
			.linear-layout.vertical {
				flex-direction: column;
			}
			
			.linear-layout.vertical .align-self-left {
				align-self: flex-start;
			}
			
			.linear-layout.vertical .align-self-right {
				align-self: flex-end;
			}
			
			.linear-layout.vertical .align-self-center{
				align-self: center;	
			}
			
			.linear-layout.vertical .align-content-left {
				align-content: flex-start;
				text-align: left;
			}
			
			.linear-layout.vertical .align-content-right {
				align-content: flex-end;
				text-align: right;
			}
			
			.linear-layout.vertical .align-content-center{
				align-content: center;
				text-align: center;
			}
			
			
			
			/* === New Style =================================================================================== */
			
			/* --- reset 설정-------------------------------------------------------- */
			
			.-reset-.line-height{
				line-height: normal;
			}
			
			/* --- cursor 설정-------------------------------------------------------- */
			
			.pointer{
				cursor: pointer;
			}
			
			/* --- margin 설정-------------------------------------------------------- */
			
			.margin-top{
				margin-top:10px;
			}
			
			.margin-top1{
				margin-top: 20px;
			}
			
			.margin-top2{
				margin-top: 30px;
			}
			
			.margin-top3{
				margin-top: 40px;
			}
			
			.-margin-.top{
				margin-top: 10px;
			}
			
			.-margin-.top.t20{
				margin-top: 20px;
			}
			
			.-margin-.top.t40{
				margin-top: 40px;
			}
			
			
			.-margin-.bottom{
				margin-bottom: 10px;
			}
			
			.-margin-.bottom.b20{
				margin-bottom: 20px;
			}
			
			/* --- padding --------------------------------------------------------------- */
			
			.-padding-{
				padding:10px;
			}
			
			/* --- border --------------------------------------------------------------- */
			.-border-{
				/* border: 1px double #cfcfcf; */
			}
			
			.-border-.all.green{
				border: 2px solid #8cba35;
			}
			
			.-border-.all.orange{
				border: 2px solid #ff6a00;
			}
			
			.-border-.top{
				border-top: 1px double #cfcfcf;
			}
			
			.-border-.none{
				border-top: 1px double #cfcfcf;
			}
			
			.-border-.top.green,
			.-border-.top.t-green
			{
				border-top: 2px solid #8cba35;
			}
			
			.-border-.top.orange,
			.-border-.top.t-orange{
				border-top: 2px double #ff6a00;
			}
			
			.-border-.bottom{
				border-bottom: 1px double #cfcfcf;
			}
			
			.-border-.bottom.green
			.-border-.bottom.b-green{
				border-bottom: 2px solid #8cba35;
			}
			
			.-border-.bottom.orange
			.-border-.bottom.b-orange{
				border-bottom: 2px solid #ff6a00;
			}
			
			.-border-.right{
				border-right: 1px double #cfcfcf;
			}
			
			.-border-.right.green
			.-border-.right.b-green{
				border-right: 2px solid #8cba35;
			}
			
			.-border-.right.orange
			.-border-.right.b-orange{
				border-right: 2px solid #ff6a00;
			}
			
			.-border-.radius{
				border-radius: 10px;
			}
			
			/* --- width --------------------------------------------------------------- */
			
			.-width-.w100p{
				width:100%;
			}
			
			.-width-.auto{
				width:auto;
			}
			
			/* ---- dispaly 설정 ------------------------------------------------------ */
			
			.block{
				display: block;
			}
			
			/* ---- text 설정 ------------------------------------------------------ */
			.-inline-{
				
			}
			
			.-inline-.center{
				text-align: center;
			}
			
			.-inline-.left{
				text-align: left;
			}
			
			.-inline-.right{
				text-align: right;
			}
			
			.text-yellow{
				color:#ffff00;
			}
			
			.-text-{
				
			}
			
			.-text-.left{
				text-align: left;
			}
			
			.-text-.center{
				text-align: center;
			}
			
			.-text-.right{
				text-align: right;
			}
			
			.-text-.middle{
				vertical-align: middle;
			}
			
			.-text-.orange{
				color: #ff6a00;	
			}
			
			.-text-.white{
				color: #ffffff;	
			}
			
			.-text-.blue{
				color: #0000ff;	
			}
			
			.-text-.green{
				color: #8cba34;	
			}
			
			.-text-.dark-gray{
				color: #292929;	
			}
			
			.-text-.black{
				color: #000000;	
			}
			
			.-text-.bold{
				font-weight: bold	
			}
			
			.-text-.underline{
				text-decoration: underline;
			}
			
			/* --- background style-------------------------------------------------------------------- */
			.-bg-{
				
			}
			
			.-bg-.beige{
				background: beige;
			}
			
			.-bg-.green{
				background: #8cba34;
			}
			
			.-bg-.orange{
				background: #ff6a00;
			}
			
			/* --- symbol style ----------------------------------------------------------------------- */
			
			.-symbol-{
				background: url("../images/point.png") no-repeat left center;
				padding-left:10px;
			}
			
			
			.-screen-{
				opacity:0;
				width:100%;
				height:100%;
				background: #000000;
				position: absolute;
				left: 0px;
				top: 0px;
				transition:500ms;	
			}
			.-screen-:hover{
				opacity:0.8;
			}
			
			
			/* --- buttons style ----------------------------------------------------------------------- */
			.btn {
				display: inline-block;
				text-align: left;
				vertical-align: middle;
				text-indent: -999px;
				overflow: hidden;
				cursor: pointer;
				border: 0px;
			}
			
			.btn-text{	
				display: inline-block;
			    padding: 6px 12px;
			    margin-bottom: 0;
			    font-size: 11px;
			    font-weight: bold;
			    line-height: 1.42857143;
			    text-align: center;
			    white-space: nowrap;
			    vertical-align: middle;
			    -ms-touch-action: manipulation;
			    touch-action: manipulation;
			    cursor: pointer;
			    -webkit-user-select: none;
			    -moz-user-select: none;
			    -ms-user-select: none;
			    user-select: none;
			    background-image: none;
			    border: 1px solid transparent;
			    border-radius: 4px;
			}
			
			.btn-search {
				width: 49px;
				height: 23px;
				background: url("../images/btn-search.png") no-repeat center;
			}
			
			.btn-pay {
				width: 85px;
				height: 26px;
				background: url("../images/course/btn-pay.png") no-repeat center;
			}
			
			.btn-list {
				width: 64px;
			    height: 23px;
			    background: url(../images/btn-list.png) no-repeat center;
			}
			
			.btn-reg {
				width: 71px;
			    height: 23px;
			    background: url(../images/btn-reg.png) no-repeat center;
			}
			
			.btn-ask {
			    width: 71px;
			    height: 23px;
			    background: url(../images/btn-ask.png) no-repeat center;
			}
			
			.btn-edit {
				width: 71px;
			    height: 23px;
			    background: url(../images/btn-edit.png) no-repeat center;
			}
			
			.btn-write {
			    width: 71px;
			    height: 23px;
			    background: url(../images/btn-write.png) no-repeat center;
			}
			
			.btn-default {
				min-width:71px;
			    padding: 3px 8px;
			    color: #fff;
			    background-color: #759d2a;
			    border-color: #608618;
			}
			
			.btn-default:hover{
			    background-color: #449d44;
			    border-color: #398439;
			
			}
			
			.btn-cancel {
				min-width:71px;
			    padding: 3px 8px;
			    color: #fff;
			    background-color: #1b1b1b;
			    border-color: #2b2b2b;
			}
			
			.btn-cancel:hover{
			    background-color: #3b3b3b;
			    border-color: #2b2b2b;
			
			}
			
			.btn-save {
			    width:64px;
			    height:23px;    
			    background:url("../images/btn-save.png") no-repeat center;
			}
			
			/* main .btn-cancel {
			    width: 64px;
			    height: 23px;
			    background: url(../images/btn-cancel.png) no-repeat center;
			} */
			
			/*=== Component Style =============================================================*/
			
			.list-community-index{
				
			}
			
			.list-community-index>ul{
				height: 170px;
				margin-top: 10px;
				display: flex;
				justify-content: space-between;
				flex-wrap:wrap;
				padding: 10px;
			}
			
			.item-community{
				flex-grow: 1;
				margin-right: 10px;
			}
			
			.item-community:last-child{
				margin-right: 0px;
			}
			
			.item-community .visual{	
				height: 110px;
				position: relative;
				display: flex;
			}
			
			.item-community .visual .info{
				width:100px;
				min-width:100px;
				text-align:center;
				float:left;
				background: #00c73c;
				font-size: 12px;
				font-weight: bold;
				color: #ffffff;
				padding: 5px;
			}
			
			.item-community .visual .info .count{
				text-align: center;
				margin-top:30px;
				font-size: 20px;
				
				/* display: flex;
				justify-content: center; */
			}
			
			.item-community .title{
				white-space: nowrap;
				width: 300px;
				overflow: hidden;
				text-overflow: ellipsis;
				font-size: 14px;
				font-weight: bold;
				color: #595959;
				padding: 5px;
				text-align: center;
				line-height: 25px;
			}
			
			.item-community.question .visual{
				background: url('../images/bg-question.png') no-repeat center top;	
				background-size: cover;
			}
			.item-community.question .visual .info{
				background: #00c73c;
			}
			.item-community.talk .visual{
				background: url('../images/bg-talk.png') no-repeat center;	
			}
			.item-community.talk .visual .info{
				background: #74b0ee;
			}
			.item-community.join .visual{
				background: url('../images/bg-reg.png') no-repeat center;	
			}
			.item-community.join .visual .info{
				background: #ffa868;
			}
			
			/* --- .item-community.join의 list-join-member -------------------------------------------------------------------- */
			.list-join-member{
				width:100%;
				overflow: hidden;
			}
			
			.list-join-member>ul{
				padding:3px;
			}
			
			.item-join-member{
				
				color:#ffffff;	
				font-size:15px;
				
				border:1px solid #e9e9e999;
				border-radius: 5px;
				margin-bottom:2px;
				display: flex;
				padding:3px;
				
				background: #00000055;
			}
			
			.item-join-member>*{
				vertical-align: middle;
			}
			
			.item-join-member>div:first-child>span{
				display:inline-block;
				width: 40px;
				height: 40px;
				border: 1px solid #595959;	
				border-radius: 20px;
				
				background-size:contain;
				
				box-shadow: 0 4px 15px 0 rgba(0, 0, 0, 0.15);
				
			}
			
			.item-join-member>div:first-child+div{
				
				text-indent: 10px;	
				font-size:11px;
			}
			
			.item-join-member>div:first-child+div>div:first-child{
				height: 25px;
				line-height: 25px;
				font-size: 15px;
			}
			
			
			/* main .class-room {
				min-height: 50px;
			}
			main .class-room .category {
				box-shadow: inset 1px 1px 2px #979797;
				text-shadow: 1px 1px 2px #979797;
				color: #000000;
				background: #e9e9e9;
			}
			 */
			 
			 /* --- course list ------------------------------------------------ */
			
			.list-course-index>h1{
					font-size: 14px;
					font-family: "맑은 고딕";
					font-weight: bold;
					padding-left: 65px;
					height: 44px;
					line-height: 44px;
					background: url(../images/icon-head-phone.png) no-repeat left top;
				}
				
				.list-course-index>h1+div{
					padding-top: 15px;
					margin-top: -7px;
					height:30px;
					background: url(../images/bar.png) no-repeat left top;
				}
				
				.list-course-index > ul {	
					flex-wrap: wrap;
					padding-left: 10px;
					padding-top: 10px;
					width: 590px;
					margin-left: auto;
					margin-right: auto;
					width: 960px;
				}
				
				
				.list-course-index > ul+div {	
					border-top: 1px double #cfcfcf;
				}
				
			
			.list-course-index.youtube>h1{
				background: url(../images/youtube-icon-sm.png) no-repeat 10px top;
			}
			
			
			
			.item-course.small {
				box-sizing: border-box;
				display: flex;
				height: 80px;
				padding: 10px;
				border: 1px solid #e9e9e9;
				background: #ffffff;
			}
			
			.item-course.small.event {
				background: #ffffff url("../images/course/bg-title-event-box.png")
					no-repeat right bottom;
			}
			
			.item-course.small.normal {
				background: url("../images/course/bg-title-normal-box.png")
					no-repeat right bottom;
			}
			
			.item-course.small.new {
				background: url("../images/course/bg-title-new-box.png") no-repeat
					right bottom;
			}
			
			.item-course.small .logo {
				width: 70px;
				overflow: hidden;
			}
			
			.item-course.small .logo picture {
				display: block;
				width: 100%;
			}
			
			.item-course.small .logo .img {
				vertical-align: middle;
				/* width: 100%; */
			}
			
			.item-course.small .book {
				margin-left: 20px;
				display: flex;
				width: 40%;
			}
			
			.item-course.small .book .cover {
				width: 70px;
			}
			
			.item-course.small .book  .notice {
				margin-top: 5px;
				color: #ff6300;
			}
			
			.item-course.small .info {
				flex-grow: 1;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
				padding-left: 10px;
				font-size: 11px;
				color: #000000;
			}
			
			.item-course.small .info .footer {
				display: flex;
			}
			
			.item-course.small .logo img {
				height: 100%;
				box-shadow: inset 1px 0px 3px #000000;
			}
			
			.item-course.small .title {
				color: #000000;
				font-size: 13px;
				font-weight: bold;
			}
			
			.item-course.small .update {
				margin-left: 20px;
			}
			
			/* --- course Style--------------------------------------------------------------------------------- */
			
			.item-course.normal {
				padding: 0px;
				display: flex;
				flex-direction: column;
				flex-grow: 1; /* 각 아이템이 너비를 가지지 않으면 비율이 다를 수 있음 */	
				min-width: 180px;
				width: 180px;
				height: 200px;
				max-width: 180px;
				margin-right: 10px;
				margin-bottom: 10px;
				
				border: 1px solid #c9c9c9;
				box-shadow: 0 4px 15px 0 rgba(0, 0, 0, 0.15);
			}
			
			.item-course.normal>div:first-child{
				width:100%
			}
			
			.item-course.normal>div:first-child img {
				width: 100%;
			}
			
			.item-course.normal>div:nth-child(2) {	
					flex-grow: 1;
					display: flex;
					flex-direction: column;
					justify-content: space-between;
					padding: 10px 10px 20px 10px;
				}
			
			.item-course.normal div:nth-child(2)>div:first-child span {
				/* 문자열의 생략부호가 나오게 하기 위한 필수 속성들 */
				/* white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis; */
				display: block;
				width: 160px;
				color: #000000;
				font-size: 13px;
				/* font-weight: bold; */
			}
			
			.item-course.normal .info {
				flex-grow: 1;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
				padding: 10px 10px 20px 10px;
			}
			
			.item-course.normal .info > *{
				margin-top: 10px;
			}
			
			.item-course.normal.normal {
				background: url("../images/course/bg-title-normal-box.png") no-repeat
					right bottom;
			}
			.item-course.normal.new {
				background: url("../images/course/bg-title-new-box.png") no-repeat
					right bottom;
			}
			.item-course.normal.event {
				background: url("../images/course/bg-title-event-box.png") no-repeat
					right bottom;
			}
			.item-course.normal .footer {
				display: flex;
				flex-direction: column;
			}
			.item-course.normal .footer .update {
				margin: 0px;
			}
			
			.item-course.normal .screen{
				opacity:0;
				width:100%;
				height:100%;
				background: #000000;
				position: absolute;
				left: 0px;
				top: 0px;
				transition:500ms;	
				
				cursor: pointer;
				text-align: center;
				color:#ffffff;
			}
			
			.item-course.normal .screen:hover{
				opacity:0.8;
			}
			
			/* --- list-basket ---------------------------------------------------------------------------------------- */
			.list-basket{
				
			}
			
			.item-basket-sales td{
				padding:10px;
				line-height: 25px;
			}
			/* --- progress --------------------------------------------------------------- */
			
			.progress{
				
			}
			
			.progress .bar{
				width:100%;
				height: 5px;
				background: gray;
				
			}
			#footer{
				background: #313131;	
				height: 100px;
				padding:20px;	
			}
			
			#footer .content-container{
				display: flex;
				flex-flow:row wrap;
				flex:1;
			}
			
			#footer-logo{
				width:205px;
			}
			
			#company-info{
				width:755px;
				display: flex;
				flex-flow:column;
			}
			
			#company-info dl{
				display: flex;
				flex-flow:row wrap;	
			}
			
			#company-info dl dd{
				margin-right:50px;
			}
			
			
			/* --- mobile ----------------------------------------------------- */
			/* #footer {
			    height: 50px;
			    line-height: 50px;
			    background: #313131;
			    color: #fff;
			    font-size: 13px;
			    text-align: center;
			} */
			/*--- Component Style------------------------------------------------------------------------------------------*/
			#notice {
				display: flex;
				align-items: center;
				height: 30px;
				line-height: 30px;
				background: #8CBA34;
				min-width: 90px;
			}
			
			#notice .content-container {
				padding-left: 34px;
				background: url("../images/icon-news.png") no-repeat 10px center;
			}
			
			#notice .title {
				flex-grow: 1;
				font-size: 11px;
				font-weight: bold;
				color: #ffffff;
			}
			
			#information{
				height: 170px;
			}
			
				#information .text-center{
					text-align: center;
				}
			
			
				#information .content-container{
							
					display: flex;	
					
					border-bottom: 1px solid #8cba34;
				}
				
				#information .title{
					color:#000;
				    font-size: 14px;
				    font-weight: bold;
				}
			
				#information section{
					width:260px;
					border-left: 1px solid #8cba34;
					padding:25px 20px;
				}
				
				#information section:first-child{
					border-left: none;
				}
			
				#information .course-info{
					flex-grow:1;
				}
				
					#information .course-info .list{
						box-sizing:border-box;
					    border: 1px solid #B9B9B9;
					    background: #e7f5ce;
					    width: 410px;
					    height: 90px;
					    line-height: 75px;
					    text-align: center;
					    color: #5b5b5b;
					    
					    margin-top:20px;
					    margin-left: auto;
					    margin-right: auto;
					}
					
					#information .course-info .list li{
						text-align: center;
					}
				
				#information .guide{
					
				}
				
				#information .guide .margin-top{
					margin-top: 20px;
				}
				
				#information .notice{
					
				}
				
					#information .notice .title{
						width: 110px;
					    background: #83b129;
					    
					    font-size: 13px;
					    font-weight: bold;
					    color: #ffffff;
					    height: 20px;
					    line-height: 20px;
					    text-align: center;
					}
					
					#information .notice .list{
						width: 240px;		   
					    font-family: 돋움;
					    font-size: 12px;
					    
					    margin-top:10px;
					}
					
					#information .notice-title{
						display: inline-block;
					    width: 150px;
					    overflow: hidden;
					    white-space: nowrap;
					    text-overflow: ellipsis;
					}
					
					#information .notice .list li
					{
						position: relative;
					    margin-top: 5px;
					    padding-left:10px;
					    background: url("../images/point.png") no-repeat 0px center;
					}
					
					#information .notice .list li .notice-title{
						vertical-align: middle;
					}
					
			/* ----------------------------------------------------------------------- */
			
			.item-community-answerer{
				overflow: hidden;
			}
			
			.list-answerer{
			    background: #00000077;
			    padding: 5px;
			    
			}
			
			.item-answerer{
				height:50px;
				color: #ffffff;
			    font-size: 15px;
			    border: 1px solid #e9e9e999;
			    border-radius: 5px;
			    margin-bottom: 2px;
			    display: flex;
			    padding: 5px;
			    background: #00000055;
			}
			
			.item-answerer>div:nth-child(1){
				width:30px;
				line-height:40px;
				
				text-align:center;
				height: inherit;
				
			}
			
			.item-answerer>div:nth-child(2){
					
			}
			
				.item-answerer>div:nth-child(2)>span{
					display:inline-block;
					background: #777777 url("../../../resource/images/profile.png") no-repeat center;
					background-size:contain;
					width:35px;
					height: 35px;
					border-radius: 25px;
					
				}
			
			.item-answerer>div:nth-child(3){
				font-size:11px;
				padding:5px 5px 5px 10px;
			}
			
			/*---- Responsive Style----------------------------------------------------------------------------*/
			/* @media all and (min-width:960px) { */
				.content-container {
					display: block;
					width: 960px;
					box-sizing: border-box;
					position: relative;
					margin-left: auto;
					margin-right: auto;
				}
			
			
				/* --- Notice Style---------------------------------------------------------------- */
					
				
				#guide > div{
					border-bottom: 1px solid #8cba34;
				}
				
				main{
					margin-top:20px;
				}	
			
				/* --- course Style--------------------------------------------------------------------------------- */
			
				#visual{	
					/* padding-top:50px; */
					height: 150px;
					background: #313131;
					
					/* overflow: hidden; */	
					/* position: relative; */
				}
				
				#visual .banner{
					height: inherit;
					
					/* display: flex;	
					width:300%;
					
					position:absolute;
					left:0px;
					margin-left:-100%; */
					
					transition-duration: 1s;
				}
				
				#visual .banner li{	
					position:absolute;
					top:0px;
					
					height: inherit;
					width:100%;
				}
				
				#visual .mov-button{
					position: absolute;
					
					display: flex;
					justify-content: space-between;
					align-items:center;
					
					width:100%;
					height: 150px;
				}
				
				.prev-button{
					text-indent:-999px;
					overflow:hidden;
					z-index: 99;
					
					width:35px;
					height:52px;
					background: url("../images/icon-banner-nav.png") no-repeat -35px center ;
					
				}
				
				.next-button{
					text-indent:-999px;
					overflow:hidden;
					z-index: 99;
					
					width:35px;
					height:52px;
					/* background: url("../images/icon-banner-nav.png") no-repeat -105px center ; */
					background: url("../images/icon-banner-nav.png") no-repeat -69px center ;
				}
							
	    </style>
	</head>
	<body>
		<!-- ---------------------------<header>--------------------------------------- -->
	    <header id="header">
	        <div class="content-container">
	            <h1 id="logo">
	                <a href="/index">
	                    <img src="/images/logo.png" alt="뉴렉처 온라인" />
	                </a>
	            </h1>
	            <section>
	                <h1 class="hidden">헤더</h1>
	                <nav id="main-menu">
	                    <h1>메인메뉴</h1>
	                    <ul>
	                        <li><a href="/noticeList">Community</a></li>
	                    </ul>
	                </nav>
	                <div class="sub-menu">
	                    <nav id="acount-menu">
	                        <h1 class="hidden">회원메뉴</h1>
	                        <ul>
	                            <li><a href="/index">HOME</a></li>
	                            <!-- 접속중인 세션이 로그인 중이 아니라면 "/memberLogin"으로  -->
	                            <c:if test="${sessionScope.userMember == null}">
	                            	<li><a href="/memberLogin">로그인</a></li>
	                            </c:if>
	                            <!-- 접속중인 세션이 로그인 중이라면 "/memberLogout"으로  -->
	                            <c:if test="${sessionScope.userMember != null}">
	                            	<li><a href="/memberLogout">로그아웃</a></li>
	                            </c:if>
	                            <li><a href="/memberAgree">회원가입</a></li>
	                        </ul>
	                    </nav>
	                    <nav id="member-menu" class="linear-layout">
	                        <h1 class="hidden">고객메뉴</h1>
	                        <ul class="linear-layout">
	                            <!-- 접속중인 세션이 로그인 중이 아니라면 "/memberLogin"으로  -->
	                            <c:if test="${sessionScope.userMember == null}">
	                            	<li><a href="/memberLogin"><img src="/images/txt-mypage.png" alt="마이페이지" /></a></li>
	                            </c:if>
	                            <!-- 접속중인 세션이 로그인 중이라면 "/memberMyPage"으로  -->
	                            <c:if test="${sessionScope.userMember != null}">
	                            	<li><a href="/memberMyPage"><img src="/images/txt-mypage.png" alt="마이페이지" /></a></li>
	                            </c:if>
	                        </ul>
	                    </nav>
	                </div>
	            </section>
	        </div>
	    </header>
	    <!-- --------------------------- <body> --------------------------------------- -->
	    <div id="visual" class="">
	        <div class="content-container">
	            <h2 class="hidden">신규 강좌목록</h2>
	            <ul class="banner">
	                <li class="banner1">
	                       <img src="/images/banner-java.png" data-id="1"/>
	                </li>
	            </ul>
	        </div>
	    </div>
	    <div id="notice">
	        <div class="content-container">
	            <span class="title">제대로된 전문가들이 만들어가는 <span style="color:yellow;font-size:15px;">IT PROFESSIONAL <span style="color:#00ffff;">NEW</span>
	                    ONLINE <span style="color:#00ffff;">LECTURE</span> MARKET</span>
	            </span>
	        </div>
	    </div>
	    <!-- ----- 공지사항 줄 ------------------------------------------------------------------------------ -->
	    <div id="information">
	        <div class="content-container">
	            <section class="guide">
	                <h1 class="title">강의 플레이어 사용방법 안내</h1>
	                <div class="margin-top">
	                    <img src="images/customer/installInfo.png" />
	                </div>
	            </section>
	            <section class="course-info">
	                <h1 class="title text-center">뉴렉처 하이브리드 과정 모집</h1>
	                <ul class="list">
	                    <li>현재 모집 과정이 없습니다.</li>
	                </ul>
	            </section>
	            <section class="notice">
	                <h1 class="title">공지사항</h1>
	                <ul class="list margin-top">
	                	<!-- IndexController로부터 받은 공지사항 목록 5개 (list) -->
	                	<!-- list를 반복문을 돌려 각각 n으로 명함 -->
	                	<c:forEach var="n" items="${list}">
	                    <li>
	                        <span class="notice-title">
	                        	<!-- n에서 제목을 출력하고, 클릭시 noticeDetail로 가는데 id를 가지고 가야하기 때문에 n.id를 붙여줌 -->
	                            <a href="/noticeDetail?id=${n.nid}">${n.title}</a>
	                        </span>
	                        <!-- n에서 등록일자를 출력 -->
	                        <span>${n.regDate}</span>
	                    </li>
	                    </c:forEach>
	                </ul>
	            </section>
	        </div>
	    </div>
	    <!-- ----- 강좌 목록 시작 줄 --------------------------------------------------------------------------------------------------------- -->
	    <main id="course">
	        <section class="content-container list list-horizontal list-course list-course-index">
	            <h1>온라인 <span class="color-orange">단과 과정</span></h1>
	            <div>
	            </div>
	            <ul>
	                <li class="item-course normal event">
	                    <div>
	                        <img src="images/course/java.png" />                        
	                    </div>
	                    <div>
	                        <div>
	                            <span class="text-strong text-ellipsis">자바 프로그래밍</span>
	                        </div>
	                        <div class="price">
	                            <span class="normal deprecated">
	                                <span class="text-gray">
	                                    22,000
	                                </span> 원
	                            </span> <span class="event">
	                                <span class="color-red text-strong">
	                                    0
	                                </span>원
	                            </span>
	                        </div>
	                        <div class="footer text-strong">
	                            <span class="writer">선생님 : newlec </span>
	                            <span class="update">개설일 : 2019-09-07
	                            </span>
	                        </div>
	                    </div>
	                </li>
	            </ul>
	        </section>
	    </main>
	    <!-- ------------------- <footer> --------------------------------------- -->
	    <footer id="footer">
	        <div class="content-container">
	            <h2 id="footer-logo"><img src="images/logo-footer.png" alt="회사정보"></h2>
	            <div id="company-info">
	                <dl>
	                    <dt>주소:</dt>
	                    <dd>서울특별시 </dd>
	                    <dt>관리자메일:</dt>
	                    <dd>admin@newlecture.com</dd>
	                </dl>
	                <dl>
	                    <dt>사업자 등록번호:</dt>
	                    <dd>111-11-11111</dd>
	                    <dt>통신 판매업:</dt>
	                    <dd>신고제 1111 호</dd>
	                </dl>
	                <dl>
	                    <dt>상호:</dt>
	                    <dd>뉴렉처</dd>
	                    <dt>대표:</dt>
	                    <dd>홍길동</dd>
	                    <dt>전화번호:</dt>
	                    <dd>111-1111-1111</dd>
	                </dl>
	                <div id="copyright" class="margin-top">Copyright ⓒ newlecture.com 2012-2014 All Right Reserved.
	                    Contact admin@newlecture.com for more information</div>
	            </div>
	        </div>
	    </footer>
	</body>
</html>