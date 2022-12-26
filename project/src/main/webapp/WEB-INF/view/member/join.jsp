	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	    <title>코딩 전문가를 만들기 위한 온라인 강의 시스템</title>
	    <meta charset="UTF-8">
	    <style>
	    	#visual .content-container{	
	            height:inherit;
	            display:flex; 
	            align-items: center;
	            
	            background: url("../../images/customer/visual.png") no-repeat center;
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
	    </style>
	</head>
	<script type="text/javascript">
		// 회원정보 입력에 대한 예외처리
		window.onload = function() {
			// 확인버튼을 눌렸을 때
		    document.getElementById('submit-Button').onclick = function() {
		    	var frm = document.getElementById('frm')
		    	// "memberDupl"로부터 받아온 dupl 값 => "", 0, 1, 2, 3,
		    	var dupl = "<c:out value="${dupl}" />";
		    	// id, pwd, 이름, 성별,생년월일, 휴대전화, 이메일이 비어있는지 확인
		    	if(frm.id.value == ""){
		    		alert("아이디를 입력해주세요");
		    		return ;
		    	}
		    	if(frm.pwd.value == ""){
		    		alert("비밀번호를 입력해주세요");
		    		return
		    	}
		    	if(frm.pwd2.value == ""){
		    		alert("비밀번호를 한번 더 입력해주세요");
		    		return
		    	}
		    	if(frm.name.value == ""){
		    		alert("이름을 입력해주세요");
		    		return
		    	}
		    	if(frm.gender.value == ""){
		    		alert("성별을 선택해주세요");
		    		return
		    	}
		    	if(frm.birthday.value == ""){
		    		alert("생년월일을 입력해주세요");
		    		return
		    	}
		    	if(frm.phone.value == ""){
		    		alert("휴대전화 번호를 입력해주세요");
		    		return
		    	}
		    	if(frm.email.value == ""){
		    		alert("이메일를 입력해주세요");
		    		return
		    	}
		    	// 비밀번호와 비밀번호 확인이 동일한지 확인
		    	if(frm.pwd.value != frm.pwd2.value){
		    		alert("비밀번호가 동일하지 않습니다.");
		    		return
		    	}
		    	// 아이디와 비밀번호가 같은지 확인
		    	if(frm.pwd.value == frm.id.value){
		    		alert("아이디와 비밀번호는 달라야 합니다.");
		    		return
		    	}
		    	
		    	// id, pwd, 휴대전화, 이메일의 올바른 입력을 위한 정규식
		    	const idpw_reg = new RegExp("^[a-z]+[a-z0-9]{5,19}$");
		    	const phone_reg = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
		    	const email_reg = new RegExp("^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

		    	if(!idpw_reg.test(frm.id.value)){
		    		alert("아이디의 형식이 올바르지 않습니다.");
		    		return
		    	}
		    	if(!idpw_reg.test(frm.pwd.value)){
		    		alert("비밀번호의 형식이 올바르지 않습니다.");
		    		return
		    	}
		    	if(!phone_reg.test(frm.phone.value)){
					alert("휴대전화의 형식이 올바르지 않습니다.");
		    		return
				}
		    	if(!email_reg.test(frm.email.value)){
					alert("이메일의 형식이 올바르지 않습니다.");
		    		return
				}
		    	// 생년월일이 적어도 오늘보다는 이전날짜가 되어 있어야함
		    	let today = new Date();
		    	let previous = new Date(frm.birthday.value);
		    	if(today.getTime() < previous.getTime()){
		    		alert("올바른 날짜를 입력해주세요");
		    		return
		    	}
		    	// 아이디 중복체크 확인 (3이 아니면 중복체크 적용 X)
		    	if(dupl != 3){
		    		alert("아이디 중복체크를 확인해 주세요.");
		    		return
		    	}
		    	// 모든 예외처리가 끝이나면 submit => action="/memberConfirm"
				frm.submit();
		    	return;
		    };
		};
	</script>
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
					<h1>회원가입</h1>
					<nav class="menu text-menu first margin-top">
						<h1>회원메뉴</h1>
						<ul>
							<li><a href="/memberLogin">로그인</a></li>
							<li><a href="/memberAgree">회원가입</a></li>
							<li><a onclick="alert('준비중..');">아이디 찾기</a></li>
							<li><a onclick="alert('준비중..');">비밀번호 재발급</a></li>							
						</ul>
					</nav>
				</aside>
				<!-- --------------------------- main --------------------------------------- -->
	            <main>
	                <h2 class="main title">회원가입</h2>                
	                <div class="breadcrumb" style="margin-top:-20px;">
	                    <h3 class="hidden">경로</h3>
	                    <img src="../images/member/step2.png" alt="회원가입 1단계" />
	                </div>
	                <!-- 회원정보 등록의 예외처리가 될 form -->
	                <form id="frm" method="post" action="/memberConfirm" >
	                    <fieldset>
	                        <legend class="hidden">회원정보</legend>
	                        <table class="table margin-top first">
	                            <tbody>                                
	                                <tr>
	                                    <th><label>아이디</label></th>
	                                    <td colspan="3" class="text-align-left indent">
	                                    	<!-- /memberDupl에서 다시 넘어왔을 때 id를 지워지지 않게 하기위해 vaule에 ${id} -->
		                                    <input id="id-text" type="text" name="id" class="width-half" required value="${id}" placeholder="영문과 숫자 6~20자 이내" />
		                                    <a class="btn-text btn-default" id="id-check-button"> 중복확인</a>
		                                    <!-- 중복확인 버튼을 누르면 script 실행 -->
		                                    <script type="text/javascript">
									            var btn = document.getElementById('id-check-button');
									            btn.addEventListener('click', function(){
									            	// id를 가지고 "/memberDupl"로 이동
									            	var id = document.getElementById('id-text');
									            	location.href="/memberDupl?id=" + id.value;
									            })
									        </script>
									        <!-- 위의 스크립트의 결과인 0, 1, 2, 3을 가지고 안내문을 출력 -->
									        ${(dupl== null or dupl == "0")?"아이디를 입력해주세요":((dupl =="1")?"양식이 올바르지 않습니다.":((dupl =="2")?"이미 사용중인 아이디입니다.":"사용 가능한 아이디입니다."))}
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th><label>비밀번호</label></th>
	                                    <td colspan="3" class="text-align-left indent"><input type="password" name="pwd" class="" value="" required placeholder="비밀번호 입력 (영문과 숫자 6~20자 이내)" /></td>
	                                </tr>
	                                <tr>
	                                    <th><label>비밀번호 확인</label></th>
	                                    <td colspan="3" class="text-align-left indent"><input class="" name="pwd2" type="password" value="" required  placeholder="비밀번호를 다시 한번 입력해주세요." /></td>
	                                </tr>
	                                <tr>
	                                    <th><label>이름</label></th>
	                                    <td colspan="3" class="text-align-left indent"><input class="width-half" name="name" type="text"  value="" required placeholder="이름 입력"/></td>
	                                </tr>
	                                <tr>
	                                    <th><label>성별</label></th>
	                                    <td colspan="3" class="text-align-left indent">
	                                        <select class="width-half" name="gender" required>
	                                            <option value="">선택</option>
	                                            <option value="남성">남성</option>
	                                            <option value="여성">여성</option>
	                                        </select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th><label>생년월일</label></th>
	                                    <td colspan="3" class="text-align-left indent">
	                                        <input name="birthday" type="date" class="width-half" required placeholder="예) 2000-02-17" value=""/>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th><label>핸드폰번호</label></th>
	                                    <td colspan="3" class="text-align-left indent"><input name="phone" type="text" class="width-half"  required  placeholder="예) 010-1111-2222" value=""/></td>
	                                </tr>
	                                <tr>
	                                    <th><label>이메일</label></th>
	                                    <td colspan="3" class="text-align-left indent"><input name="email" type="email" class="width-half" required placeholder="예) user@newlecture.com" value=""/></td>
	                                </tr>                                
	                                                                
	                                <tr>
	                                    <td colspan="4">
	                                    	<!-- 확인 버튼을 눌릴 시 위의 예외처리가 실행됨 -->
	                                        <input id="submit-Button" type="button" name="btn" value="확인" style="height: 30px; margin:20px;" class="btn-text btn-default" />
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </fieldset>
	                </form>
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