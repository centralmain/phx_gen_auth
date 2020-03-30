
  ## Authentication routes

  scope "/", <%= inspect context.web_module %> do
    pipe_through [:browser, :redirect_if_<%= schema.singular %>_is_authenticated]

    get "/<%= schema.plural %>/register", <%= inspect schema.alias %>RegistrationController, :new
    post "/<%= schema.plural %>/register", <%= inspect schema.alias %>RegistrationController, :create
    get "/<%= schema.plural %>/login", <%= inspect schema.alias %>SessionController, :new
    post "/<%= schema.plural %>/login", <%= inspect schema.alias %>SessionController, :create
    get "/<%= schema.plural %>/reset_password", <%= inspect schema.alias %>ResetPasswordController, :new
    post "/<%= schema.plural %>/reset_password", <%= inspect schema.alias %>ResetPasswordController, :create
    get "/<%= schema.plural %>/reset_password/:token", <%= inspect schema.alias %>ResetPasswordController, :edit
    put "/<%= schema.plural %>/reset_password/:token", <%= inspect schema.alias %>ResetPasswordController, :update
  end

  scope "/", <%= inspect context.web_module %> do
    pipe_through [:browser, :require_authenticated_<%= schema.singular %>]

    delete "/<%= schema.plural %>/logout", <%= inspect schema.alias %>SessionController, :delete
    get "/<%= schema.plural %>/settings", <%= inspect schema.alias %>SettingsController, :edit
    put "/<%= schema.plural %>/settings/update_password", <%= inspect schema.alias %>SettingsController, :update_password
    put "/<%= schema.plural %>/settings/update_email", <%= inspect schema.alias %>SettingsController, :update_email
    get "/<%= schema.plural %>/settings/confirm_email/:token", <%= inspect schema.alias %>SettingsController, :confirm_email
  end

  scope "/", <%= inspect context.web_module %> do
    pipe_through [:browser]

    get "/<%= schema.plural %>/confirm", <%= inspect schema.alias %>ConfirmationController, :new
    post "/<%= schema.plural %>/confirm", <%= inspect schema.alias %>ConfirmationController, :create
    get "/<%= schema.plural %>/confirm/:token", <%= inspect schema.alias %>ConfirmationController, :confirm
  end
