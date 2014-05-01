module EveHelpers
  # Help weed out the skills in nice format
  module SkillsHelper
    def skill_response(skill_response)
      @skill_map = skill_mapping(skill_response)
      groups = []
      skill_known_groups(skill_response).each do |key|
        skills = []
        default_rows(skill_response).each do |row|
          skills = compile_skills(row, skills) if skill_group_name(row) == key
        end
        groups << skill_group_hash(key, skills.compact)
      end
      groups
    end

    def skill_group_hash(key, skills)
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
      req_skills = []
      sb_collection = []
      skill['rowset'].each do |rq|
        req_skills << formatted_skills(rq['row']) if required_skill(rq['name'])
        sb_collection << rq['row'] if skill_bonus_collection(rq['name'])
      end
      {
        required_skills: req_skills.compact,
        skill_bonus_collection: sb_collection.compact
      }
    end

    def default_rows(response)
      response['eveapi']['result']['rowset']['row']
    end

    def required_skill(name)
      name == 'requiredSkills'
    end

    def skill_bonus_collection(name)
      name == 'skillBonusCollection'
    end

    def skill_group_name(row)
      row['groupName']
    end

    def skill_known_groups(response)
      default_rows(response).map { |a| a['groupName'] }.uniq
    end

    def skill_mapping(response)
      skill_map = {}
      default_rows(response).map do |data|
        if skill_skills(data).kind_of?(Hash)
          skill_map.merge!(skill_data_hash(data))
        end
        skill_skills(data).each do |sk|
          (skill_map[sk['typeID']] = sk['typeName']) if sk.kind_of?(Hash)
        end
      end
      skill_map
    end

    def skill_skills(data)
      data['rowset']['row']
    end

    def formatted_skills(required_skills)
      return unless required_skills
      if required_skills.kind_of?(Hash)
        required_skills.merge!(compile_skill_hash(required_skills))
      end
      required_skills.each do |skill|
        if skill.kind_of?(Hash)
          skill.merge!('name' => @skill_map[skill['typeID']])
        end
      end
    end

    def compile_skill_hash(required_skills)
      return unless required_skills
      return if @skill_map[required_skills['typeID']].nil?
      {
        'name' => @skill_map[required_skills['typeID']]
      }
    end

    def skill_data_hash(data)
      return unless data
      {
        skill_skills(data)['typeID'] => skill_skills(data)['typeName']
      }
    end
  end
end
