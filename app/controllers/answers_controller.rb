class AnswersController < ApplicationController
  before_action :authenticate_user!
	before_action :set_answer, only: [:show, :edit, :update, :destroy, :downvote, :upvote]
  before_action :find_question, only: [:create]

	# answer /answers
  # answer /answers.json
  def create
     # @answer = @question.answers.create(answer_params)
     @answer = @question.answers.build(answer_params)
  	 @answer.user_id = current_user.id
     @answer.save
     redirect_to request.referer
     # if @answer.save
     #    redirect_to @question
     # else
     #    render 'new'
     # end
   # @answer = answer.new(answer_params)

    # respond_to do |format|
    #   if @answer.save
    #     format.html { redirect_to @answer, notice: 'answer was successfully created.' }
    #     format.json { render :show, status: :created, location: @answer }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @answer.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  def edit
    
  end

  def update
    if @answer.update(answer_params)
        redirect_to @answer.question
     else
        render 'edit'
     end
  end

  def destroy
    if @answer.destroy
         redirect_to @answer.question
     else
        render 'show'
     end
  end

  

  def upvote
    @answer.upvote_from current_user
    #flash[:success] = "Successfully added to your favorites"
    redirect_to request.referer
  end

  def downvote
    @answer.downvote_from current_user
    # redirect_to show_answer_path(@answer)
    #flash[:success] = "Successfully removed from your favorites"
    redirect_to request.referer
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def find_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:answer)
    end

end
