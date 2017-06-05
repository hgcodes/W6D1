# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.detect do |candidate|
  candidate[:id] === id
  end
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def github_points?(candidate)
  candidate[:github_points] >= 100
end

def languages?(candidate)
  candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
end


def applied_recently?(candidate)
  (Date.today - candidate[:date_applied]).to_i <= 15
end

def is_eighteen_years_plus?(candidate)
  candidate[:age] >= 18
end

def qualified_candidates(candidates)
  @candidates.select do |candidate|
  github_points?(candidate) && experienced?(candidate) && languages?(candidate) && applied_recently?(candidate) && is_eighteen_years_plus?(candidate)
  end
end

def ordered_by_qualifications(candidates)
  @candidates.sort by do |candidate|
  [candidate[:years_of_experience], candidate[:github_points]]
  end
end

def ordered_by_qualifications(candidates)
  @candidates.sort_by do |candidate|
    [candidate[:years_of_experience], candidate[:github_points]]
  end
end