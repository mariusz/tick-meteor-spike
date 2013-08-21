if Meteor.isClient
  Meteor.subscribe("hours", "mariusz")

if Meteor.isServer
  Meteor.startup ->
    Meteor.methods
      create_user: (username) ->
        console.log "Creating user: " + username
        userId = Users.insert
          name: username

    Meteor.publish "messages", (user) ->
      @hours.find
        user: user
