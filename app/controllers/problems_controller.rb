# -*- coding: utf-8 -*-
class ProblemsController < ApplicationController

  before_filter :require_login, only: [:new, :create]

  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = Problem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem }
    end
  end

  # POST /problems/answer/1
  # POST /problems/answer/1.json
  def answer
    @problem = Problem.find(params[:id])

    @problem.answer_by(current_user, params[:choice])

    respond_to do |format|
      format.html { redirect_to @problem, notice: 'Answered' }
      format.json { render json: @problem, status: :answered, location: @problem }
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    @problem = Problem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem }
    end
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(params[:problem])
    @problem.creator = current_user

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def require_login
    redirect_to '/', notice: "ログインしてください" unless current_user
  end
end
