# skills controller
class SkillTreesController < ApplicationController
  def index
    @data = EveSkills::EveSkillGrp.all
  end
end
