module Api
  # misc api calls
  class GeneralApisController < Api::BaseController
    def skill_tree
      groups = formatted_data.as_json(except: [:id, :created_at, :updated_at])
      render json: groups
    end

    private

    def formatted_data
      EveSkillGrp.all.map do |group|
        {
          group_name: group.group_name,
          group_skills: formatted_skills(group)
        }
      end
    end

    def formatted_skills(group)
      group.eve_skills.all.map do |skill|
        skill.as_json(except: [:id, :created_at, :updated_at]).merge(
          required_skills: skill.eve_required_skills.as_json(except: [:id, :created_at, :updated_at]),
          required_attributes: skill.eve_required_attributes.as_json(except: [:id, :created_at, :updated_at]),
          bonus_collection: skill.eve_skill_bonus_collections.as_json(except: [:id, :created_at, :updated_at])
        )
      end
    end
  end
end