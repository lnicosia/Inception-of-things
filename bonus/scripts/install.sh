# Gitlab dependencies
sudo apt-get install ca-certificates curl openssh-server postfix -y

# Gitlab installation
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
sudo bash script.deb.sh
sudo apt-get install gitlab-ce

# Thank you for installing GitLab!
# GitLab was unable to detect a valid hostname for your instance.
# Please configure a URL for your GitLab instance by setting `external_url`
# configuration in /etc/gitlab/gitlab.rb file.
# Then, you can start your GitLab instance by running the following command:
#   sudo gitlab-ctl reconfigure

sudo gitlab-ctl reconfigure

# iot.gitlab
# Change root's password
# sudo gitlab-rake "gitlab:password:reset[root]"
