#!/usr/bin/env bash
# Opens one GitHub Issue per day, due-dated by title. Run after `gh auth login`.
set -euo pipefail
REPO="${1:?usage: ./scripts_create_issues.sh owner/repo}"
gh label create mission --repo "$REPO" --color 0E8A16 --description "Daily N5 Biology mission" 2>/dev/null || true
declare -a T=(
"Day 01 — Tue 22 Sep — Ecosystems"
"Day 02 — Wed 23 Sep — Distribution of organisms"
"Day 03 — Thu 24 Sep — Photosynthesis"
"Day 04 — Fri 25 Sep — Energy in ecosystems"
"Day 05 — Sat 26 Sep — Food production 1: fertilisers"
"Day 06 — Sun 27 Sep — Food production 2: pesticides"
"Day 07 — Mon 28 Sep — Evolution 1: natural selection"
"Day 08 — Tue 29 Sep — Speciation + Unit 3 mini-paper"
"Day 09 — Wed 30 Sep — Cell structure"
"Day 10 — Thu 1 Oct — Transport across cell membranes"
"Day 11 — Fri 2 Oct — DNA and the production of proteins"
"Day 12 — Sat 3 Oct — Proteins and enzymes"
"Day 13 — Sun 4 Oct — Exam skills"
"Day 14 — Mon 5 Oct — Full mock paper"
)
for i in "${!T[@]}"; do
  n=$(printf "%02d" $((i+1)))
  gh issue create --repo "$REPO" --title "${T[$i]}" --label mission --body \
"Mission file: [\`days/day-$n.md\`](days/day-$n.md)

- [ ] Warm-up
- [ ] Core drill
- [ ] Exam reps written out
- [ ] Boss question
- [ ] Marked honestly
- [ ] Lost marks added to SCOREBOARD.md

XP earned:"
done
echo "14 issues created."
