authorization do
  role :admin do
    has_permission_on [
      :domains,
      :elements,
      :galleries,
      :pages,
      :paragraphs,
      :pictures,
      :users
      ], :to => :manage
    has_permission_on :authorization_rules, :to => :read
  end

  role :author do
    includes :guest
    has_permission_on [
      :domains,
      :elements,
      :galleries,
      :pages,
      :paragraphs,
      :pictures
      ], :to => [:new, :create]
  end
  
end

privileges do
  privilege :manage do
    includes :create, :read, :update, :delete
  end
end