#!/bin/sh
set -e

EXPECTED="$(git config --local hook.userIdentity)"
if [ -z "$EXPECTED" ]; then
  echo "ERROR: hook.userIdentity is not set for this repo."
  echo "Fix with: git config --local hook.userIdentity \"NOVAInetwork <NOVAInetwork@protonmail.com>\""
  exit 1
fi

AUTHOR="$(git var GIT_AUTHOR_IDENT | sed -E 's/ [0-9]+ [+-][0-9]{4}$//')"
COMMITTER="$(git var GIT_COMMITTER_IDENT | sed -E 's/ [0-9]+ [+-][0-9]{4}$//')"

if [ "$AUTHOR" != "$EXPECTED" ] || [ "$COMMITTER" != "$EXPECTED" ]; then
  echo "ERROR: Git identity mismatch."
  echo "Expected: $EXPECTED"
  echo "Author:   $AUTHOR"
  echo "Committer:$COMMITTER"
  exit 1
fi
