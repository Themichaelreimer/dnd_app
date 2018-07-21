class ActorsController < ApplicationController

  def new

  end

  def create

  end

  def show
    @actor = Actor.find(params[:id])
  end

  def index
    @actors = Actor.all
  end

  def destroy
    Actor.find(params[:id]).destroy
    flash[:success] = "Monster Deleted!"
    redirect_back(fallback_location: root_path)
  end

  def damage
    dmg = params[:actor][:dmg]
    dmg_number = Integer(dmg) rescue nil

    actor = Actor.find(params[:actor][:actor_obj])

    if dmg_number
      actor.cur_hp -= dmg_number

      if actor.cur_hp < 0
        actor.cur_hp = 0
      end

      actor.save
    else
      flash[:danger] = "Could not understand input - Please enter a whole positive or negative number."
    end

    redirect_back(fallback_location: root_path)
  end

  private
  #def actor_params
  #  params.require(:actor).permit(:name,:desc,:actions,:hp_s,:ac_s,:speed,:str_s,:dex_s,:con_s,:int_s,:wis_s,:cha_s,:saving_throws,:skills,:senses,:languages,:abilities,:challenge,:image)
  #end
  def actor_params
    params.require(:actor).permit(:template)
  end

end
