require 'excon'

module AzureSpeechHelper
  def verify_audio_file(profile_id, file_name)
    file = File.open(file_name)
    endpoint =
      "https://westus.api.cognitive.microsoft.com/speaker/verification/v2.0/text-independent/profiles/#{
        profile_id
      }/verify"

    begin
      connection =
        Excon.new(endpoint, debug_request: true, debug_response: true)
      connection.request(
        # interval is in seconds, this will block the client so leaving the limit and interval low
        method: 'POST',
        idempotent: true,
        expects: [200, 201],
        retry_limit: 2,
        retry_interval: 0.5,
        body: file,
        headers: {
          'Content-Type' => 'audio/wave',
          'Ocp-Apim-Subscription-Key' => "#{ENV['AZURE_KEY']}"
        },
        instrumentor: ActiveSupport::Notifications
      ) # ActiveSupport::Notifications is for logging of requests and responses
    rescue Excon::Error => e
      puts "Error: #{e}"
    end
  end
end
