class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		#@post = Post.new(params.require(:post).permit(:title, :content))
		if @post.save
			redirect_to posts_path, :notice => "Successfully created!"
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id]) 
	end

	def update
		@post = Post.find(params[:id])  
   
	  	respond_to do |format|  
		    if @post.update_attributes(params[:post])  
		        format.html  { redirect_to(@post,  
		                    :notice => 'Post was successfully updated.') }  
		        format.json  { render :json => {}, :status => :ok }  
		    else  
		        format.html  { render :action => "edit" }  
		        format.json  { render :json => @post.errors, :status => :unprocessable_entity }  
		    end  
        end  
	end

	def destroy
		@post = Post.find(params[:id])  
	 	@post.destroy  
	   
	  	respond_to do |format|  
	    format.html { redirect_to posts_url }  
	    format.json { head :ok }  
	  	end  
	end
end
