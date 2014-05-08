mina_slack <a href="http://badge.fury.io/rb/mina_slack"><img src="https://badge.fury.io/rb/mina_slack.svg" alt="Gem Version" height="18"></a>
============

mina_slack is a gem that adds tasks for sending notifications to [Slack] (http://slack.com)
using [Mina] (http://nadarei.co/mina).

## Installation

    gem install mina_slack

## Usage example

    require 'mina_slack/tasks'
    ...
    # Required mina_slack options
    set :slack_api_token, 'xxxyyyzzz'
    set :slack_channels, ['#general', '@mbajur', '#nerd']

    task :deploy do
      deploy do
        invoke :'slack:notify_deploy_started'
        ...

        to :launch do
          ...
          invoke :'slack:notify_deploy_finished'
        end
      end
    end

## Available Tasks

* `slack:notify_deploy_started`
* `slack:notify_deploy_finished`

## Available Options

| Option                    | Description                                                                          |
| ------------------------- | ------------------------------------------------------------------------------------ |
| __slack_api_token__       | API auth token.                                                                      |
| __slack_channels__        | Array of channels (or users) where notifications will be sent to.                    |
| slack_username            | Name of bot. <br> _default: Deploy_                                                  |
| slack_author              | Author of a deploy displayed in deploy messages. <br> _default: Someone_             |
| slack_link_names          | Find and link channel names and usernames. <br> _default: 1_                         |
| slack_parse               | Change how messages are treated. [Read more] (https://api.slack.com/docs/formatting) <br> _default: full_ |
| slack_icon_url            | URL to an image to use as the icon for this message <br> _default: nil_ |
| slack_icon_emoji          | emoji to use as the icon for this message. Overrides `slack_icon_url`. <br> _default: :slack:_ |

__* required options__

## Todo

* Write some tests

## Copyright

Copyright (c) 2014 Mike Bajur http://github.com/mbajur

See LICENSE for further details.
