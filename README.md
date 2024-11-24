# git_user_adding_automation

This Bash script automates the process of inviting a user to specific GitHub repositories within an organization and assigning them a specified permission level. Below is a detailed breakdown:

1. Function Definition: invite_user_to_repo
This function performs the following steps:

**#Parameters**:

**org**: GitHub organization name.

**repo**: Repository name within the organization.

**token**: GitHub Personal Access Token (PAT) for authentication.

**username:** GitHub username of the user to be invited.

**permission**: Permission level to grant the user (admin, push, or pull).

**API Endpoint**: Constructs a GitHub REST API v3 URL:

https://api.github.com/repos/$org/$repo/collaborators/$username.

**Send API Request:** Sends a PUT request using curl to invite the user with the specified permissions. The request includes:

Authorization header (Authorization: token $token).

JSON body with the desired permission level (-d "{\"permission\": \"$permission\"}").

**Response Handling**:

If the response contains an error message ("message":), it extracts and displays the error message.

Otherwise, it confirms successful invitation.

**2. Example Usage**
   
The script provides an example of how to use the function:

**Variables:**

**org:** Organization name (e.g., BridgestoneGlobal-CB2).

**token:** Your GitHub Personal Access Token (must have repo or admin:org scope).

**username:** GitHub username of the user to invite.

**Repositories**:

Defined in the repos array. For example: repos=("MSP").

Add more repositories to the array as needed.

**Permission Level**:

Defaults to pull (read-only access). You can change this to:

push for write access.

admin for full administrative rights.

3. **Loop to Invite User**
   
Iterates over the repos array.

Invites the specified user to each repository listed in the array by calling invite_user_to_repo with the appropriate arguments.

Execution Example

Before running the script:

Replace placeholders:

org with your organization name.

token with your GitHub PAT.

username with the target GitHub username.

Add repository names in the repos array.

Adjust permission as needed.
