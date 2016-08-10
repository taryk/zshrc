GPG_AGENT_INFO_ENV_FILE=~/.gnupg/gpg-agent-info

[ -f "$GPG_AGENT_INFO_ENV_FILE" ] && source "$GPG_AGENT_INFO_ENV_FILE"
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file "$GPG_AGENT_INFO_ENV_FILE")
fi
