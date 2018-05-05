require "wechat_work/version"
require "rest-client"
require "json"

module WechatWork
  module Config
    extend self

    attr_accessor :corpid
    attr_accessor :agentid
    attr_accessor :agentsecret
    
    def reset
      self.corpid = nil
      self.agentid = nil
      self.agentsecret = nil
    end

    reset
  end

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end

  class AccessTokenError < StandardError
  end

  class Wechat
    def initialize
      @corpid = WechatWork.config.corpid
      @agentid = WechatWork.config.agentid
      @agentsecret = WechatWork.config.agentsecret

      @token = access_token
      @token_expire = 0
      @last_get_token_time = 0
    end

    def access_token
      url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=#{@corpid}&corpsecret=#{@agentsecret}"
      resp = RestClient.get url
      data = JSON.parse(resp)
      unless data['errcode'] == 0
        puts data
        raise AccessTokenError.new()
      end

      @token = data["access_token"]
      @last_get_token_time = Time.now.to_i
      @token_expire = data["expires_in"]

      @token
    end

    def token_invalid?
      return true unless @token
      Time.now().to_i - @last_get_token_time > (@token_expire - 100)
    end
    

    def send_text_message(content, *users)
      return unless content
      return if content.length == 0
      return if users.length == 0
      
      # 使用缓存token
      access_token if token_invalid?

      touser = users.join('|')  

      url = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=#{@token}"
      payload = {
        touser: touser,
        msgtype: 'text',
        agentid: @agentid,
        text: {
          content: content
        }
      }

      resp = RestClient.post url, payload.to_json, {content_type: :json, accept: :json}
      data = JSON.parse(resp)

      if data['errcode'] != 0
        puts "send failed errorcode: #{data['errcode']}"
      end
    end
  end
end
