class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery #with: :exception
  $rowsPerPage = 10
  $univ = ['UNIST', '강원대학교', '건국대학교' , '경북대학교','경희대학교','고려대학교','국민대학교',
                   '단국대학교', '덕성여자대학교', '동국대학교','동덕여자대학교','부산대학교','서강대학교',
                   '서울과학기술대학교','서울대학교','서울시립대학교','서울여자대학교','성균관대학교','성신여자대학교',
                   '숙명여자대학교','아주대학교','연세대학교','영남대학교','원광대학교','유학생','이화여자대학교','인하대학교',
                   '전남대학교','중앙대학교','충남대학교','평택대학교','한국과학기술원','한국예술종합학교','한국외국어대학교',
                   '한동대학교','한양대학교']
  
  $max_lenth = 10 #~~자 이상이면 게시글 제목 끝을 ...으로 표기
  
end
