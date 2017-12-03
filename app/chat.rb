require 'json'
require 'rest-client'
require "cgi"

request_content = {'key' => 'sample', 'message' => CGI.escape('こんにちは')}
request_params = request_content.reduce([]) do |params, (key, value)|
  params << "#{key.to_s}=#{value}"
end
rest = RestClient.get('https://chatbot-api.userlocal.jp/api/chat?' + request_params.join('&').to_s)
result = JSON.parse(rest)
p result['result']
