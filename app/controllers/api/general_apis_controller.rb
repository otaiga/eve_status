module Api
  # misc api calls
  class GeneralApisController < Api::BaseController
    def skill_tree
      groups = formatted_data.as_json(except: non_required_fields)
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
        skill.as_json(except: non_required_fields).merge(
          required_skills: eve_required_skills(skill),
          required_attributes: eve_required_attributes(skill),
          bonus_collection: eve_skill_bonus_collections(skill)
        )
      end
    end

    def eve_required_skills(skill)
      skill.eve_required_skills.as_json(except: non_required_fields)
    end

    def eve_required_attributes(skill)
      skill.eve_required_attributes.as_json(except: non_required_fields)
    end

    def eve_skill_bonus_collections(skill)
      skill.eve_skill_bonus_collections.as_json(except: non_required_fields)
    end

    def non_required_fields
      [:id, :created_at, :updated_at]
    end
  end
end
