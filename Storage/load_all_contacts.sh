#!/bin/bash
# Unified Master Contact Registry

# Initialize the master associative array
declare -A MASTER_CONTACTS

# Recent Network & Professional Contacts
MASTER_CONTACTS["Carla Cooper"]="carla.cooper@example.com"
MASTER_CONTACTS["Janice Hurst"]="janice.hurst@example.com"
MASTER_CONTACTS["Jessie Harris"]="jessie.harris@example.com"
MASTER_CONTACTS["Alberta Riley"]="alberta.riley@example.com"
MASTER_CONTACTS["Dula Allatif"]="dula.allatif@example.com"
MASTER_CONTACTS["Dwanese Morgan"]="dwanese.morgan@example.com"
MASTER_CONTACTS["Sylvia ITG"]="sylvia@example.com"
MASTER_CONTACTS["Ronny ITG"]="ronny@example.com"

# Historical & Documentation Records
MASTER_CONTACTS["Damon Kincaid"]="damon.kincaid@example.com"
MASTER_CONTACTS["Angelique Kincaid"]="angelique.kincaid@example.com"

echo "=================================================="
echo "[+] Master Registry Loaded: ${#MASTER_CONTACTS[@]} Contacts Active"
echo "=================================================="
for name in "${!MASTER_CONTACTS[@]}"; do
    echo " -> Partner Node: $name | Destination: ${MASTER_CONTACTS[$name]}"
done
echo "=================================================="
