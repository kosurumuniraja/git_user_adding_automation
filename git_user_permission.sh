#!/bin/bash

# Function to invite a user to a specific repository with a specified permission level
invite_user_to_repo() {
    local org=$1
    local repo=$2
    local token=$3
    local username=$4
    local permission=$5

    local endpoint="https://api.github.com/repos/$org/$repo/collaborators/$username"
    local response

    # Send a PUT request to invite the user with the specified permissions
    response=$(curl -s -X PUT -H "Authorization: token $token" -H "Accept: application/vnd.github.v3+json" "$endpoint" -d "{\"permission\": \"$permission\"}")

    # Check for errors in the response
    if echo "$response" | grep -q '"message":'; then
        echo "Failed to invite $username to $repo with $permission permissions: $(echo "$response" | grep -oP '"message": "\K[^"]+')"
    else
        echo "Successfully invited $username to $repo with $permission permissions."
    fi
}

# Example usage
# Replace 'BridgestoneGlobal-CB2' with the desired GitHub organization name
# Replace 'your_token_here' with your GitHub Personal Access Token
# Replace 'new_user_username' with the GitHub username of the user to invite

org=""
token=""
username=""

# List of specific repositories to which the user should be added
repos=("MSP")  # Replace with actual repository names

# Desired permission level: admin, push (write), or pull (read)
permission="pull"  # Change to "push-write" or "pull-read" or admin as needed

# Invite user to each specified repository with the specified permission
for repo in "${repos[@]}"; do
    invite_user_to_repo "$org" "$repo" "$token" "$username" "$permission"
done
