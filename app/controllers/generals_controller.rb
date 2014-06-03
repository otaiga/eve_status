# General controller for main site
class GeneralsController < ApplicationController
  def index
  end

  def skills
    @data = EveSkills::EveSkillGrp.paginate(page: params[:page], per_page: 5)
  end

  def alliance
    @data = EveAlliances::EveAlliance.paginate(page: params[:page])
  end
end
