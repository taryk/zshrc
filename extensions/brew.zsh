# There is API rate limit on GitHub, so if you make a lot of requests, you
# may end up being banned for a while. To avoid that, it makes sense to
# generate a new GitHub API token https://github.com/settings/tokens, and make
# Homebrew use it.
export HOMEBREW_GITHUB_API_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

if [[ -d "/usr/local/sbin" ]]; then
    PATH="/usr/local/sbin:${PATH}"
fi
