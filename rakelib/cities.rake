require "csv"
require "net/http"
require "tempfile"
require "uri"

namespace :cities do
  desc "Import cities from Istat remote CSV"
  task :import do
    tempfile = Tempfile.new
    tempfile.write Net::HTTP.get(
      URI("https://www.istat.it/storage/codici-unita-amministrative/Elenco-comuni-italiani.csv")
    )

    output_string = CSV.generate do |csv|
      csv << %w[code province name]

      CSV.foreach(
        tempfile.path,
        col_sep: ";",
        encoding: "iso-8859-1:utf-8",
        headers: true,
        row_sep: "\r\n"
      ) do |row|
        csv << [
          row["Codice Catastale del comune"],
          row["Sigla automobilistica"],
          row["Denominazione in italiano"].upcase
        ]
      end
    end

    File.open("lib/itax_code/data/cities.csv", "w") do |output_file|
      output_file.write(output_string)
    end
  ensure
    tempfile.close
    tempfile.unlink
  end
end
