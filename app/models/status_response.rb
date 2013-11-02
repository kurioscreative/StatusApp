class StatusResponse
	PROPERTIES = [:api_status, :js_status, :dashboard_status, :time]
	
	PROPERTIES.each { |prop|
		attr_accessor prop
	}

	def initialize(hash = {})
		hash.each { |key, value| 
			if PROPERTIES.member? key.to_sym
				self.send((key.to_s + "=").to_s, value)
			end
		}
	end

	def self.refresh(&block)
		BubbleWrap::HTTP.get("http://status.balancedpayments.com") do |response|
      html = response.body.to_str

      parser = Hpple.HTML(html)

			api_response = parser.xpath("//*[contains(@class,'API')]/*[contains(@class,'uptime-image')]").to_s
			js_response = parser.xpath("//*[contains(@class,'JS')]/*[contains(@class,'uptime-image')]").to_s
			dashboard_response = parser.xpath("//*[contains(@class,'DASH')]/*[contains(@class,'uptime-image')]").to_s

			response_object = StatusResponse.new({
				api_status: api_response, 
				js_status: js_response, 
				dashboard_status: dashboard_response, 
				time: "#{Time.now.to_s}"
			})
      
      block.call(response_object)
      
    end
	end

end