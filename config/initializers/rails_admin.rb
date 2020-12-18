RailsAdmin.config do |config|
  config.authorize_with :cancancan

  config.model 'Address' do
    object_label_method { :custom_label_method }
    exclude_fields :id
    navigation_label 'Buildings'
  end

  config.model 'Building' do
    exclude_fields :id, :address_id, :building_detail_id
    navigation_label 'Buildings'
  end

  config.model 'Battery' do
    exclude_fields :id
    navigation_label 'Buildings'
  end

  config.model 'Column' do
    exclude_fields :id
    navigation_label 'Buildings'
  end

  config.model 'Elevator' do
    exclude_fields :id
    navigation_label 'Buildings'
  end

  config.model 'BuildingDetail' do
    object_label_method { :custom_label_method }
    exclude_fields :id
    navigation_label 'Buildings'
  end

  config.model 'Customer' do
    object_label_method { :custom_label_method }
    navigation_label 'Customers'

    exclude_fields :id
  end

  config.model 'Quote' do
    navigation_label 'Customers'
  end

  config.model 'Lead' do
    navigation_label 'Customers'
  end

  config.model 'Intervention' do
    navigation_label 'Customers'
  end

  config.model 'FactElevator' do
    navigation_label 'Statistics'
  end

  config.model 'FactQuote' do
    navigation_label 'Statistics'
  end

  config.model 'FactContact' do
    navigation_label 'Statistics'
  end

  config.model 'DimCustomer' do
    navigation_label 'Statistics'
  end

  config.model 'FactIntervention' do
    navigation_label 'Statistics'
  end

  config.model 'User' do
    object_label_method { :custom_label_method }
    exclude_fields :id
    navigation_label 'Account Administration'
  end

  config.model 'Employee' do
    object_label_method { :custom_label_method }
    exclude_fields :id
    navigation_label 'Account Administration'
  end

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with { warden.authenticate! scope: :user }

  config.current_user_method(&:current_user)

  config.main_app_name = ['Rocket Elevators', 'BackOffice']

  config.navigation_static_label = 'Tools'
  config.navigation_static_links = {
    'Customer Map' => '/addresses',
    'Intervention Form' => '/interventions/new',
    'Speech  Recognition' => '/speech',
    'Speech Transcription' => '/speech/transcribe'
  }

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard # mandatory
    index # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
