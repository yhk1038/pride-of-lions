class CreateMyprjEaches < ActiveRecord::Migration
  def change
    create_table :myprj_eaches do |t|

      t.integer :user_id #작성자 id
      t.string :myprj_each_img #prj 이미지파일 => S3 업로드.
      t.string :prj_title #prj 제목
      t.string :prj_memo  #한 줄 메모
      t.text   :prj_content #소개글
      t.string :prj_url #prj 주소
      t.integer :prj_ctgory #소속되는 폴더 코드번호
      t.integer :lookable #look_portfolio에 Open할 것인지를 체크함 ( 0==close // 1==open )



      t.timestamps null: false
    end
  end
end
