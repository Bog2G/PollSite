class PollsController < ApplicationController
  before_action :set_poll, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[home]

  # GET /polls or /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1 or /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
    @poll.questions.build
    @poll = current_user.polls.build

  end

  # GET /polls/1/edit
  def edit
    @poll.questions.build
  end

  # POST /polls or /polls.json
  def create
    @poll = Poll.new(poll_params)
    @poll = current_user.polls.build(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to poll_url(@poll), notice: "Poll was created." }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1 or /polls/1.json
  def update

    if @poll.update(poll_params)
      selected_question_id = params[:poll][:question_id]
      selected_question = Question.find(selected_question_id)
      if Vote.exists?(user_id: current_user.id, poll_id: @poll.id)
        # Display an error message or redirect the user to a different page
        redirect_to @poll, notice: "You have already cast a vote for this poll."
      else
        @vote = Vote.create(question_id: selected_question.id, user_id: current_user.id, poll_id: @poll.id)
        @vote.save
        redirect_to root_path, notice: 'Poll was successfully updated.'
      end
    else
      puts "Go fuck yourself"
    end
  end

  # DELETE /polls/1 or /polls/1.json
  def destroy
    @poll.destroy

    respond_to do |format|
      format.html { redirect_to polls_url, notice: "Poll deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poll_params
      params.require(:poll).permit(:title, :question_id, questions_attributes: [:id, :question, :_destroy])
    end

end
