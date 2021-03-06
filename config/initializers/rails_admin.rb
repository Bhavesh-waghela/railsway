RailsAdmin.config do |config|

  ### Popular gems integration

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin?
  end

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model 'User' do
    list do
      field :id
      field :email
      field :name
      field :sign_in_count
      field :current_sign_in_at
      field :role
    end
  end

  config.model 'Tutorial' do
    list do
      field :id
      field :title
      field :description
      field :created_at 
    end

    edit do
      field :title
      field :description, :wysihtml5 do
        config_options toolbar: { fa: true }, # use font-awesome instead of glyphicon
               html: true, # enables html editor
               parserRules: { tags: { p:1 } } # support for <p> in html mode
      end
    end
  end

  config.model 'Solution' do
   list do
    field :question
    field :answer
    field :tag_list
   end

    edit do
      field :question
      field :answer, :wysihtml5 do
         config_options toolbar: { fa: true }, # use font-awesome instead of glyphicon
                 html: true, # enables html editor
                 parserRules: { tags: { p:1 } } # support for <p> in html mode
      end
      field :tag_list do
        html_attributes do
          {:style => "width:90%"}
        end
      end
    end
  end
end

  