class MyprjEach < ActiveRecord::Base
    
    mount_uploader :myprj_each_img, ImgsUploader #AWS S3에 "adding project"의 이미지를 업로드.
    belongs_to :user
end
