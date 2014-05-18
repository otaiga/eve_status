namespace :alliance_injection do
  task :ingest_alliances => :environment do
    AllianceIngestion.ingest_alliances
  end
end
