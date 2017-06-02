class QuestionsController < ApplicationController

	before_action :set_question, only: [:show, :edit, :update, :destroy, :downvote, :upvote]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    @answer = Answer.new
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # question /questions
  # question /questions.json
  def create
  	 @question = current_user.questions.build(question_params)
   # @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    @question.upvote_from current_user
    #flash[:success] = "Successfully added to your favorites"
    redirect_to request.referer
  end

  def downvote
    @question.downvote_from current_user
    # redirect_to show_question_path(@question)
    #flash[:success] = "Successfully removed from your favorites"
    redirect_to request.referer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :featured)
    end
end