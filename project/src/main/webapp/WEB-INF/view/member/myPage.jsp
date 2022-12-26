<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>코딩 전문가를 만들기 위한 온라인 강의 시스템</title>
		<style>
			#visual .content-container{	
		        height:inherit;
		        display:flex; 
		        align-items: center;
		        
		        background: url("/images/mypage/visual.png") no-repeat center;
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
			/* 구조변경에 용이한 선택자 */
			.content-container{	
				height: 100%;
				width: 960px;
				margin:auto;
				/* margin-left:auto;
				margin-right: auto; */
			}
			/* ----------<level 3>------------------------------ */
			
			#body{	
				min-height: 300px;
				border-top:5px solid #8CBA34;
				margin-top:1px;
			}
			
			#body > .content-container{ 
				background:url("../images/bg-body.png") repeat-y center;
				position: relative;
				padding-bottom:30px;
				/*clearfix*/
				overflow: auto;
			  	zoom: 1;
			}
			
			main {
				box-sizing:border-box;
				min-height: inherit;
				width: calc(100% - 205px);/* 755px; */	
				float:left;
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
			
			.aside {
				min-height: inherit;
				width: 205px;
				float: left;
				background: url("../images/bg-aside-title.png") no-repeat;
			}
			
			.aside .margin-top{
				margin-top: 45px;
			}
			
			.aside > h1 {
				font-family: 맑은 고딕, 고딕, sans-serif;
				font-size: 24px;
				font-weight: bold;
				color: #000;
				margin-top: 43px;
			}
			
			.aside .menu.text-menu {
				margin-top: 20px;
				width: 180px;
			}
			
			.aside .menu.text-menu > h1 {
				font-family: 맑은 고딕, 고딕, sans-serif;
				font-size: 13px;
				font-weight: bold;
				color: #000;
				padding-left: 26px;
				background: url(../images/icon-recommend.png) no-repeat left center;
			}
			
			.aside .menu.text-menu li {
				background: url("../images/bg-aside-menu-hsp.png") repeat-x left bottom;
				height: 26px;
				line-height: 26px;
			}
			
			.aside .menu.text-menu li:last-child {
				border-bottom: 1px solid #d9d9d9;
				background: none;
			}
			
			.aside .menu.text-menu li .current {
			    background: url(../images/icon-current.png) no-repeat 15px center;
			}
			
			.aside .menu.text-menu li a {
				font-family: 맑은 고딕, 고딕, sans-serif;
				font-weight: bold;
				color: #808080;
				padding-left: 26px;
				text-decoration: none;
			}
			
			.aside .menu.text-menu a:hover, .aside-menu .active {
				background: url("../images/icon-current.png") no-repeat 15px center;
			}
			
			.aside .menu.first {
				margin-top: 45px;	
			}
			
			.aside .menu.first > h1 {
				color: #ffffff;
				height: 27px;
				line-height: 27px;
				padding-left: 10px;
				font-size: 12px;
				font-weight: bold;
				text-shadow: 0.5px 0.5px 1px #000000;
				background: url(../images/bg-aside-sub-title.png) no-repeat 0px 0px;
			}
			
			.aside .menu.text-menu.first ul,
			.aside .menu.text-menu.first .list {
				border-top: none;
				margin-top: 0px;
			}
			
			.aside .menu {
				margin-top: 20px;
			}
			
			.aside .menu > h1 {
				font-family: 맑은 고딕, 고딕, sans-serif;
				font-size: 13px;
				font-weight: bold;
				color: #000;
				padding-left: 26px;
				background: url("../images/icon-recommend.png") no-repeat left center;
			}
			
			.aside .menu > ul {
				margin-top: 10px;
			}
			
			/* ==== Desktop만을 위한 Style -- 너비 960px 이상 =========================================================== */
			@media all and (min-width:960px) {
			}
			
			/* ==== 테블릿 이하에서 달라질 공통 Style 오버라이드-- 너비 959px 이하 =========================================================== */
			@media all and (max-width:959px) {
				#aside {		
					position: fixed;
					top: 0px;
					left: -205px;
					height: 100%;
					background: #ffffff;
					z-index: 101;
				}
			}
			
			/* ==== 중간 크기 장치만을 위한 Style -- 너비 640px~ 959px=========================================================== */
			@media all and (min-width:640px) and (max-width:959px) {
					#aside {		
					position: fixed;
					top: 0px;
					left: -205px;
					height: 100%;
					background: #ffffff;
					z-index: 101;
				}
			}
			
			/* ==== 스마트 폰처럼 작은 크기 장치만을 위한 Style -- 너비 639px 이하=========================================================== */
			@media all and (max-width:639px) {
			}
			main {
				position: relative;
				min-height: inherit;
				width: 755px;
				padding-left: 35px;
				padding-top: 45px;
				padding-bottom:80px;
				float: left;
				display: flex;
				flex-direction: column;
			}
			
			main .stretch-child{
				display: flex;	
				align-items: stretch;
				align-content: stretch;	
			}
			
			main .stretch-child textarea{
				align-self: stretch;
			}
			
			main .h300{
				height: 300px;
			}
			
			main .width-match{
				width:100%;
			}
			
			main .bg-wood {
				background: url("../images/course/bg-wood.png");
			}
			
			main .border-bottom {
				border-bottom: 1px solid #e9e9e9;
			}
			
			main .border-hard{	    
			    border: 5px solid #8CBA34;    
			    text-align: center;
			}
			
			main .align-left {
				align-self: flex-start;
			}
			
			main .align-center {
				align-self: center;
			}
			
			main .align-right {
				align-self: flex-end;
			}
			
			main .valign-middle {
				vertical-align: middle;
			}
			
			main .title {
				overflow: hidden;
				white-space: nowrap;
				text-overflow: ellipsis;
			}
			
			main .title.main {
				font-family: 맑은 고딕, 고딕, sans-serif;
				font-size: 21px;
				font-weight: bold;
				color: #646464;
				padding-left: 25px;
				background: url("../images/icon-main-title.png") no-repeat left center;
			}
			
			main .title.sub {
				font-family: 맑은 고딕;
				font-size: 14px;
				font-weight: bold;
				color: #191919;
				height: 30px;
				line-height: 30px;
				padding-left: 20px;
				background: url("../images/icon-sub-title.png") no-repeat 0px 10px;
			}
			
			main .margin-top {
				margin-top: 10px;
			}
			
			main .margin-top-20 {
				margin-top: 20px;
			}
			
			main .margin-bottom {
				margin-bottom: 10px;
			}
			
			main .padding-bottom {
				padding-bottom: 10px;
			}
			
			main .margin-top.first {
				margin-top: 49px;
			}
			
			/* --- border style------------------------------------------------------------------------- */
			main .border-dashed{
				border : 2px dashed #e9e9e9;
			}
			
			/* --- breadcrumb ----------------------------------------------------------------------------- */
			main .breadcrumb {
				position: absolute;
				right: 0px;
				top: 57px;
			}
			
			main .breadcrumb .list, main .breadcrumb ul {
				overflow: auto;
			}
			
			main .breadcrumb .item, main .breadcrumb li {
				float: left;
				padding-left: 10px;
				background: url("../images/icon-path.png") no-repeat left center;
			}
			
			main .breadcrumb .item:first-child, main .breadcrumb li:first-child {
				padding-left: 20px;
				background: url("../images/icon-home.png") no-repeat left center;
			}
			
			/* --- search-form ----------------------------------------------------------------------------------------- */
			main .search-form, main .search-form form {
				display: inline-block;
			}
			
			main .search-form form fieldset>* {
				vertical-align: middle;
			}
			
			main .search-form select {
				height: 20px;
				border: 1px solid #8CBA34;
			}
			
			main .search-form input[type="text"] {
				width: 150px;
				height: 20px;
				border: 1px solid #8CBA34;
			}
			
			/*---< pager style >-----------------------------------------------------------------------------*/
			
			.pager
			{
			    display:inline-block;
			}
			
			.pager-list,
			.pager > ul
			{
			    float:left;
			}
			
			.pager-item,
			.pager > div
			{
			    float:left;
			    width:15px;
			    height:15px;
			    line-height:15px;
			    text-align:center;
			}
			
			.pager li{
				width:15px;
				height: 15px;
				line-height: 15px;
				text-align: center;
				vertical-align: middle;
			}
			
			.pager-item:hover,
			.pager > div:hover
			{
			    text-decoration:underline;
			}
			
			.pager-item .btn-prev,
			.pager > div:first-child a,
			.pager > div:first-child span
			{
				width:15px;
				height:15px;
				background: url("../images/btn-prev.png") no-repeat center;
			}
			
			.pager-item .btn-prev,
			.pager > div:last-child a,
			.pager > div:last-child span
			{
				width:15px;
				height:15px;
				background: url("../images/btn-next.png") no-repeat center;
			}
			
			/* --- table style ----------------------------------------------------------------------- */
			main .table {
				display: table;
				table-layout: fixed;
				width: 100%;
				border-top: 2px solid #8cba35;
			}
			
			main .table input[type=text],
			main .table input[type=password],
			main .table input[type=email],
			main .table input[type=date],
			main .table input[type=number],
			main .table select
			{
				width:90%;
				vertical-align: middle;
				height: 24px;
				line-height: 24px;
				text-indent: 5px;
				border:1px solid #e9e9e9;
				border-radius: 5px; 
			}
			
			main .table input[type=text].width-auto,
			main .table input[type=password].width-auto,
			main .table input[type=number].width-auto,
			main .table select.width-auto{
				width: auto;
			}
			
			main .table input[type=text].width-half,
			main .table input[type=password].width-half,
			main .table input[type=email].width-half,
			main .table input[type=date].width-half,
			main .table select.width-half{
				width: 200px;
			}
			
			main .table input[type=text].width-small,
			main .table input[type=password].width-small,
			main .table select.width-small{
				width: 50px;
			}
			
			main .table input[type=text].width-small,
			main .table input[type=password].width-small,
			main .table select.width-auto{
				width: auto;
			}
			
			main .table textarea,
			main .table .textarea{
				/* border:1px solid #e9e9e9;
				border-radius: 10px; */
				
				padding: 5px;
				width:100%;
				min-height:400px;
				
				line-height: 24px; 
				/* text-align: center; */
			}
			
			main .table.border-top-default {
				border-top: 1px solid #e9e9e9;
			}
			
			main .table.border{
				border-left:1px solid #e9e9e9;
				border-right:1px solid #e9e9e9;	
			}
			
			main .table.border-top-none{
				border-top:0px solid #fff;
			}
			
			
			main .table.h50 th,
			main .table.h50 td
			{
				height: 50px;
			}
			
			main .table tr, main .table .tr {
				display: table-row;
				height: 30px;
			}
			
			main .table tr.content, main .table .tr.conent {
				display: table-row;
				height:auto;
				min-height: 200px;	
				line-height: 1.5em;
				color: #393939;	
			}
			
			main .table tr.hover:hover{
				background: #d6f4c1;
				cursor:pointer;
			}
			
			/* --- 셀의 모양 -------------------------- */
			
			main .table td, 
			main .table th, 
			main .table .td,
			main .table .th {
				display: table-cell;
				text-align: center;
				border-bottom: 1px solid #e9e9e9;
			}
			
			main .table.dashed td, 
			main .table.dashed th, 
			main .table.dashed .td,
			main .table.dashed .th {	
				border-bottom: 1px dashed #b0b0b0;
			}
			
			main .table th, main .table .th {
				background: #f5f5f5 url("../images/bg-title-sp.png") no-repeat left
					center;
			}
			
			main .table th:first-child, main .table .th:first-child {
				background: #f5f5f5;
			}
			
			main .table th.w40, main .table td.w40, main .table .th.w40, main .table .td.w40
			{
				width: 40px;
			}
			
			main .table th.w60, main .table td.w60, main .table .th.w60, main .table .td.w60
			{
				width: 60px;
			}
			
			main .table th.w100, main .table td.w100, main .table .th.w100, main .table .td.w100
			{
				width: 100px;
			}
			
			main .table th.w150, main .table td.w150, main .table .th.w150, main .table .td.w150
			{
				width: 150px;
			}
			
			main .table th.w180, main .table td.w180, main .table .th.w180, main .table .td.w180
			{
				width: 180px;
			}
			
			main .table tr.content td,
			main .table .tr.conent td{
				text-align: left;
				padding: 10px;
			}
			
			main .table tr.hidden,
			main .table .tr.hidden{
				display: none;
			}
			
			
			main .table td.title, 
			main .table .td.title {
				overflow: hidden;
				white-space: nowrap;
				text-overflow: ellipsis;
			}
			
			main .table td.indent {
				padding-left:10px;
			}
			
			main .table td.indent.inner {
				padding-left:30px;
			}
			
			main .table td .re{
				padding-left: 20px;
			    background: url(../images/icon-re.png) no-repeat left -5px;
			}
			
			main .table td.text-align-left{
				text-align: left;
			}
			
			main .table td.text-align-center{
				text-align: center;
			}
			
			main .table td.text-align-right{
				text-align: right;
			}
			
			/* --- to override ----------------------------------------------------------------------------------------- */
			
			main .hidden{
				display: none;
			}
			
			/* --- new style ---------------------------------------------------------------------------- */
			main .table td.-text-.indent{
				indent: 10px;
			}
			
			main .table td .-margin-.left{
				margin-left: 10px;
			}
			
			main .table td .-margin-.left.l5{
				margin-left: 5px;
			}
			
			main .table td .width.auto{
				width:auto;
			}
			
			main .table td.-text-.left{
				text-align: left;
			}
			
			main .table td.-text-.right{
				text-align: right;
			}
			
			/* td 태그 안에 있는 모든 img, label, input을 한번에 수직 가운데 정렬 하는 스타일 */
			main .table td.-text-.vertical.center > img,
			main .table td.-text-.vertical.center > label,
			main .table td.-text-.vertical.center > input{
				vertical-align: middle;
			}
			
			/* td 태그 안에 있는 모든 img, label, input에 각각 수직 가운데 정렬을 지정하는 스타일 */
			main .table td input.-text-.vertical.center,
			main .table td img.-text-.vertical.center,
			main .table td label.-text-.vertical.center{
				vertical-align: middle;
			}
			
			
			
			/* ----- player ------------------------------------------------------------------------ */
			main .player{
				display:inline-block;
				cursor: pointer;
			    width: 181px;
			    height: 40px;
			    line-height: 40px;
			    text-align: center;
			    border: 1px solid #ff7e00;
			    border-radius: 10px;
			    background: radial-gradient(ellipse at center, #ffd3a9 0%,#ff7e00 100%);
			}
			
			main .player > a,
			main .tools > a
			 {
			    color: #fff;
			    font-size: 14px;
			    font-family: "맑은고딕", "고딕", sans-serif;
			    font-weight: bold;
			}
			
			main .tools{
				display:inline-block;
				cursor: pointer;
			    width: 181px;
			    height: 40px;
			    line-height: 40px;
			    text-align: center;
			    border: 1px solid #76973e;
			    border-radius: 10px;
			    background: radial-gradient(ellipse at center, #8cb34a 0%,#76973e 100%);
			}
			
			/* === Main Component ===================================================== */
			/* --- pager style -------------------------------------- */
			.-pager-{
				
			}
			
			
			/* ==== Desktop만을 위한 Style -- 너비 960px 이상 =========================================================== */
			/* @media all and (min-width:960px) {
			} */
			
			/* ==== 테블릿 이하에서 달라질 공통 Style 오버라이드-- 너비 959px 이하 =========================================================== */
			/* @media all and (max-width:959px) {
				main {
					visual을 없애면서 마진을 주게 됨.
					margin-top: 50px;
					width: 100%;
					padding: 0px;
				}
				main .breadcrumb {
					display: none;
				}
				main .main.title {
					display: none;
				}
			} */
			
			/* ==== 중간 크기 장치만을 위한 Style -- 너비 640px~ 959px=========================================================== */
			/* @media all and (min-width:640px) and (max-width:959px) {
			} */
			
			/* ==== 스마트 폰처럼 작은 크기 장치만을 위한 Style -- 너비 639px 이하=========================================================== */
			/* @media all and (max-width:639px) {
			} */
			
			#visual{
				background: #313131 url("../images/bg-visual.png") no-repeat center;	
				height: 171px;
			}
			
		@import url("../sub-main.css");
		
		
		
		/* ==== Desktop만을 위한 Style -- 너비 960px 이상 =========================================================== */
		@media all and (min-width:960px) {
		
		}
		
		/* ==== 테블릿 이상 만을 위한 Style -- 너비 640px 이상 =========================================================== */
		@media all and (min-width:480px) {
		
		}
		
		/* ==== 테블릿 이하에서 달라질 공통 Style 오버라이드-- 너비 959px 이하 =========================================================== */
		@media all and (max-width:959px) {
		}
		
		/* ==== 중간 크기 장치만을 위한 Style -- 너비 640px~ 959px=========================================================== */
		@media all and (min-width:640px) and (max-width:959px) {
		}
		
		/* ==== 스마트 폰처럼 작은 크기 장치만을 위한 Style -- 너비 639px 이하=========================================================== */
		@media all and (max-width:639px) {
		
		}
		#visual .content-container{	
			height:inherit;
			display:flex; 
			align-items: center;
			
			background: url("../../images/mypage/visual.png") no-repeat center;
		}
		
		/* #visual .icon{
			background: url("../../images/lecture/visual-icon.png") no-repeat center;
			background-size:contain;
			height: inherit;
			width: 1px;
			flex-grow: 1;
		}
		
		#visual .text{
			background: url("../../images/lecture/visual-text.png") no-repeat center;
			background-size:contain;
			height: 93px;
			
			width: 1px;
			flex-grow: 1;
		} */
		
		
		/* ==== Desktop만을 위한 Style -- 너비 960px 이상 =========================================================== */
		@media all and (min-width:960px){
			
		}
		
		/* ==== 테블릿 이하에서 달라질 공통 Style 오버라이드-- 너비 959px 이하 =========================================================== */
		@media all and (max-width:959px){
			
		/* 	#visual{
				display:none; 일단 visual을 빼기로 함
		
			} */
		
		}
		
		/* ==== 중간 크기 장치만을 위한 Style -- 너비 640px~ 959px=========================================================== */
		@media all and (min-width:640px) and (max-width:959px){
			
		}
		
		/* ==== 스마트 폰처럼 작은 크기 장치만을 위한 Style -- 너비 639px 이하=========================================================== */
		@media all and (max-width:639px){
		/* 	#visual{
				height: 80px;
			}
			
			#visual .text{		
				height: 43px;
				
			} */
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
	             <nav id="main-menu">
                    <h1>메인메뉴</h1>
                    <ul>
                        <li><a href="/noticeList">Community</a></li>
                    </ul>
                </nav>
	            <section>
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
	    <!-- --------------------------- <visual> --------------------------------------- -->
		<div id="visual">
			<div class="content-container"></div>
		</div>
		<!-- --------------------------- <body> --------------------------------------- -->
		<div id="body">
			<div class="content-container clearfix">
				<!-- --------------------------- aside --------------------------------------- -->
				<aside class="aside">
					<h1>MY PAGE</h1>
					<nav class="menu text-menu first margin-top">
						<h1>메뉴</h1>
						<ul>
							<li><a href="/memberMyPage">마이페이지</a></li>	
							<!-- 비밀번호 재발급 미구현 -->						
							<li><a onclick="alert('준비중..');">비밀번호 재발급</a></li>
						</ul>
					</nav>
				</aside>
				<!-- --------------------------- main --------------------------------------- -->				
				<main class="main">
					<!-- 현재 세션의 member 정보의 속성들을 이용한 welcome 표시 -->
					<h2 class="main title">${sessionScope.userMember.name} 님 환영합니다.</h2>
					<div class="breadcrumb">
						<h3 class="hidden">경로</h3>
						<ul>
							<li>home</li>
							<li>마이페이지</li>
						</ul>
					</div>
					<div class="-list- Horizontal first">
						<div class="align-center margin-top" style="margin: 50px; padding : 30px 0px 0px 0px;" >
							<span style="display:inline-block; background:url('../images/profile.png') no-repeat center; background-size:cover ;vertical-align:middle; width: 120px;height: 120px;border: 1px solid #595959; border-radius:60px; box-shadow: 0 4px 15px 0 rgba(0, 0, 0, 0.15);"></span>
						</div>
	                    <fieldset>
                    		<!-- 해당 테이블은 접속된 사용자의 마이페이지에서 사용자에 정보를 표시하기 위한 테이블임 -->
	                        <table class="table margin-top first">
	                        	<!-- 로그인이 되어있는 경우에 마이페이지를 들어올 수 있음 => 세션에 접속중인 사용자가 마이페이지의 회원임 -->
	                        	<!-- 현재 세션의 member 정보의 속성들을 이용해서 회원정보 테이블을 채움 -->
	                            <tbody>                                
	                                <tr>
	                                    <th><label>아이디</label></th>
	                                    <!-- 현재 접속중인 회원의 ID -->
	                                    <td colspan="3" class="text-align-left indent">${sessionScope.userMember.mid}</td>
	                                </tr>
	                                <tr>
	                                    <th><label>비밀번호</label></th>
	                                    <!-- 현재 접속중인 회원의 PWD -->
	                                    <td colspan="3" class="text-align-left indent">${sessionScope.userMember.pwd}</td>
	                                </tr>
	                                <tr>
	                                    <th><label>이름</label></th>
	                                    <!-- 현재 접속중인 회원의 이름 -->
	                                    <td colspan="3" class="text-align-left indent">${sessionScope.userMember.name}</td>
	                                </tr>
	                                <tr>
	                                    <th><label>성별</label></th>
	                                    <!-- 현재 접속중인 회원의 성별 -->
	                                    <td colspan="3" class="text-align-left indent">${sessionScope.userMember.gender}</td>
	                                </tr>
	                                <tr>
	                                    <th><label>생년월일</label></th>
	                                    <!-- 현재 접속중인 회원의 생년월일 -->
	                                    <td colspan="3" class="text-align-left indent">${sessionScope.userMember.birthday}</td>
	                                </tr>
	                                <tr>
	                                    <th><label>핸드폰번호</label></th>
	                                    <!-- 현재 접속중인 회원의 휴대전화 -->
	                                    <td colspan="3" class="text-align-left indent">${sessionScope.userMember.phone}</td>
	                                </tr>
	                                <tr>
	                                    <th><label>이메일</label></th>
	                                    <!-- 현재 접속중인 회원의 이메일 -->
	                                    <td colspan="3" class="text-align-left indent">${sessionScope.userMember.email}</td>
	                                </tr>                                
	                            </tbody>
	                        </table>
	                    </fieldset>
	                </div>
	                <!-- 여기부터 아래는 공지사항 목록이 표시될 부분 -->
	                <!-- 쿼리스트링의 페이지가 비어있다면 기본값으로 1을 페이지로 선정 -->
					<c:set var="page" value="${(empty param.p)?1:param.p}"/>
					<!-- 검색어 입력 폼 -->
					<div class="search-form margin-top first align-right">
						<h3 class="hidden">Community 검색폼</h3>
						<!-- form을 submit 하면 검색필드와 검색어로 필터된 목록만 출력된다. -->
						<form class="table-form">
							<fieldset>
								<legend class="hidden">Community 검색 필드</legend>
								<label class="hidden">검색분류</label>
								<!-- 쿼리스트링의 f(검색필드)의 값에 따라 두 옵션 값 중 하나가 화면에 표시됨 -->
								<select name="f">
									<!-- f가 title일 경우 "제목" -->
									<option ${(param.f == "title")?"selected":""} value="title">제목</option>
									<!-- f가 writer_id일 경우 "작성자" -->
									<option ${(param.f == "writer_id")?"selected":""} value="writer_id">작성자</option>
								</select> 
								<label class="hidden">검색어</label>
								<!-- 검색시 검색어로 표시될 쿼리스트링 q -->
								<input type="text" name="q" value="${param.q}"/>
								<input class="btn btn-search" type="submit" value="검색" />
							</fieldset>
						</form>
					</div>
					<!-- 글 목록 -->
					<!-- form을 submit 하면 선택된 id와 버튼에 따라 일괄공개/일괄삭제된다. -->
					<form method="post">
						<div class="notice margin-top">
							<h3 class="hidden">Community 목록</h3>
							<table class="table">
								<thead>
									<tr>
										<th class="w60">번호</th>
										<th class="expand">제목</th>
										<th class="w100">작성자</th>
										<th class="w100">작성일</th>
										<th class="w60">조회수</th>
										<th class="w40">공개</th>
										<th class="w40">삭제</th>										
									</tr>
								</thead>
								<tbody>
									<!-- 목록 중 하나의 내용이 한 행에 표시되어야 하기 때문에 MypageController로부터 받아온 list의 내용을 출력 -->
	                            	<!-- list를 기준으로 반복문을 돌려서 하나(n)를 빼냄-->
									<c:forEach var="n" items="${list}">
										<tr>
											<!-- n의 id -->
											<td>${n.nid}</td>
											<td class="title indent text-align-left">
												<!-- noticeDetail을 통해서 하나의 게시물로 들어갈 때 이전, 다음글이 무엇인지 판별해야하기 때문에 p, id, f, q도 함께 보냄-->
												<a href="memberMyDetail?p=${page}&id=${n.nid}&f=${param.f}&q=${param.q}">
													<!-- n의 제목과 n 게시물에 달린 댓글 수 / 제목을 클릭하면 제목에 해당하는 게시물로 들어감-->
													${n.title}<span style="color:red">[${n.cmtCount}]</span>
												</a>
											</td>
											<!-- n의 작성자 -->
											<td>${n.writerId}</td>
											<td>
												<!-- n의 등록일자 / 날짜 패턴을 등록하기 위한 jstl 태그, yy/mm/dd 형식으로 출력됨 -->
												<fmt:formatDate pattern="yy/MM/dd" value="${n.regDate}"/>	
											</td>
											<!-- n의 조회수 / 숫자 패턴을 등록하기 위한 jstl 태그 -->
											<td><fmt:formatNumber type="number" value="${n.hit}"/></td>
											<!-- 공개 여부 / 공개여부(pub)를 통해서 표시됨(1이면 체크 O, 아니면 체크 X) / 체크 후 일괄공개를 누르면 n의 id가 보내짐 -->
											<td><input type="checkbox" name="open_id" value="${n.nid}" ${(n.pub == 1)?"checked":""}></td>
											<!-- 제거 여부 / 체크 후 일괄삭제를 누르면 n의 id가 보내짐 -->
											<td><input type="checkbox" name="del_id" value="${n.nid}"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 전체 개수(count)를 5으로 나누고 올림을 한 다음 정수로 바꾸기 위해 소수점을 삭제시킴 / 목록당 게시물이 5개이기 때문 -->
						<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/5), '.')}"/>
						<!-- 시작 페이지 번호는 늘 달라지기 때문에 현재 페이지 번호로 만들어야함. (ex 1, 6, 11 ..) --> 
						<!-- 현재 3이라면 1, 현재 8이라면 6.. / 아래는 현재 페이지 번호로 시작 페이지 번호를를 알아내는 식 -->
						<c:set var="startNum" value="${page-(page-1)%5}" />
						<div class="indexer margin-top align-right">
							<h3 class="hidden">현재 페이지</h3>
							<!-- 현재 페이지 번호와 마지막 페이지 번호 -->
							<div><span class="text-orange text-strong"> ${page} </span> / ${lastNum} pages</div>
						</div>
						<div class="text-align-right margin-top">
							<c:set var="ids" value=""/>
							<!-- 목록의 모든 id (일괄 등록에 사용됨) / 체크된 id는 pub = 1, 안된 id는 pub = 0 으로 바꿔야함 -->
							<!-- 따라서 전체에서 체크된 것을 빼기 위해 전체를 알아내는 작업 -->
							<c:forEach var="n" items="${list}">
								<c:set var="ids" value="${ids} ${n.nid}" />
							</c:forEach>
							<!-- 전체 id를 ids라고 이름 지어 파라미터로 보냄 -->
							<input type="hidden" name="ids" value="${ids}"/>
							<!-- 일괄 공개 버튼 / 누르면 체크된 id는 공개되고 전체 id에서 체크된 id를 뺀 id는 비공개 됨 -->
							<input type="submit" class="btn-text btn-default" name="btn" value="일괄공개">
							<!-- 일괄 삭제 버튼 / 누르면 체크된 id의 게시물들을 모두 삭제함 -->
							<input type="submit" class="btn-text btn-default" name="btn" value="일괄삭제">
							<!-- 내 글쓰기 기능 -->
							<a class="btn-text btn-default" href="/memberMyReg">글쓰기</a>
						</div>
					</form>
					<!-- 이전, 페이저, 다음 -->
					<div class="margin-top align-center pager">
						<!-- 이전 -->	
						<div>
							<!-- 시작 페이지 번호에서 1을 뺀것이 1보다 크거나 같다면 이전으로 갈 수 있음, 왜냐하면 1에서 1을 빼면 0이고 1이 마지막이 되어야하기 때문-->
							<c:if test="${startNum-1>=1}">
								<!-- 이전 페이지 목록으로 이동함. 이전 페이지 목록의 시작페이지가 아닌 마지막 페이지로 감 / (startNum - 1) -->
								<!-- 페이지 목록이 검색어와 검색필드의 값의 영향도 있기 때문에 함께 가져감 -->
								<a href="?p=${startNum-1}&f=${param.f}&q=${param.q}" class="btn btn-prev">이전</a>
							</c:if>
							<!-- 위의 가정이 아니라면 이전으로 갈 수 없음-->
							<c:if test="${startNum-1<1}">
								<!-- alert로 이전 페이지 목록이 없다고 알림 -->
								<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
							</c:if>
						</div>
						<!-- 페이저 -->
						<ul class="-list- center">
							&nbsp;
							<!-- 페이저는 시작 페이지 번호를 기준으로 5번째까지를 목록으로 함 / 시작 : +0 / 끝 : +4 -->
							<c:forEach var="i" begin="0" end="4">
								<!-- 그렇지만 마지막 번호까지만 페이지 번호를 출력함. 없는 데이터에 접근을 불가하기위함 -->
								<c:if test="${startNum + i <= lastNum}">
									<!-- 현재 페이지가 해당하는 페이지 번호라면 orange 색으로 표시를 해둠 / a태그의 값은 startNum + i 임-->
									<!-- 클릭하면 현재의 경로로 이동하지만 페이지 번호와 검색어와 검색필드를 함께 링크에 보내 이동함-->
									<li><a class="-text- ${(page==(startNum+i))?'orange':''} bold" href="?p=${startNum + i}&f=${param.f}&q=${param.q}" >${startNum + i}</a></li>
									&nbsp;
								</c:if>
							</c:forEach>
						</ul>
						<!-- 다음 -->
						<div>
							<!-- 시작 페이지 번호에서 5를 더한것이 마지막 페이지 번호보다 작거나 같다면 다음으로 갈 수 있음 -->
							<!-- 왜냐하면 마지막 페이지 번호가 속하는 페이지 목록이 마지막이 되어야 하기 때문-->
							<c:if test="${(startNum+5)<=lastNum}">
								<!-- 다음 페이지 목록으로 이동함. 다음 페이지 목록의 시작페이지로 감 / (startNum + 5) -->
								<!-- 페이지 목록이 검색어와 검색필드의 값의 영향도 있기 때문에 함께 가져감 -->
								<a href="?p=${startNum+5}&f=${param.f}&q=${param.q}" class="btn btn-next">다음</a>
							</c:if>
							<!-- 위의 가정이 아니라면 이전으로 갈 수 없음-->
							<c:if test="${(startNum+5)>lastNum}">
								<!-- alert로 다음 페이지 목록이 없다고 알림 -->
								<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
							</c:if>
						</div>
					</div>
				</main>
			</div>
		</div>
		<!-- ------------------- <footer> --------------------------------------- -->
        <footer id="footer">
            <div class="content-container">
                <h2 id="footer-logo"><img src="/images/logo-footer.png" alt="회사정보"></h2>
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