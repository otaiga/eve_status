module EveHelpers
  # Help weed out the skills in nice format
  module SkillsHelper
    def skill_response(skill_response)
      groups = []
      known_groups(skill_response).each do |key|
        skills = []
        default_rows(skill_response).each do |row|
          skills = compile_skills(row, skills) if skill_group_name(row) == key
        end
        groups << group_hash(key, skills.compact)
      end
      groups
    end

    def group_hash(key, skills)
      {
        group: key,
        skills: skills
      }
    end

    def compile_skills(row, skills)
      skill_skills(row).each do |skill|
        skills << skill_hash(skill) if skill.kind_of?(Hash)
      end
      skills
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
      skill_bonus_collection = []
      skill['rowset'].each do |rq|
        required_skills << rq['row'] if required_skill(rq['name'])
        skill_bonus_collection << rq['row'] if bonus_collection(rq['name'])
      end
      {
        required_skills: required_skills.compact,
        skill_bonus_collection: skill_bonus_collection.compact
      }
    end

    def default_rows(response)
      response['eveapi']['result']['rowset']['row']
    end

    def required_skill(name)
      name == 'requiredSkills'
    end

    def bonus_collection(name)
      name == 'skillBonusCollection'
    end

    def skill_group_name(row)
      row['groupName']
    end

    def known_groups(response)
      default_rows(response).map { |a| a['groupName'] }.uniq
    end

    def skill_skills(data)
      data['rowset']['row']
    end
  end
end
