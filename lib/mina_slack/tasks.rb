require 'json'

# ## Settings
# Any and all of these settings can be overriden in your `deploy.rb`.

# ### slack_api_token
# Sets the slack api auth token.
set_default :slack_api_token, ''

# ### slack_channels
# Sets the channels where notifications will be sent to.
set_default :slack_channels, []

# ### slack_username
# Sets the notification 'from' user label
set_default :slack_username, 'Deploy'

# ### slack_author
# Sets the deployment author name
set_default :slack_author, 'Someone'

# ### slack_link_names
# Sets the deployment author name
set_default :slack_link_names, 1

# ### slack_parse
# Sets the deployment author name
set_default :slack_parse, 'full'

# ### icon_url
# URL to an image to use as the icon for this message
set_default :slack_icon_url, ''

# ### icon_emoji
# Sets emoji to use as the icon for this message. Overrides `slack_icon_url`
set_default :slack_icon_emoji, ':slack:'

# ## Control Tasks
namespace :slack do

  # ## slack:notify_deploy_started
  desc "Send slack notification about new deploy start"
  task :notify_deploy_started => :environment do
    queue  %[echo "-----> Sending start notification to Slack"]
    text = "#{slack_author} is deploying #{application}..."

    for channel in slack_channels
      send_message(
        channel: channel,
        text:    text
      )
    end
  end

  # ## slack:notify_deploy_finished
  desc "Send slack notification about deploy finish"
  task :notify_deploy_finished => :environment do
    queue  %[echo "-----> Sending finish notification to Slack"]

    text  = "#{slack_author} finished deploying #{application}."
    text += " See it here: http://#{domain}" if domain != nil

    for channel in slack_channels
      send_message(
        channel:     channel,
        text:        text,
        attachments: attachments
      )
    end
  end

  def send_message(params = {})
    queue %[curl -X POST https://slack.com/api/chat.postMessage -d "token=#{slack_api_token}&channel=#{params[:channel]}&username=#{slack_username}&text=#{params[:text]}&attachments='[{"fields": [{"value": "Value"}]}]'&parse=#{slack_parse}&link_names=#{link_names}&icon_url=#{slack_icon_url}&icon_emoji=#{slack_icon_emoji}" --silent > /dev/null]
  end

end