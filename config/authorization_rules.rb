authorization do
  role :admin do
    has_permission_on [
      :domains,
      :elements,
      :galleries,
      :pages,
      :paragraphs,
      :pictures,
      :shops,
      :products,
      :users
      ], :to => :administer
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
  
  role :guest do
    has_permission_on [
      :domains,
      :elements,
      :galleries,
      :pages,
      :paragraphs,
      :pictures
      ], :to => [:access]
      has_permission_on :users, :to => :manage do
        
      end
  end
  
end

privileges do
  privilege :access do
    includes :read, :index, :show
  end
  privilege :manage do
    includes :create, :read, :update, :delete, :new_element_attachable_from_params
  end
  privilege :administer do
    includes :manage, :index, :show, :new, :create, :edit, :update, :destroy
  end
end