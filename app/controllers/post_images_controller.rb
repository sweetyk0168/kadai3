class PostImagesController < ApplicationController
  #コントローラーの名前は複数形に設定する
  def new
    @post_image = PostImage.new
  end
  #投稿データの.保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    #データ（レコード）を1件取得
    post_image = PostImage.find(params[:id])
    #データ（レコード）を削除
    post_image.destroy
    #投稿一覧画面へリダイレクト
    redirect_to '/post_images'
  end
  
  #投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
