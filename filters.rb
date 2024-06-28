# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

require 'date'

# Check candidate's experience
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

# Check for 100 or more Github points
def github_points?(candidate)
  candidate[:github_points] >= 100
end

# Check for Ruby or Python
def knows_ruby_or_python?(candidate)
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
end

# Check if applied in the last 15 days
def applied_recently?(candidate)
  candidate[:date_applied] >= (Date.today - 15)
end

# Check if over the age of 17
def age_qualified?(candidate)
  candidate[:age] > 17
end

# Filter candidates 
def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
    github_points?(candidate) &&
    knows_ruby_or_python?(candidate) &&
    applied_recently?(candidate) &&
    age_qualified?(candidate)
  end
end

# Sort candidates by experience and Github points
def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end

