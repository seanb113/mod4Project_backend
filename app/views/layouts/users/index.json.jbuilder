json.array! @users do |u|
    json.extract! u, :id, :name
    json.profile_pic_url url_for(u.profile_pic)
end