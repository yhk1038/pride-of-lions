class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :board_id
      t.integer :post_user_id       #작성자 id(숫자)
      t.string :post_user_name      #작성자 정보
      t.string :post_user_univ
      t.string :post_user_team
      t.string :post_title        #게시글 제목
      t.integer :post_secret    #게시글 도어락
      t.text   :post_content      #게시글 본문
      t.integer :post_count, null: false, default: 0       #게시글 조회수
      t.integer :post_vote, null: false, default: 0        #게시글 좋아요 수
      t.integer :post_comments, null: false, default: 0    #게시글 댓글 수
      t.timestamps null: false
    end
  end
end
