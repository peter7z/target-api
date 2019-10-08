json.id        target.id
json.topic     target.topic, partial: 'topics/info', as: :topic
json.title     target.title
json.radius    target.radius
json.latitude  target.latitude.round(10)
json.longitude target.longitude.round(10)
