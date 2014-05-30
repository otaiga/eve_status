require_relative '../rake_support/alliance_ingestion'

namespace :alliance_injection do
  task :ingest_alliances => :environment do
    AllianceIngestion.ingest_alliances
  end
end
