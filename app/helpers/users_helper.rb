module UsersHelper

    def gravatar_for(user)
        digest = Digest::MD5.hexdigest(current_user.email)
        url = 'https://www.gravatar.com/avatar/#{digest}'
        image_tag(url, alt: current_user.profile.name)
      end
    

end
