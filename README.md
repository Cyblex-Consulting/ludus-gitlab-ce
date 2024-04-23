Ludus Role: GitLab Community Edition
=========

This is a role for Ludus that handles the installation of a Gitlab instance.

The role performs the following actions:
- Setup a repository for GitLab
- Install the selected version or the latest version of GitLab Community Edition
- Configure GitLab Community Edition
- Optionnaly, can create arbitrary groups and users


Role Variables
--------------

Multiple variables can be configured. `gitlab.url` is the url where the instance will be exposed. Other parameters are related to the SMTP configuration.

```yaml
gitlab:
  smtp: 127.0.0.1
  url: http://localhost:8080
  email_from: gitlab@example.com
  displayname: gitlab
  replyto: no-reply@example.com
  emailroot: admin@example.com
```

By default, the latest version is installed. Define the variable `version` with the value in the range if you need a specific version.

For the groups and users, they are optionnaly configured in `gitlab.groups` and `gitlab.users`.

A full VM may look like this in the range configuration:

```yaml
  - vm_name: "{{ range_id }}-GIT-01"
    hostname: "{{ range_id }}-GIT-01"
    template: debian-12-x64-server-template
    vlan: 55
    ip_last_octet: 2
    dns_rewrites: 
      - git.myrange.corp
    ram_gb: 8
    cpus: 2
    linux: true
    testing:
      snapshot: true
      block_internet: false
    roles:
      - gitlab-ce
    role_vars:
      gitlab:
        version: 16.7.0
        smtp: 1.2.3.4
        email_from: gitlab@myrange.corp
        emailroot: admin@myrange.corp
        displayname: Gitlab MyRange
        replyto: no-reply@myrange.corp
        url: http://git.myrange.corp
        groups:
          - name: IT
          - name: Engineering
        users:
          - name: jdoe
            display_name: John Doe
            password: aA8MaQBCtBtPYAFh
            email: jdoe@myrange.corp
            group: Engineering
            access_level: maintainer
          - name: msmith
            display_name: Mike Smith
            password: 25H60eORSggFfH2Y
            email: msmith@myrange.corp
            group: IT
            access_level: maintainer
```