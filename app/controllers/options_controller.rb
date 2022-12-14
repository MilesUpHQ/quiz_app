class OptionsController < ApplicationController

  before_action :set_option, only: [:edit, :update, :destroy]  

  def edit
    
  end

  def update
    falsify_all_others if params[:option][:is_correct_answer] == "checked true"
    if (@option.update(option_params))
      redirect_to quiz_question_path(@quiz, @question)
    else
      render :edit
    end
  end

  def destroy
    @option.destroy
    if @option.destroyed?
      flash[:success] = 'Option is destroyed'
    else
      flash[:error] = 'Failed to destroy'
    end
    redirect_to quiz_question_path(@quiz, @question)
  end


  private

  def set_option
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @option = Option.find(params[:id])
  end

  def falsify_all_others
    falsify_others = Option.where("question_id = ? AND id NOT IN (?)" , params[:question_id], @option.id).update_all(:is_correct_answer => false)
    @option.is_correct_answer = true
  end

  def option_params
    params.require(:option).permit(:choice, :is_correct_answer, :question_id)
  end
end 