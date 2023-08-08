# frozen_string_literal: true

require "csv"
require "net/http"
require "tempfile"
require "uri"

namespace :cities do
  desc "Import cities from Istat remote CSV"
  task :import do
    tempfile = Tempfile.new
    tempfile.write Net::HTTP.get(
      URI("https://raw.githubusercontent.com/italia/anpr/master/src/archivi/ANPR_archivio_comuni.csv")
    )

    output_string = CSV.generate do |csv|
      csv << %w[code province name created_on deleted_on]

      CSV.foreach(tempfile.path, headers: true) do |row|
        csv << [
          row["CODCATASTALE"],
          row["SIGLAPROVINCIA"],
          row["DENOMINAZIONE_IT"].upcase,
          row["DATAISTITUZIONE"],
          row["DATACESSAZIONE"]
        ]
      end
    end

    File.write("lib/itax_code/data/cities.csv", output_string)
  ensure
    tempfile.close
    tempfile.unlink
  end
end
