class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_poll

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question = polls.find(params[:id]).questions.build
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    @question = polls.find(params[:id]).questions.build[question_params]
  end

  def vote
    @question = Question.find(params[:id])
    @vote = @question.votes.create
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question, :id)
    end

    def set_poll
      @poll = Poll.find params[:poll_id]
    end
end
