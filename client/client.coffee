Meteor.subscribe "hours"

Template.hour_list.hours = () ->
  @hours.find {},
    sort:
      time: -1
    transform: (item) ->
      item.created_at = moment(item.created_at).format("DD-MM-YYYY")
      item

Template.hour_form.events =
  'submit form': (event) ->
    event.preventDefault()

    inputField = document.getElementById("add_hours_description")

    data =
      description: inputField.value
      created_at: Date.now()
    
    if data.description.value != ""
      hours.insert data, (error) ->
        if (error)
          console.error "Can't save data: " + data

    inputField.value = ''
