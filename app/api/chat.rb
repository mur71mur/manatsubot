require 'json'
require 'rest-client'
require "cgi"

module Chatbot

  def chat(key, message)
    request_content = {'key' => key, 'message' => CGI.escape(message)}
    request_params = request_content.reduce([]) do |params, (key, value)|
      params << "#{key.to_s}=#{value}"
    end
    rest = RestClient.get('https://chatbot-api.userlocal.jp/api/chat?' + request_params.join('&').to_s)
    result = JSON.parse(rest)
    return result['result']
  end

  module_function :chat

end
#
