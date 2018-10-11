#!/bin/bash
mask='password|key|token'          # if you want to mask any other environment variables, add them here
revision=$(git rev-parse HEAD)     # use your build server's variable here if you prefer (e.g. bamboo.planRepository.revision)
profile_name=default
results_path=cucumber-results.json
cucumber -f json -o cucumber-results.json
env |\
  grep --extended-regexp \
  --ignore-case \
  --invert-match "^.*(${mask}).*=" | \
  curl --fail \
  --request POST \
  --form env=@-  \
  --form "profileName=${profile_name}" \
  --form "payload=@${results_path};type=application/x.cucumber.rb.results+json" \
  "https://7a250c6e81fe86e232bdc93a084d86f8b29@app.cucumber.pro/tests/results/check-inbdd/$revision"
