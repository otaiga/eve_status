class SkillTreesController < ApplicationController
  def index
    @data = EveSkillGrp.all
  end
end
