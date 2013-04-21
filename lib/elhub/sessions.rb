class Sessions
  def self.create options
    Session.new(options[:email])
  end

  class Session
    attr_accessor :email, :browser

    def initialize(email)
      @email = email
    end

    def project_list
      browser.dashboard.forms.first.fields[6].options.map(&:text)
    end

    private
    def browser
      @browser ||= Browser.new
    end

  end

  class Browser
    HOME_URL  = 'http://hub.aenima.pl/users/auth/google_apps'

    attr_accessor :agent
    attr_accessor :dashboard

    def initialize
      if cookies?
        restore_cookies
        @dashboard = connect
      else
        login
      end
    end

    def login
      login_form = start_page.form_with(action: /LoginAction/)

      login_form.Email = ENV['USERNAME']
      login_form.Passwd = ENV['PASSWORD']

      agent.submit(login_form).tap do |result|
        if result.uri.to_s == "http://hub.aenima.pl/employee/activities"
          store_cookies

          @dashboard = result
        else
          raise 'connection problem. try again in a few seconds'
        end
      end
    end

    def start_page
      @start_page ||= connect
    end

    private
    def connect
      agent.get(HOME_URL)
    end

    def agent
      @agent ||= Mechanize.new.tap do |agent|

        #agent.log = Logger.new("mech.log")
        agent.user_agent_alias = 'Linux Mozilla'

        agent.open_timeout = ENV['OPEN_TIMEOUT'].to_i
        agent.read_timeout = ENV['READ_TIMEOUT'].to_i

        agent.keep_alive   = true
        agent.redirect_ok  = true

      end
    end

    def cookies?
      File.exists?('.hub.aenima.cookies')
    end

    def restore_cookies
      agent.cookie_jar.load('.hub.aenima.cookies', :cookiestxt)
    end
    def store_cookies
      agent.cookie_jar.save_as('.hub.aenima.cookies', :cookiestxt)
    end
  end

end
