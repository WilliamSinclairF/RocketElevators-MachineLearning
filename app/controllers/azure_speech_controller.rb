class AzureSpeechController < ApplicationController
  include AzureSpeechHelper
  def index
    @files = Dir['*.wav'] #Array with files full_names
    @profiles = [
      { name: 'Trevor', id: '486f6c45-826d-43a0-ad8d-18c3cd30d87c' },
      { name: 'Joey', id: '9247d38d-79b1-4eee-b415-da7d8be69b3c' },
      { name: 'William', id: 'c4246a82-8e7f-45fb-afff-08aeb30776b2' }
    ]
  end

  def verify_audio
    file_name = params[:file_name]
    profile_id = params[:profile_id]
    response = verify_audio_file(profile_id, file_name)
    respond_to { |r| r.json { render json: response.body } }
  end
end
