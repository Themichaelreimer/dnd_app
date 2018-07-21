class TemplatesController < ApplicationController
  include ApplicationHelper

  def create
    @template = Template.new(template_params)

    if @template.save
      #redirect_to template_path(@template)
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @template = Template.find(params[:id])
  end

  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
  end

  def destroy
    Template.find(params[:id]).destroy
    flash[:success] = "Template Deleted!"
    redirect_back(fallback_location: root_path)
  end

  def favorite

    user = User.find(params[:user])
    template = Template.find(params[:template])

    #break out now if relationship already exists
    if user.templates.exists?(template.id)
      return
    end

    user.templates << template
    flash[:success] = "Template favourited!"
    redirect_back(fallback_location: root_path)
  end

  def unfavorite

    user = User.find(params[:user])
    template = Template.find(params[:template])

    #break out now if there's nothing to unfavorite
    if !user.templates.exists?(template.id)
      return
    end

    user.templates.delete(template.id)
    flash[:success] = "Template unfavourited!"
    redirect_back(fallback_location: root_path)
  end

  def create_monster

    user = User.find(params[:user])
    template = Template.find(params[:template])


    actor = Actor.new

    # Rolled stats
    actor.hp = try_eval(template.hp_s)
    actor.cur_hp = actor.hp
    actor.ac = try_eval(template.ac_s)
    actor.str = try_eval(template.str_s)
    actor.dex = try_eval(template.dex_s)
    actor.con = try_eval(template.con_s)
    actor.int = try_eval(template.int_s)
    actor.wis = try_eval(template.wis_s)
    actor.cha = try_eval(template.cha_s)

    # Inherited stats
    actor.name = template.name
    actor.desc = template.desc
    actor.actions = template.actions
    actor.speed = template.speed
    actor.saving_throws = template.saving_throws
    actor.skills = template.skills
    actor.senses = template.senses
    actor.languages = template.languages
    actor.abilities = template.abilities
    actor.challenge = template.challenge
    actor.image = template.image

    actor.user_id = user.id

    if actor.save
      flash[:success] = actor.name + " spawned!"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Actor could not be spawned. Invalid parameters given"
      redirect_back(fallback_location: root_path)
    end
  end
  helper_method :create_monster

  private
    def template_params
      params.require(:template).permit(:name,:desc,:actions,:hp_s,:ac_s,:speed,:str_s,:dex_s,:con_s,:int_s,:wis_s,:cha_s,:saving_throws,:skills,:senses,:languages,:abilities,:challenge,:image)
    end

end
