if github.pr_title.include? '[WIP]'
  warn('PR is classed as Work in Progress')
end

if git.lines_of_code > 200
  warn(':exclamation: Big PR')
end

if github.pr_body.length < 5
  fail "Please provide a summary in the Pull Request description"
end
