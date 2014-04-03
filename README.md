mina_slack
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
    set :slack_channels, ['#general']

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
| *__slack_api_token__**    | Sets the slack api auth token.                                                       |
| *__slack_channels__**     | Sets the channels where notifications will be sent to.                               |
| *slack_username*          | Name of bot.                                                                         |
| *slack_author*            | Author of a deploy displayed in deploy messages.                                     |
| *slack_link_names*        | Find and link channel names and usernames.                                           |
| *slack_parse*             | Change how messages are treated. [Read more] (https://api.slack.com/docs/formatting) |

__* required options__

## Todo

* Write some tests

## Copyright

Copyright (c) 2014 Mike Bajur http://github.com/mbajur

See LICENSE for further details.
