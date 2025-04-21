class ApplicantReportsController < ApplicationController
  def index
    salary_ranges = [
      { label: 'Até R$ 1.045,00', range: 0..1045.00 },
      { label: 'De R$ 1.045,01 a R$ 2.089,60', range: 1045.01..2089.60 },
      { label: 'De R$ 2.089,61 até R$ 3.134,40', range: 2089.61..3134.40 },
      { label: 'De R$ 3.134,41 até R$ 6.101,06', range: 3134.41..6101.06 }
    ]

    @data = salary_ranges.map do |range_info|
      Applicant.count { |e| range_info[:range].include?(e.salary) }
    end
  end
end
