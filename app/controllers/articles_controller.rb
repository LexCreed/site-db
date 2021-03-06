class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :set_article, except: [:index, :new, :create]
    before_action :authenticate_editor!, only: [:new, :create, :update]
    before_action :authenticate_admin!, only: [:destroy, :publish]
    before_action :user_signed_in!
    def index
       @articles = Article.paginate(page: params[:page],per_page:9).publicados.ultimos

    end
    def show
        @comment = Comment.new
        @comments = @article.comments.paginate(page: params[:page], per_page:5).ultimos
    end
    
    def new
        @article = Article.new
    end
    
    
    def create
        @article = current_user.articles.new(article_params)
        
        if  @article.save
            redirect_to @article
        else
            render :new
        end
    end
    
    def update
        if @article.update(article_params)
        redirect_to @article
        else
        render :edit
        end

    end 
    
    def publish
        @article.publish!
        redirect_to articles_path
    end
    
    def edit
    end
    
    def destroy
        @article.destroy
        redirect_to articles_path 
    end
    
private 

def set_article
   @article = Article.find(params[:id])

end

def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesion "
end 
def article_params
    params.require(:article).permit(:title,:body,:cover,:markup_body)
end 

end





