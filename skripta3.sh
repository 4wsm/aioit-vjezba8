#!/bin/bash

# url stranice
url="https://support.microsoft.com/hr-hr/topic/opis-teksta-lorem-ipsum-dolor-sit-amet-koji-se-prikazuje-u-sustavu-pomo%C4%87i-programa-word-bf3b0a9e-8f6b-c2ab-edd9-41c1f9aa2ea0"

# Dohvaćanje sadržaja stranice
content=$(curl -s "$url")

# Brojanje pojave riječi 'lorem' (case-insensitive)
word_count=$(echo "$content" | tr '[:upper:]' '[:lower:]' | grep -o "lorem" | wc -l)

echo "Riječ 'lorem' pojavljuje se $word_count puta."

