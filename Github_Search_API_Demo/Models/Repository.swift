//
//  Repository.swift
//  Github_Search_API_Demo
//
//  Created by Bhavesh Lathigara on 02/05/19.
//  Copyright © 2019 Bhavesh Lathigara. All rights reserved.
//

import UIKit

class Repository: NSObject
{
    @objc var name = ""
    
    @objc var full_name = ""
    
    @objc var watchers_count = 0
    
    @objc var avatar_url = ""
    
    @objc var html_url = ""
    
    @objc var strdescription = ""
    
    @objc var contributors_url = ""
    
    @objc var repos_url = ""
    
    /*
    "archive_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/{archive_format}{/ref}";
    archived = 0;
    "assignees_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/assignees{/user}";
    "blobs_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/git/blobs{/sha}";
    "branches_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/branches{/branch}";
    "clone_url" = "https://github.com/IncubedSF/bhaveshc789.github.io.git";
    "collaborators_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/collaborators{/collaborator}";
    "comments_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/comments{/number}";
    "commits_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/commits{/sha}";
    "compare_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/compare/{base}...{head}";
    "contents_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/contents/{+path}";
    "contributors_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/contributors";
    "created_at" = "2016-12-07T02:23:42Z";
    "default_branch" = master;
    "deployments_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/deployments";
    description = "The official SF Hacks 2017 repository";
    disabled = 0;
    "downloads_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/downloads";
    "events_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/events";
    fork = 0;
    forks = 5;
    "forks_count" = 5;
    "forks_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/forks";
    "full_name" = "IncubedSF/bhaveshc789.github.io";
    "git_commits_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/git/commits{/sha}";
    "git_refs_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/git/refs{/sha}";
    "git_tags_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/git/tags{/sha}";
    "git_url" = "git://github.com/IncubedSF/bhaveshc789.github.io.git";
    "has_downloads" = 1;
    "has_issues" = 1;
    "has_pages" = 1;
    "has_projects" = 1;
    "has_wiki" = 1;
    homepage = "http://sfhacks.io/";
    "hooks_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/hooks";
    "html_url" = "https://github.com/IncubedSF/bhaveshc789.github.io";
    id = 75790831;
    "issue_comment_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/issues/comments{/number}";
    "issue_events_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/issues/events{/number}";
    "issues_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/issues{/number}";
    "keys_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/keys{/key_id}";
    "labels_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/labels{/name}";
    language = CSS;
    "languages_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/languages";
    license = "<null>";
    "merges_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/merges";
    "milestones_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/milestones{/number}";
    "mirror_url" = "<null>";
    name = "bhaveshc789.github.io";
    "node_id" = "MDEwOlJlcG9zaXRvcnk3NTc5MDgzMQ==";
    "notifications_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/notifications{?since,all,participating}";
    "open_issues" = 0;
    "open_issues_count" = 0;
    owner =             {
    "avatar_url" = "https://avatars2.githubusercontent.com/u/23042109?v=4";
    "events_url" = "https://api.github.com/users/IncubedSF/events{/privacy}";
    "followers_url" = "https://api.github.com/users/IncubedSF/followers";
    "following_url" = "https://api.github.com/users/IncubedSF/following{/other_user}";
    "gists_url" = "https://api.github.com/users/IncubedSF/gists{/gist_id}";
    "gravatar_id" = "";
    "html_url" = "https://github.com/IncubedSF";
    id = 23042109;
    login = IncubedSF;
    "node_id" = MDEyOk9yZ2FuaXphdGlvbjIzMDQyMTA5;
    "organizations_url" = "https://api.github.com/users/IncubedSF/orgs";
    "received_events_url" = "https://api.github.com/users/IncubedSF/received_events";
    "repos_url" = "https://api.github.com/users/IncubedSF/repos";
    "site_admin" = 0;
    "starred_url" = "https://api.github.com/users/IncubedSF/starred{/owner}{/repo}";
    "subscriptions_url" = "https://api.github.com/users/IncubedSF/subscriptions";
    type = Organization;
    url = "https://api.github.com/users/IncubedSF";
    };
    private = 0;
    "pulls_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/pulls{/number}";
    "pushed_at" = "2018-03-17T18:41:31Z";
    "releases_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/releases{/id}";
    score = "55.483803";
    size = 7703;
    "ssh_url" = "git@github.com:IncubedSF/bhaveshc789.github.io.git";
    "stargazers_count" = 3;
    "stargazers_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/stargazers";
    "statuses_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/statuses/{sha}";
    "subscribers_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/subscribers";
    "subscription_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/subscription";
    "svn_url" = "https://github.com/IncubedSF/bhaveshc789.github.io";
    "tags_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/tags";
    "teams_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/teams";
    "trees_url" = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io/git/trees{/sha}";
    "updated_at" = "2018-03-17T18:41:33Z";
    url = "https://api.github.com/repos/IncubedSF/bhaveshc789.github.io";
    watchers = 3;
    "watchers_count" = 3;*/
}
