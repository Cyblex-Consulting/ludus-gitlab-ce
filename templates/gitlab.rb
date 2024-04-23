external_url '{{ gitlab_url }}'
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "{{ gitlab_smtp }}"
gitlab_rails['smtp_port'] = 25
gitlab_rails['smtp_domain'] = "localhost"
gitlab_rails['smtp_enable_starttls_auto'] = false
gitlab_rails['smtp_tls'] = false
gitlab_rails['gitlab_email_from'] = '{{ gitlab_email_from }}'
gitlab_rails['gitlab_email_display_name'] = '{{ gitlab_displayname }}'
gitlab_rails['gitlab_email_reply_to'] = '{{ gitlab_replyto }}'