require "uri/common"
require "net/http"

module MoSms
  class SMSSender
    attr_accessor :username, :password, :tariff, :allow_long_message, :custom_sender

    def initialize(username, password)
      @username = username
      @password = password
      @tariff = false
      @allow_long_message = false
      @custom_sender = false
    end

    def send(phone_number, message_type, data)
      set_uri(phone_number, data, message_type)

      begin
        response = Net::HTTP.get_response(URI.parse(@api_uri))
      rescue Exception => e
        raise e.message
      end

      result = response.body
      result = code_to_message(result.to_i)

      raise result unless result.empty?

      true

    end


    private
    def set_uri(phone_number, data, message_type)
      tariff = ""
      allow_long_message = ""
      custom_sender = ""

      tariff = "&tariff=1" if @tariff
      allow_long_message = "&allowlong=1" if @allow_long_message
      custom_sender = "&customsender=1" if @custom_sender

      @api_uri = "http://www.mosms.com/se/sms-send.php?username=#{@username}&password=#{password}&nr=#{phone_number}&type=#{message_type}&data=#{data}#{tariff}#{allow_long_message}#{custom_sender}"
      @api_uri = URI.escape(@api_uri)
    end

    def code_to_message(code)
      case code
        when 1
          return "Not sent with the right parameters"
        when 2
          return "Wrong username and/or password"
        when 3
          return "Not enough balance in your MS-SMS account to send the SMS"
        when 4
          return "Wrong TYPE. It should be either \"text\" or \"wap\""
        when 5
          return "Could not access the file/URL. Applicable only when the type is \"wap\""
        when 6
          return "No file extention for the file/URL. Applicable only when the type is \"wap\""
        when 7
          return "Wrong input format for the number."
        when 99
          return "Others errors from the (mobile operator)"
        else
          return ""
      end
    end

  end
end
