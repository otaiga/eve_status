module IngestionHelpers
  # Splitting out as too big in class
  module SkillIngestionHelper
    def update_req_skill_arry(eve_skill, eve_required_skills)
      return if eve_required_skills.empty?
      eve_required_skills.each do |req_skill|
        if req_skill.kind_of?(Array)
          process_req_array(req_skill, eve_skill)
        else
          update_req_skill_single(eve_skill, req_skill)
        end
      end
    end

    def update_req_skill_single(eve_skill, eve_required_skills)
      return if eve_required_skills.nil?
      eve_skill.eve_required_skills.find_or_create_by(
        type_id: eve_required_skills['typeID'],
        skill_level: eve_required_skills['skillLevel'],
        name: eve_required_skills['name']
      )
    end

    def process_req_array(req_skill, eve_skill)
      req_skill.each do |inner|
        eve_skill.eve_required_skills.find_or_create_by(
          type_id: inner['typeID'],
          skill_level: inner['skillLevel'],
          name: inner['name']
        )
      end
    end

    def update_req_attrs_ary(eve_skill, eve_required_attributes)
      return if eve_required_attributes.empty?
      eve_required_attributes.each do |req_attrib|
        eve_skill.eve_required_attributes.find_or_create_by(
          primary_attribute: req_attrib['primaryAttribute'],
          secondary_attribute: req_attrib['secondaryAttribute']
        )
      end
    end

    def update_req_attrs_single(eve_skill, eve_required_attributes)
      return if eve_required_attributes.nil?
      eve_skill.eve_required_attributes.find_or_create_by(
        primary_attribute: eve_required_attributes['primaryAttribute'],
        secondary_attribute: eve_required_attributes['secondaryAttribute']
      )
    end

    def update_req_bonus_arry(eve_skill, eve_skill_bonus_collections)
      return if eve_skill_bonus_collections.empty?
      eve_skill_bonus_collections.each do |req_bouns|
        if req_bouns.kind_of?(Array)
          process_bonus_ary(req_bouns, eve_skill)
        else
          update_req_bonus_single(eve_skill, req_bouns)
        end
      end
    end

    def update_req_bonus_single(eve_skill, eve_skill_bonus_collections)
      return if eve_skill_bonus_collections.nil?
      eve_skill.eve_skill_bonus_collections.find_or_create_by(
        bonus_value: eve_skill_bonus_collections['bonusType'],
        bonus_type: eve_skill_bonus_collections['bonusValue']
      )
    end

    def process_bonus_ary(req_bouns, eve_skill)
      req_bouns.each do |inner|
        eve_skill.eve_skill_bonus_collections.find_or_create_by(
          bonus_value: inner['bonusType'],
          bonus_type: inner['bonusValue']
        )
      end
    end
  end
end
