require_relative 'ingestion_helpers/skill_ingestion_helper'
# Skill ingestion support for rake
class SkillIngestion
  class << self
    include IngestionHelpers::SkillIngestionHelper

    def ingest_skills
      data = call_eve_api
      update_skill_data(data)
    end

    def call_eve_api
      EveDataFetcher::Eve.skill_tree
    end

    def update_skill_data(data)
      return unless data
      data.each do |record|
        skill_grp = EveSkills::EveSkillGrp.find_or_create_by(
          group_name: record[:group]
        )
        skills = record[:skills]
        update_group_skills(skill_grp, skills) unless skills.empty?
      end
    end

    def update_group_skills(skill_grp, skills)
      return if skills.empty? || skill_grp.nil?
      skills.each do |skill|
        eve_skill = skill_grp.eve_skills.find_or_create_by(
          type_id: skill[:type_id]
        )
        eve_skill.update_attributes(group_skill_attrs(skill))
        update_required_skill(eve_skill, skill)
        update_required_attrs(eve_skill, skill)
        update_required_bonus(eve_skill, skill)
      end
    end

    def group_skill_attrs(skill)
      {
        type_name: skill[:type_name],
        group_id: skill[:group_id],
        type_id: skill[:type_id],
        description: skill[:description],
        rank: skill[:rank]
      }
    end

    def update_required_skill(eve_skill, skill)
      return if eve_skill.nil?
      eve_required_skills = skill[:requiredSkills][:required_skills]
      if eve_required_skills.kind_of?(Array)
        update_req_skill_arry(eve_skill, eve_required_skills)
      else
        update_req_skill_single(eve_skill, eve_required_skills)
      end
    end

    def update_required_attrs(eve_skill, skill)
      return if eve_skill.nil?
      eve_required_attributes = skill[:requiredAttributes]
      if eve_required_attributes.kind_of?(Array)
        update_req_attrs_ary(eve_skill, eve_required_attributes)
      else
        update_req_attrs_single(eve_skill, eve_required_attributes)
      end
    end

    def update_required_bonus(eve_skill, skill)
      return if eve_skill.nil?
      req_skill = skill[:requiredSkills]
      eve_skill_bonus_collections = req_skill[:skill_bonus_collection]
      if eve_skill_bonus_collections.kind_of?(Array)
        update_req_bonus_arry(eve_skill, eve_skill_bonus_collections)
      else
        update_req_bonus_single(eve_skill, eve_skill_bonus_collections)
      end
    end
  end
end
