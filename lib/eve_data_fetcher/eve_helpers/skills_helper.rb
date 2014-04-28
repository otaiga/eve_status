module EveHelpers

  module SkillsHelper
    def skill_response(skill_response)
      main_hash = {
        name: 'skill_tree'
      }
      groups = []
      skills = []
      default_rows(skill_response).each do |row|
        skill_skills(row).each do |skill|
          skills << skill_hash(skill) if skill.kind_of?(Hash)
        end
        group_hash = {}
        group_hash = {
          group: skill_group_name(row),
          skills: skills.compact
        }
        groups << group_hash
      end
      main_hash.merge(
        {
          groups: groups
        }
      )
    end

    def skill_group_name(row)
      row['groupName']
    end

    def skill_skills(data)
      data['rowset']['row']
    end

    def skill_hash(skill)
      {
        type_name: skill['typeName'],
        group_id: skill['groupID'],
        type_id: skill['typeID'],
        description: skill['description'],
        rank: skill['rank'],
        requiredAttributes: skill['requiredAttributes'],
        requiredSkills: required_skills(skill)
      }
    end

    def required_skills(skill)
      required_skills = []
      skill['rowset'].each do |rq|
        required_skills << rq['row']
      end
      required_skills.compact
    end

    def default_rows(response)
      response['eveapi']['result']['rowset']['row']
    end
  end

end