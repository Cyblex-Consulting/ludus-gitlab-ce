external_url '{{ gitlab.url }}'
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "{{ gitlab.smtp }}"
gitlab_rails['smtp_port'] = 25
gitlab_rails['smtp_domain'] = "localhost"
gitlab_rails['smtp_enable_starttls_auto'] = false
gitlab_rails['smtp_tls'] = false
gitlab_rails['gitlab_email_from'] = '{{ gitlab.email_from }}'
gitlab_rails['gitlab_email_display_name'] = '{{ gitlab.displayname }}'
gitlab_rails['gitlab_email_reply_to'] = '{{ gitlab.replyto }}'