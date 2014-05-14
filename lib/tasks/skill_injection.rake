require_relative '../rake_support/skill_ingestion'

namespace :skill_injection do
  task :ingest_skills => :environment do
    SkillIngestion.ingest_skills
  end
end