class CommentController < ApplicationController
    
    def reply_create
        
        replyConn = Reply.new
        replyConn.editor = params[:editor]
        replyConn.content = params[:content]
        replyConn.post_id = params[:post_id]
        replyConn.save
        
        redirect_path = '/show/' + params[:post_id]
        redirect_to redirect_path
        
    end
    
    def reply_delete
        
        del_reply = Reply.find(params[:reply_id])
        del_reply.destroy
        
        redirect_path = '/show/' + params[:post_id]
        redirect_to redirect_path
        
    end
    
end
